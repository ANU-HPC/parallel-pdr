#ifndef GLOBAL_H
#define GLOBAL_H

#define MAX_OR_COUNT 4

#include <mpi.h>

#include "Problem.h"
#include "MPI_Interface.h"
#include "Stats.h"

class Global {
  public:
    static set<int> active_heuristics;
    static Problem problem;
    static MPI_Interface mpi_interface;
    static Stats stats;
};

#endif
