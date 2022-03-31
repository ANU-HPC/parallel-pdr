#ifndef _WORKER_H
#define _WORKER_H

#include "SatSolver.h"
#include "mpi_global.h"
#include "MPICommsInterface.h"

class Worker {
public:
  MPICommsInterface* comms;
  int ENUMERATE_SOLUTIONS;
  Dag* dag;
  SatSolver* solver;
  Cnf* generated_cnf;
  int phase;
  MPI_Comm *communicator_sls;
  MPI_Comm *communicator_strengthener;

  Worker(Dag* dag, MPICommsInterface* comms, MPI_Comm* communicator_sls, MPI_Comm* communicator_strengthener, int ENUMERATE_SOLUTIONS) {
    this->dag = dag;
    this->comms = comms;
    this->communicator_sls = communicator_sls;
    this->communicator_strengthener = communicator_strengthener;
    this->ENUMERATE_SOLUTIONS = ENUMERATE_SOLUTIONS;
    solver = NULL;
    phase = 0;
    generated_cnf = NULL;
  }
  ~Worker();

  void loop();  // the Worker master loop
  void initialise_solver_from_message(Message* m); // given an initial message for a node of dag d, create all the infastructure to compute resulting messages
  int solve_and_generate_message(Message* m); // for an object message m load in the values of a solution (if there is one) and return true, if no solution return false
  bool reset_solver_for_next_solution(int node); // after a solution is loaded into a message, call this method to reset the solver for the processing of an additional message
};

#endif

