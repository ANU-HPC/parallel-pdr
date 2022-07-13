#include "LingelingWorker.h"
#include "Cnf.h"
//#include "SatSolver.h"
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
#include "exceptions.h"
#include "../property_directed_reachability.h"

#define ADD_CLAUSES_FROM 123

extern Arguments command_line_arguments;

// Worker main loop
void LingelingWorker::loop(string in_tmp_dir, const map<int, vector<int>>& in_subproblem_to_propositions, const map<int, vector<int>>& in_subproblem_to_assumptions) {
  subproblem_to_assumptions = in_subproblem_to_assumptions;
  subproblem_to_propositions = in_subproblem_to_propositions;
  tmp_dir = in_tmp_dir;
  Message* return_message = new Message();
  make_solver_exist(0); // Do setup here - implicitly loads in the CNF to the base solver

  while (true) {
    auto [master_rank,message_tag, incoming_message] = comms->receive_message();

    if (message_tag == MPI_TAG_NEW_ASSIGNMENT) {
      VLOG(3) << "LingelingWORKER " << comms->world_rank << ": recieved new assignment";
      assert (incoming_message!=NULL);
      if (solve(incoming_message, return_message)) comms->send_message(0, MPI_TAG_SOLUTION, return_message);
      else                                         comms->send_message(0, MPI_TAG_REQUEST_FOR_ASSIGNMENT, return_message);
    } else if (message_tag == MPI_TAG_NEW_CLAUSES) {
      VLOG(3) << "LingelingWORKER " << comms->world_rank << ": recieved new clauses";
      assert (incoming_message!=NULL);
      add_clauses(incoming_message);
      //comms->send_tag(0, MPI_TAG_DONE_ADDING);
    } else if (message_tag == MPI_TAG_KILL) {
      VLOG(3) << "LingelingWORKER " << comms->world_rank << ": received kill signal";
      break;
    } else assert(0);
    delete incoming_message;
  }

  delete return_message;
}

LingelingWorker::LingelingWorker(MPICommsInterface* comms) {
  this->comms = comms;
}

// destructor sends kill signals to all gnovelties and strengthener
LingelingWorker::~LingelingWorker() {
  for (int i=0; i<solvers.size(); i++) {
    if (solvers[i] != NULL) delete solvers[i];
    solvers[i] = NULL;
  }
}


// After solving with SATsolver instance, reset to beginning with an additional clause that is negative the previous solution.
bool LingelingWorker::reset_solver_for_next_solution(int node) {
  // Don't worry about it
  return true;
}

void LingelingWorker::make_solver_exist(int solver) {
  // set up solver(s)
  while (solvers.size() <= solver) {
    // Set up the original to copy off if does not exist
    if (baseLingeling == NULL) {
      if (MS_ONLY_MAX_SOLVER_STEP != 1) {
        cout << "ERROR, dagster in use, must only use max number of steps";
        exit(1);
      }
      if (MAX_SOLVER_STEPS != MS_DEFAULT_STEPS_USED) {
        cout << "ERROR, dagster in use, default must be the max";
        exit(1);
      }

      baseLingeling = new Lingeling((tmp_dir + "/tmp_regular_" + to_string(MS_DEFAULT_STEPS_USED) + ".cnf").c_str());
      const vector<int> blank = vector<int>();
      baseLingeling->solve(blank);
    }

    //Lingeling* new_solver = new Lingeling((tmp_dir + "/tmp_regular.cnf").c_str());
    Lingeling* new_solver = new Lingeling(baseLingeling);
    //const vector<int> blank = vector<int>();
    //new_solver->solve(blank);
    solvers.push_back(new_solver);
  }
}

void LingelingWorker::add_clauses(Message* incoming_message) {
  assert(incoming_message->from == ADD_CLAUSES_FROM);
  const int max_solver = incoming_message->to;
  make_solver_exist(max_solver);

  for (int c = 0; c < incoming_message->additional_clauses->cc; c++) {
    vector<int> clause;
    for (int i = 0; i < incoming_message->additional_clauses->cl[c]; i++) {
      clause.push_back(incoming_message->additional_clauses->clauses[c][i]);
    }
    for (int solver = 0; solver<= max_solver; solver++) solvers[solver]->add_clause(PDR::convert_clause_for_steps(clause, MAX_SOLVER_STEPS));
  }
}

int LingelingWorker::solve(Message* incoming_message, Message* return_message) {
  const int solver = incoming_message->to;
  const int subproblem = incoming_message->from;
  const int reduce = incoming_message->reduce; // reduce or not (for clause pushing)

  return_message->to = solver;
  return_message->from = subproblem;
  return_message->id = incoming_message->id;
  return_message->reduce = reduce;

  const vector<int>& main_assumptions = incoming_message->assignments;
  const vector<int>& extra_assumptions = subproblem_to_assumptions[subproblem];

  make_solver_exist(solver);

  // printing
  //cout << "main assumptions ";
  for (auto it=main_assumptions.begin(); it!=main_assumptions.end(); it++) {
    //cout << *it << " ";
  }
  //cout << endl << "extra assumptions, subproblem : " << endl;
  for (auto it=extra_assumptions.begin(); it!=extra_assumptions.end(); it++) {
    //cout << *it << " ";
  }
  //cout << endl;

  if (solvers[solver]->solve_unmentioned_assumptions(main_assumptions, extra_assumptions)) {
    return_message->assignments = solvers[solver]->get_model(); // cout << "Worker " << comms->world_rank << " found a successor state for state with ID " << incoming_message->id << endl;
    return 1;
  } else {
    if (reduce == 0) {
      return_message->assignments = solvers[solver]->used_assumptions();
      return 0;
    }

    // Get a set of used reasons
    vector<int> running_reason = solvers[solver]->used_assumptions();

    //return_message->assignments = running_reason;
    //return 0;

    const vector<int>& propositions_to_exclude = subproblem_to_propositions[subproblem];

    for (int i=0; i<propositions_to_exclude.size(); i++) {
      int proposition_to_exclude = propositions_to_exclude[i];
      vector<int> possible_reason;
      for (int j=0; j<running_reason.size(); j++) {
        if (abs(running_reason[j]) != proposition_to_exclude) possible_reason.push_back(running_reason[j]);
      }
      // proposition to exclude has not already been excluded
      if (running_reason != possible_reason) {
        assert(running_reason.size() == possible_reason.size()+1);
        // have a new reason candidate, if a valid reason use as the new reason
        if (!solvers[solver]->solve_unmentioned_assumptions(possible_reason, extra_assumptions)) {
          running_reason = solvers[solver]->used_assumptions();
        }
      }
    }

    return_message->assignments = running_reason; // cout << "Worker " << comms->world_rank << " computed a reason for state with ID " << incoming_message->id << endl;
    return 0;
  }
}

// given a message from the master m for the Lingelingworker operating at node,
// boot up a TinySAT instance, and load forward and reverse mappings between the variables of the TinySAT instance and the master problem
// with additional clauses, formatted as a null terminated list of points to null terminated integer sequences.
void LingelingWorker::initialise_solver_from_message(Message* m) {
  assert(0);
}

// for the loaded solver, attempt to solver, returning 0 if UNSAT, 1 if SAT, 2 if paused
// if SAT, load the solution into message *m
int LingelingWorker::solve_and_generate_message(Message* m) {
  assert(0);
  return -1;
}
