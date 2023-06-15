#include "MPI_Orchestrator.h"

// maybe make it so mpi_interface is stored in here?

void MPI_Orchestrator::send_obligation(const Obligation& obl, int worker) {
  int size = obl.MPI_message_size();
  int* data = obl.get_as_MPI_message();
  Global::mpi_interface.isend_then_delete_message(worker, MPI_Interface::MESSAGE_TAG_OBLIGATION, data, size);
}

void MPI_Orchestrator::send_reason(const Reason& reason, int worker) {
  int size = reason.MPI_message_size();
  int* data = reason.get_as_MPI_message();
  Global::mpi_interface.isend_then_delete_message(worker, MPI_Interface::MESSAGE_TAG_REASON, data, size);
}

void MPI_Orchestrator::finalize() {
  for (int worker=1; worker<Global::mpi_interface.world_size(); worker++) {
    Global::mpi_interface.isend_then_delete_message(worker, MPI_Interface::MESSAGE_TAG_FINALIZE, _empty_int_array, 0);
  }
  MPI_Finalize();
}

void MPI_Orchestrator::process_inbox() {
  int worker;
  int mpi_tag;
  int* data;
  int size;

  while (Global::mpi_interface.message_waiting()) {
    auto [worker, mpi_tag, data, size] = Global::mpi_interface.recieve_message();

    if (mpi_tag == MPI_Interface::MESSAGE_TAG_SUCCESS) {
      Success success = Success(data, 0, size);
      _successes_to_return_buffer->push_back(tuple<int, Success>(worker, success));
    } else if (mpi_tag == MPI_Interface::MESSAGE_TAG_REASON) {
      Reason reason = Reason(data, 0, size);
      _reasons_to_return_buffer->push_back(tuple<int, Reason>(worker, reason));
    } else {
      cerr << "Unknown message tag: " << mpi_tag << endl;
      exit(1);
    }
  }
}
