#include "Distributed_Worker_Interface.h"

Distributed_Worker_Interface::Distributed_Worker_Interface() {
  for (int worker=1; worker<Global::mpi_interface.world_size(); worker++) {
    _workers_wanting_work.insert(worker);
  }
}

set<int> Distributed_Worker_Interface::workers_wanting_work_snapshot() {
  return _workers_wanting_work;
}

bool Distributed_Worker_Interface::all_workers_idle() {
  return _workers_wanting_work.size() == Global::mpi_interface.world_size()-1;
}

void Distributed_Worker_Interface::handle_obligation(const Obligation& obl, int worker) {
  cout << "Distributed_Worker handling obligation " << obl.to_string() << endl;
  int size = obl.MPI_message_size();
  int* data = obl.get_as_MPI_message();
  Global::mpi_interface.isend_then_delete_message(worker, MPI_Interface::MESSAGE_TAG_OBLIGATION, data, size);

  assert(Utils::in(_workers_wanting_work, worker));
  _workers_wanting_work.erase(worker);
}

void Distributed_Worker_Interface::handle_reason(const Reason& reason, int worker) {
  cout << "Distributed_Worker handling reason " << reason.to_string() << endl;
  int size = reason.MPI_message_size();
  int* data = reason.get_as_MPI_message();
  Global::mpi_interface.isend_then_delete_message(worker, MPI_Interface::MESSAGE_TAG_REASON, data, size);
}

void Distributed_Worker_Interface::process_inbox() {
  int worker;
  int mpi_tag;
  int* data;
  int size;

  // mark as used - the compiler doesn't seem to recognise being used in an "if" and passed to a function as "used"
  (void)worker;
  (void)mpi_tag;
  (void)data;
  (void)size;

  while (Global::mpi_interface.message_waiting()) {
    auto [worker, mpi_tag, data, size] = Global::mpi_interface.recieve_message();

    if (mpi_tag == MPI_Interface::MESSAGE_TAG_SUCCESS) {
      Success success = Success(data, 0, size);
      _returned_successes_buffer->push_back(tuple<int, Success>(worker, success));
    } else if (mpi_tag == MPI_Interface::MESSAGE_TAG_REASON) {
      Reason reason = Reason(data, 0, size);
      _returned_reasons_buffer->push_back(tuple<int, Reason>(worker, reason));
    } else {
      cerr << "Unknown message tag: " << mpi_tag << endl;
      exit(1);
    }

    assert(!Utils::in(_workers_wanting_work, worker));
    _workers_wanting_work.insert(worker);
  }
}

vector<tuple<int,Reason>>* Distributed_Worker_Interface::get_returned_reasons_buffer() {
  return _returned_reasons_buffer;
}

vector<tuple<int,Success>>* Distributed_Worker_Interface::get_returned_successes_buffer() {
  return _returned_successes_buffer;
}

void Distributed_Worker_Interface::finalize() {
  for (int worker=1; worker<Global::mpi_interface.world_size(); worker++) {
    Global::mpi_interface.isend_then_delete_message(worker, MPI_Interface::MESSAGE_TAG_FINALIZE, _empty_int_array, 0);
  }
  MPI_Finalize();
}
