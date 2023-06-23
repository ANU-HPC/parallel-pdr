#ifndef GLOBAL_H
#define GLOBAL_H

#include "Problem.h"
#include "MPI_Interface.h"
#include <mpi.h>

class Global {
  public:
    static Problem problem;
    static MPI_Interface mpi_interface;
};

#endif
