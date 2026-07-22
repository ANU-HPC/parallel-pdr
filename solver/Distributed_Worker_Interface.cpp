#include "Distributed_Worker_Interface.h"


Distributed_Worker_Interface::Distributed_Worker_Interface() {
  // Just for testing, less efficient, but seperates the setup time from the running time. Also in MPI_Worker.cpp
  //Global::mpi_interface.barrier();
}

set<int> Distributed_Worker_Interface::workers_wanting_work_snapshot() {
  return _workers_wanting_work;
}

bool Distributed_Worker_Interface::all_workers_idle() {
  return _workers_wanting_work.size() == _workers_setup.size();
}

void Distributed_Worker_Interface::handle_obligation(const Obligation& obl, int worker) {
  assert(Utils::in(_workers_wanting_work, worker));

  int size = obl.MPI_message_size();
  int* data = obl.get_as_MPI_message();
  Global::mpi_interface.isend_then_delete_message(worker, MPI_Interface::MESSAGE_TAG_OBLIGATION, data, size);

  _workers_wanting_work.erase(worker);
}

void Distributed_Worker_Interface::handle_reason(const Reason_From_Orchestrator& reason, int worker) {
  int size = reason.MPI_message_size();
  int* data = reason.get_as_MPI_message();
  Global::mpi_interface.isend_then_delete_message(worker, MPI_Interface::MESSAGE_TAG_REASON_FROM_ORCHESTRATOR, data, size);
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
    } else if (mpi_tag == MPI_Interface::MESSAGE_TAG_REASON_FROM_WORKER) {
      Reason_From_Worker reason = Reason_From_Worker(data, 0, size);
      _returned_reasons_buffer->push_back(tuple<int, Reason_From_Worker>(worker, reason));
    } else if (mpi_tag == MPI_Interface::MESSAGE_TAG_IDLE) {
      assert(!Utils::in(_workers_wanting_work, worker));
      _workers_wanting_work.insert(worker);
      _workers_setup.insert(worker); // TODO only the first time? have a seperate tag...
    } else {
      LOG << "ERROR: Unknown message tag: " << mpi_tag << endl;
      exit(1);
    }
  }
}

vector<tuple<int,Reason_From_Worker>>* Distributed_Worker_Interface::get_returned_reasons_buffer() {
  return _returned_reasons_buffer;
}

vector<tuple<int,Success>>* Distributed_Worker_Interface::get_returned_successes_buffer() {
  return _returned_successes_buffer;
}

void Distributed_Worker_Interface::finalize() {
  for (int worker=1; worker<Global::mpi_interface.world_size(); worker++) {
    Global::mpi_interface.isend_tag(worker, MPI_Interface::MESSAGE_TAG_FINALIZE);
  }

  Global::mpi_interface.barriered_finalize();
}
