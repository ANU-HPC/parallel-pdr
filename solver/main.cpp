#include "main.h"

int main(int argc, char **argv) {
  // Parse in command line arguments, and problem specific attributes
  Global::problem = Problem(argc, argv);

  // Setup MPI
  if (Global::problem.MPI_active) { 
    Global::mpi_interface.setup();
    if (Global::mpi_interface.is_worker()) {
      // do worker things
      return 0;
    }
  }

  // when we are ready, start the PDR main loop

  return 0;
}
