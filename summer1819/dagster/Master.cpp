#include "Master.h"
#include "Cnf.h"
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
#include <set>
#include "arguments.h"
#include "mpi_global.h"
#include "DisorderedArray.h"
#include "MasterOrganiser.h"
#include <cassert>
#include "CnfHolder.h"

using namespace std;
extern CnfHolder* cnf_holder;

vector<Message*> Master::loop() {
  dag_nodes_generated_solutions.clear();
  dag_nodes_given_assignments.clear();

  MasterOrganiser organiser(comms->world_size-1);
  vector<Message*> solutions;
  solutions.clear();
  bool terminate_trigger = false;
  set<int> subgraph_finished;
  while (true) {
    VLOG(3) << "MASTER: generating new messages";
    while ((!terminate_trigger) && (organiser.message_buffer.length < comms->world_size-1)) { // look for maximum work for our workers
      Message *mess = master->output_message(BREADTH_FIRST_NODE_ALLOCATIONS);                // generate an assignment
      if (mess != NULL) {  // for each new assignment found add it to the buffer
        if (subgraph_finished.find(mess->to) != subgraph_finished.end()) {
          delete mess;
          continue;
        }
        organiser.add_message(mess);
      } else
        break;
    }
    if (organiser.message_buffer.length == 0) {// all workers are idle, and there are no more messages to allocate set the terminate_trigger
      terminate_trigger = true;
      VLOG(3) << "MASTER: terminate trigger true";
    }
    if (terminate_trigger) {// if the terminate_trigger is set, make sure all workers are polled before exit.
      int i;
      VLOG(3) << "MASTER: poll exit loop";
      for (i=0; i<organiser.num_workers; i++)
        if (!(organiser.workers[i].polled)) break;
      if (i==organiser.num_workers) break;
    }

    organiser.allocate_assignments();
    VLOG(3) << "MASTER: sending new reassignments";
    // send out all the new assignments for polled workers, or ping for polled workers without new assignments
    for (int i=0; i<organiser.num_workers; i++) {
      if ((!terminate_trigger) && (organiser.workers[i].polled)) { // dont send out any new messages if terminate_trigger
        if (organiser.workers[i].to_be_assigned != NULL) { // if master is not in terminate mode, and there is work to be assigned then send the work out
          int** additional_clauses = master->get_additional_clauses(organiser.workers[i].to_be_assigned->to);
          organiser.workers[i].to_be_assigned->set_additional_clauses(additional_clauses); // generate negated BDD representation (or otherwise NULL) if no additional clauses allready seen before
          comms->send_message(i+1, MPI_TAG_NEW_ASSIGNMENT, organiser.workers[i].to_be_assigned);
          VLOG(2) << "sending message to worker "<< (i+1) << " " << *(organiser.workers[i].to_be_assigned);

          // PDR addition
          const int dag_node = organiser.workers[i].to_be_assigned->to;
          dag_nodes_given_assignments.insert(dag_node);

          if (additional_clauses != NULL) {
            for (int **clause = additional_clauses; *clause != NULL; clause++)
              free(*clause);
            free(additional_clauses);
          }
          organiser.workers[i].assigned = organiser.workers[i].to_be_assigned;
          organiser.workers[i].to_be_assigned = NULL;
          organiser.workers[i].needs_refresh = false;
        } else {
          VLOG(3) << "MASTER: polling worker " << i+1;
          comms->send_tag(i+1, MPI_TAG_POLL_FOR_REASSIGNMENT);
        }
        organiser.workers[i].polled = false;
      }
    }

    VLOG(3) << "MASTER: receiving from workers";
    auto [source_worker,message_tag, m] = comms->receive_message();
    if (message_tag == MPI_TAG_REQUEST_FOR_ASSIGNMENT) {
      VLOG(2) << "MASTER: received MPI_TAG_REQUEST_FOR_ASSIGNMENT from worker " << source_worker;
      // assume everybody is done with the message
      if (organiser.workers[source_worker-1].assigned != NULL) {
        delete organiser.workers[source_worker-1].assigned;
        organiser.remove_message(organiser.workers[source_worker-1].assigned);
      }
      organiser.workers[source_worker-1].polled = true;
    } else if (message_tag == MPI_TAG_SOLUTION) {
      VLOG(3) << "MASTER: received MPI_TAG_SOLUTION from worker " << source_worker;
      if (organiser.workers[source_worker-1].assigned!=NULL)
        organiser.refresh_except(organiser.workers[source_worker-1].assigned, source_worker-1);

      // PDR addition
      dag_nodes_generated_solutions.insert(m->from);

      if ((!terminate_trigger) && (master->input_message(m) == 0)) { // if terminate_trigger not set then input message, and if it is for terminal node
        solutions.push_back(new Message(m));// found a solution for the terminal node of the DAG
        if (ENUMERATE_SOLUTIONS==2) { // destroy messages from subgraph
          if (organiser.workers[source_worker-1].assigned != NULL) {
            subgraph_finished.insert(cnf_holder->dag->subgraph_index[m->to]);
            int i=0;
            delete organiser.workers[source_worker-1].assigned;
            organiser.remove_message(organiser.workers[source_worker-1].assigned);
            while (i<organiser.message_buffer.length) {
              if (cnf_holder->dag->subgraph_index[organiser.message_buffer[i]->to] == cnf_holder->dag->subgraph_index[m->to]) {
                delete organiser.message_buffer[i];
                organiser.remove_message(organiser.message_buffer[i]);
              } else {
                i++;
              }
            }
          }
        } else if (ENUMERATE_SOLUTIONS==0) { // full terminate
          VLOG(3) << "MASTER: terminate trigger true";
          terminate_trigger = true;
        } else {} // continue running till all solutions found
      }
    } else if (message_tag == MPI_TAG_POLL_FOR_REASSIGNMENT) {
      VLOG(3) << "MASTER: received MPI_TAG_POLL_FOR_REASSIGNMENT from worker " << source_worker;
      if (organiser.workers[source_worker-1].assigned!=NULL)
        if (organiser.workers[source_worker-1].needs_refresh)
          organiser.workers[source_worker-1].assigned=NULL;
      organiser.workers[source_worker-1].polled = true;
            // if the worker needs an update on additional clauses, and is not the only one left on that message, then free it from the message entirely
    } else
      LOG(ERROR) << "MASTER: master received a message with unknown tag: " << message_tag;
    if (m!=NULL)
      delete m;
  }
  if (exiting)
    send_exit();
  last_call_unsat = solutions.size() == 0;
  return solutions;
}

void Master::send_exit() {
  // kill all remaining workers
  for (int i = 1; i < comms->world_size; i++) {
    VLOG(2) << "MASTER: sending kill signal to worker " << i;
    comms->send_tag(i, MPI_TAG_KILL);
  }
}

