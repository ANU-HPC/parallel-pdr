#ifndef _LINGELINGMASTER_H
#define _LINGELINGMASTER_H

#include <vector>
#include <map>
#include "arguments.h"
#include "mpi_global.h"
#include "MPICommsInterface.h"
#include "message.h"
#include <cassert>

using namespace std;

class LingelingMaster{
 public:
  MPICommsInterface* comms;
  vector<Message*> messages_to_process;
  set<int> worker_with_unprocessed_message;
  map<int, Message*> worker_to_message_to_process;
  vector<vector<Message*>> add_clauses_messages_to_process;
  int ENUMERATE_SOLUTIONS;
  bool BREADTH_FIRST_NODE_ALLOCATIONS;
  bool exiting;
  set<int> free_workers;

  LingelingMaster(MPICommsInterface* comms, int ENUMERATE_SOLUTIONS, bool BREADTH_FIRST_NODE_ALLOCATIONS) {
    this->comms = comms;
    this->ENUMERATE_SOLUTIONS = ENUMERATE_SOLUTIONS;
    this->BREADTH_FIRST_NODE_ALLOCATIONS = BREADTH_FIRST_NODE_ALLOCATIONS;
    this->exiting = true;
  }
  LingelingMaster(MPICommsInterface* comms, int ENUMERATE_SOLUTIONS, bool BREADTH_FIRST_NODE_ALLOCATIONS,bool exiting) {
    this->comms = comms;
    this->ENUMERATE_SOLUTIONS = ENUMERATE_SOLUTIONS;
    this->BREADTH_FIRST_NODE_ALLOCATIONS = BREADTH_FIRST_NODE_ALLOCATIONS;
    this->exiting = exiting;
  }
  tuple<vector<tuple<Message*, int>>, vector<tuple<Message*, int>>> sync_loop();
  tuple<vector<Message*>, vector<Message*>> loop();
  void async_send(const set<int>& workers_to_send_to);
  tuple<vector<tuple<Message*, int>>, vector<tuple<Message*, int>>> async_recieve();
  void send_exit();
  void isend_exit();

  // tracking unsat nodes
  set<int> dag_nodes_generated_solutions;
  set<int> dag_nodes_given_assignments;
  bool last_call_unsat = false; // meaningless the first time
};


#endif

