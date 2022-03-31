#ifndef _LINGELINGWORKER_H
#define _LINGELINGWORKER_H

#include "SatSolver.h"
#include "mpi_global.h"
#include "MPICommsInterface.h"
#include "lingeling.h"
#include<map>

class LingelingWorker {
public:
  MPICommsInterface* comms;
  int ENUMERATE_SOLUTIONS;
  Dag* dag;
  vector<Lingeling*> solvers;
  Cnf* generated_cnf;
  vector<int> assumptions_for_next_solve;
  int solver_for_next_solve = -1;
  int subproblem_for_next_solve = -1;
  string tmp_dir;
  Lingeling* baseLingeling = NULL;
  map<int, vector<int>> subproblem_to_assumptions;
  map<int, vector<int>> subproblem_to_propositions;

  LingelingWorker(Dag* dag, MPICommsInterface* comms, MPI_Comm* communicator_sls, MPI_Comm* communicator_strengthener, int ENUMERATE_SOLUTIONS) {
    this->dag = dag;
    this->comms = comms;
    this->ENUMERATE_SOLUTIONS = ENUMERATE_SOLUTIONS;
    generated_cnf = NULL;
  }
  ~LingelingWorker();

  void make_solver_exist(int solver);
  void add_clauses(Message* incoming_message);
  int solve(Message* incoming_message, Message* return_message);
  void loop(string in_tmp_dir, const map<int, vector<int>>& in_subproblem_to_propositions, const map<int, vector<int>>& in_subproblem_to_assumptions); // the LingelingWorker master loop
  void initialise_solver_from_message(Message* m); // given an initial message for a node of dag d, create all the infastructure to compute resulting messages
  int solve_and_generate_message(Message* m); // for an object message m load in the values of a solution (if there is one) and return true, if no solution return false
  bool reset_solver_for_next_solution(int node); // after a solution is loaded into a message, call this method to reset the solver for the processing of an additional message
};

#endif

