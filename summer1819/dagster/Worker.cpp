#include "Worker.h"
#include "Cnf.h"
#include "Dag.h"
#include "SatSolver.h"
#include "message.h"
#include "utilities.h"
#include <algorithm>
#include <argp.h>
#include <cstdio>
#include <cstdlib>
#include <glog/logging.h>
#include <iostream>
#include <mpi.h>
#include <stack>
#include "arguments.h"
#include "mpi_global.h"
#include "CnfHolder.h"
#include "exceptions.h"

extern CnfHolder* cnf_holder;
extern Arguments command_line_arguments;


// Worker main loop
void Worker::loop() {
  int solution_count = 0;
  Message* m2 = new Message();
  while (true) {
    VLOG(3) << "WORKER " << comms->world_rank << ": waiting for assignment";
    auto [master_rank,message_tag, m] = comms->receive_message();
    if (message_tag == MPI_TAG_NEW_ASSIGNMENT) {
      VLOG(4) << "WORKER " << comms->world_rank << ": received new assignment";
      if (m==NULL)
        throw ConsistencyException("master threw worker new assignment tage with empty message");
      m->from = m->to; // shift the 'to' to the 'from' - as the destination of the message is now the originator
      m2->from = m->to;
      m2->to = m->to;
      VLOG(4) << "WORKER " << comms->world_rank << ": loading into SAT; node " << m->from;
      VLOG(4) << "I HAVE RECIEVED MESSAGE: " << *m;
      initialise_solver_from_message(m);
    }
    if ((message_tag == MPI_TAG_POLL_FOR_REASSIGNMENT) || (message_tag == MPI_TAG_NEW_ASSIGNMENT)) {
      VLOG(4) << "WORKER " << comms->world_rank << ": generating new solution";
      solution_count = 0;
generate_new_result:
      int result = solve_and_generate_message(m2);
      VLOG(4) << "WORKER " << comms->world_rank << ": generated solution " << result;
      if (result == false) {
        VLOG(3) << "WORKER " << comms->world_rank << ": finished generating new solutions, sending assignment request";
        comms->send_tag(0, MPI_TAG_REQUEST_FOR_ASSIGNMENT);
      } else if (result == 2) { // sat solver stalled for poll for reassignment from master.
        VLOG(3) << "WORKER " << comms->world_rank << ": sending poll request";
        comms->send_tag(0, MPI_TAG_POLL_FOR_REASSIGNMENT);
      } else if (result == true) {
        VLOG(4) << "WORKER " << comms->world_rank << ": Solution message mapped to: " << *m2;
        // send the full solution to master
        comms->send_message(0, MPI_TAG_SOLUTION, m2);
        solution_count++;
        VLOG(4) << "WORKER " << comms->world_rank << ": resetting sathandler";
        if (!reset_solver_for_next_solution(m2->to)) {
          VLOG(3) << "WORKER " << comms->world_rank << ": finished generating new solutions, sending assignment request";
          comms->send_tag(0, MPI_TAG_REQUEST_FOR_ASSIGNMENT);
        } else if (solution_count >= command_line_arguments.sat_solution_interrupt) {
          VLOG(3) << "WORKER " << comms->world_rank << ": sending poll request due to solution count";
          comms->send_tag(0, MPI_TAG_POLL_FOR_REASSIGNMENT);
        } else
          goto generate_new_result;
      }
    } else if (message_tag == MPI_TAG_KILL) {
      VLOG(3) << "WORKER " << comms->world_rank << ": received kill signal";
      break;
    } else
      LOG(ERROR) << "WORKER " << comms->world_rank << ": received a message with unknown tag: " << message_tag;
    if (m!=NULL)
      delete m;
  }
  delete m2;
}


// destructor sends kill signals to all gnovelties and strengthener
Worker::~Worker() {
  if (solver != NULL) delete solver;
  if (generated_cnf != NULL) delete generated_cnf;
  int kill_signal = -1;
  if (communicator_sls != NULL) {
    int comm_size;
    MPI_Comm_size(*communicator_sls, &comm_size);
    for (int i = 1; i < comm_size; i++) // kill each gnovelty
      MPI_Send(&kill_signal, 1, MPI_INT, i, CNF_FILENAME_LENGTH_TAG, *communicator_sls);
  }
  if (communicator_strengthener != NULL)    // kill the reducer
    MPI_Send(&kill_signal, 1, MPI_INT, 1, CNF_FILENAME_LENGTH_TAG, *communicator_strengthener);
}


// After solving with SATsolver instance, reset to beginning with an additional clause that is negative the previous solution.
bool Worker::reset_solver_for_next_solution(int node) {
  if (solver == NULL)
    throw ConsistencyException("reset_solver_for_next_solution method called with NULL solver");
  // clear and load a new conflict clause, from the negation solver's satisfying variables that are also in the amalgamated_forward_connection_literals
  // or if amalgamated_forward_connection_literals are empty, then the node is a terminal node, and add all the literals to a conflict clause, to avoid repetition of a final solution.
  std::deque<int> conflicts;
  conflicts.clear();
  if (dag->amalgamated_forward_connection_literals[node].size() > 0) { 
    solver->load_into_deque(conflicts, dag->amalgamated_forward_connection_literals[node]);
  } else { // if terminal node then negate literals that are reported and add as a clause
    solver->load_into_deque(conflicts, dag->reporting);
  }
  for (int i=0; i<conflicts.size(); i++) {
    conflicts[i] *= -1;
  }
  VLOG(4) << "WORKER " << comms->world_rank << ": adding SAT conflict clause: " << conflicts;
  if (conflicts.size() == 0)
    return false; // if the solver has passed-on an empty message, then adding the negation of the empty clause is senseless and we are done.
  solver->solver_add_conflict_clause(conflicts);
  return solver->reset_solver();
}


// given a message from the master m for the worker operating at node,
// boot up a TinySAT instance, and load forward and reverse mappings between the variables of the TinySAT instance and the master problem
// with additional clauses, formatted as a null terminated list of points to null terminated integer sequences.
void Worker::initialise_solver_from_message(Message* m) {
  if (solver != NULL) {
    delete solver;
    delete generated_cnf;
  }
  generated_cnf = cnf_holder->compile_Cnf_from_Message(m);

  //if (VLOG_IS_ON(5)) { VLOG(5) << " WORKER " << comms->world_rank << ":" << " from " << *m << ": CNF LOADED " << std::endl; generated_cnf->print(); }
  if (VLOG_IS_ON(5)) { VLOG(5) << " WORKER " << comms->world_rank << ":" << " from " << *m << ": CNF LOADED " << std::endl; generated_cnf->output_dimacs("cnf_for_testing.cnf"); }
  //assert(0);
  // boot a new TinySAT solver on this Cnf, delete the now redundant Cnf, and return the new solver.

  int dehydrated_size = m->get_dehydrated_size();
  int* dehydrated_message;
  TEST_NOT_NULL(dehydrated_message = (int*)calloc(sizeof(int),dehydrated_size))
  m->dehydrate(dehydrated_message);

dehydrated_size++;
dehydrated_message = (int*)realloc(dehydrated_message,sizeof(int)*(dehydrated_size));
dehydrated_message[dehydrated_size-1] = phase;

  // send dag index to gnovelties
  if (communicator_sls != NULL) {
    int comm_size;
    MPI_Comm_size(*communicator_sls, &comm_size);
    for (int helper_rank = 1; helper_rank < comm_size; helper_rank++) {
      MPI_Send(&dehydrated_size, 1, MPI_INT, helper_rank, CNF_FILENAME_LENGTH_TAG, *communicator_sls);
      MPI_Send(dehydrated_message, dehydrated_size, MPI_INT, helper_rank, CNF_FILENAME_TAG, *communicator_sls);
    }
  }

  // send filename to reducer
  if (communicator_strengthener != NULL) {
    MPI_Send(&dehydrated_size, 1, MPI_INT, 1, CNF_FILENAME_LENGTH_TAG, *communicator_strengthener);
    MPI_Send(dehydrated_message, dehydrated_size, MPI_INT, 1, CNF_FILENAME_TAG, *communicator_strengthener);
  }
  free(dehydrated_message);

  // generate new solver instance
  solver = new SatSolver(generated_cnf, command_line_arguments.decision_interval, command_line_arguments.suggestion_size, communicator_sls, communicator_strengthener, false, false, command_line_arguments.heuristic_rotation_scheme, phase++);
  if (solver->solver_unit_contradiction == true) {
    VLOG(2) << " WORKER " << comms->world_rank << ": contradiction unit clauses" << std::endl;
  }
}


// for the loaded solver, attempt to solver, returning 0 if UNSAT, 1 if SAT, 2 if paused
// if SAT, load the solution into message *m
int Worker::solve_and_generate_message(Message* m) {
  if ((solver == NULL) || (m==NULL))
    throw ConsistencyException("solve_and_generate_message method called with NULL solver or message");
  int result = solver->run();
  if (result == true) {
    if (dag->amalgamated_forward_connection_literals[m->to].size() > 0) {
      solver->load_into_message(m,dag->amalgamated_forward_connection_literals[m->to]);
    } else {
      solver->load_into_message(m,dag->reporting);
    }
  }
  return result;
}




