#ifndef GLOBAL_H
#define GLOBAL_H

#define MAX_OR_COUNT 4

#include <mpi.h>

#include "Problem.h"
#include "MPI_Interface.h"
#include "Stats.h"
#include "nondeterminism/State_ID_Manager.h"

class Global {
  public:
    static set<int> active_heuristics;
    static Problem problem;
    static MPI_Interface mpi_interface;
    static Stats stats;
    static State_ID_Manager state_id_manager;
};

#endif
