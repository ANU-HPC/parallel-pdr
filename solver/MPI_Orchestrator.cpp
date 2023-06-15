#include "MPI_Orchestrator.h"

// maybe make it so mpi_interface is stored in here?

void MPI_Orchestrator::handle_obligation(const Obligation& obl, int worker) {
  int size = obl.MPI_message_size();
  int* data = obl.get_as_MPI_message();
  Global::mpi_interface.isend_then_delete_message(worker, MPI_Interface::MESSAGE_TAG_OBLIGATION, data, size);
}

void MPI_Orchestrator::finalize() {
  for (int worker=1; worker<Global::mpi_interface.world_size(); worker++) {
    Global::mpi_interface.isend_then_delete_message(worker, MPI_Interface::MESSAGE_TAG_FINALIZE, _empty_int_array, 0);
  }
  MPI_Finalize();
}
