#ifndef MPI_ORCHESTRATOR_H
#define MPI_ORCHESTRATOR_H

#include <vector>
#include <tuple>

#include "MPI_Interface.h"
#include "Global.h"
#include "Obligation.h"

using namespace std;

class MPI_Orchestrator {
  public:
    void handle_obligation(const Obligation& obl, int worker);
    void finalize(); 
    //...
  private:
    int* _empty_int_array = new int[0];
};

#endif
