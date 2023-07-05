#ifndef GLOBAL_H
#define GLOBAL_H

#include <mpi.h>

#include "Problem.h"
#include "MPI_Interface.h"

class Global {
  public:
    static set<int> active_heuristics;
    static Problem problem;
    static MPI_Interface mpi_interface;
};

#endif
