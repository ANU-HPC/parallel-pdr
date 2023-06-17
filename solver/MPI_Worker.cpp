#include "MPI_Worker.h"
#include "MPI_Interface.h"

// maybe make it so mpi_interface is stored in here?

void MPI_Worker::run() {
  cout << "MPI_Worker::run" << endl;

  // infinite loop handling messages
  int _; // don't care about where the message came from, should always be from the orchestrator
  int mpi_tag;
  int* data;
  int size;

  while (true) {
    cout << "MPI_Worker waiting for message " << endl;
    auto [_, mpi_tag, data, size] = Global::mpi_interface.recieve_message();
    cout << "MPI_Worker recieved message " <<  mpi_tag << endl;

    if (mpi_tag == MPI_Interface::MESSAGE_TAG_OBLIGATION) {
      Obligation obl = Obligation(data, 0, size);
      handle_obligation(obl);
    } else if (mpi_tag == MPI_Interface::MESSAGE_TAG_REASON) {
      Reason reason = Reason(data, 0, size);
      handle_reason(reason);
    } else if (mpi_tag == MPI_Interface::MESSAGE_TAG_FINALIZE) {
      MPI_Finalize();
      return;
    } else {
      cerr << "Unknown message tag: " << mpi_tag << endl;
      exit(1);
    }
  }
}

void MPI_Worker::handle_obligation(const Obligation& obl) {
  cout << "worker received obligation: [[[" << obl.to_string() << "]]]" << endl;
}

void MPI_Worker::handle_reason(const Reason& reason) {
  cout << "worker received reason: [[[" << reason.to_string() << "]]]" << endl;
}
