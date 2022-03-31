#ifndef _MASTER_H
#define _MASTER_H

#include <vector>
#include "arguments.h"
#include "mpi_global.h"
#include "MPICommsInterface.h"
#include "SolutionsInterface.h"
#include "message.h"

using namespace std;

class Master{
 public:
  MPICommsInterface* comms;
  SolutionsInterface *master;
  int ENUMERATE_SOLUTIONS;
  bool BREADTH_FIRST_NODE_ALLOCATIONS;
  bool exiting;

  Master(MPICommsInterface* comms, SolutionsInterface *master, int ENUMERATE_SOLUTIONS, bool BREADTH_FIRST_NODE_ALLOCATIONS) {
    this->comms = comms;
    this->master = master;
    this->ENUMERATE_SOLUTIONS = ENUMERATE_SOLUTIONS;
    this->BREADTH_FIRST_NODE_ALLOCATIONS = BREADTH_FIRST_NODE_ALLOCATIONS;
    this->exiting = true;
  }
  Master(MPICommsInterface* comms, SolutionsInterface *master, int ENUMERATE_SOLUTIONS, bool BREADTH_FIRST_NODE_ALLOCATIONS,bool exiting) {
    this->comms = comms;
    this->master = master;
    this->ENUMERATE_SOLUTIONS = ENUMERATE_SOLUTIONS;
    this->BREADTH_FIRST_NODE_ALLOCATIONS = BREADTH_FIRST_NODE_ALLOCATIONS;
    this->exiting = exiting;
  }
  vector<Message*> loop();
  void send_exit();

  // tracking unsat nodes
  set<int> dag_nodes_generated_solutions;
  set<int> dag_nodes_given_assignments;
  bool last_call_unsat = false; // meaningless the first time
};


#endif

