#include "Worker_Interface.h"
#include "MPI_Interface.h"

Worker_Interface::Worker_Interface() {
  if (Global::problem.MPI_active) _distributed_worker_interface = new Distributed_Worker_Interface();
  else                            _serial_worker_interface = new Serial_Worker_Interface();
}

set<int> Worker_Interface::workers_wanting_work_snapshot() {
  if (Global::problem.MPI_active) return _distributed_worker_interface->workers_wanting_work_snapshot();
  else                            return _serial_worker_interface->workers_wanting_work_snapshot();
}

bool Worker_Interface::all_workers_idle() {
  if (Global::problem.MPI_active) return _distributed_worker_interface->all_workers_idle();
  else                            return _serial_worker_interface->all_workers_idle();
}

void Worker_Interface::handle_obligation(const Obligation& obl, int worker) {
  if (Global::problem.MPI_active) _distributed_worker_interface->handle_obligation(obl, worker);
  else                            _serial_worker_interface->handle_obligation(obl, worker);
}

void Worker_Interface::handle_reason(const Reason& reason, int worker) {
  LOG << "A" << endl;
  if (Global::problem.MPI_active) _distributed_worker_interface->handle_reason(reason, worker);
  else                            _serial_worker_interface->handle_reason(reason, worker);
}

void Worker_Interface::handle_reason_all_workers(const Reason& reason) {
  if (Global::problem.MPI_active) {
    for (int worker=1; worker<Global::mpi_interface.world_size(); worker++) {
      _distributed_worker_interface->handle_reason(reason, worker);
    }
  }
  else _serial_worker_interface->handle_reason(reason, 1);
}

void Worker_Interface::process_inbox() {
  if (Global::problem.MPI_active) _distributed_worker_interface->process_inbox();
  else                            _serial_worker_interface->process_inbox();
}

vector<tuple<int, Reason>>* Worker_Interface::get_returned_reasons_buffer() {
  if (Global::problem.MPI_active) return _distributed_worker_interface->get_returned_reasons_buffer();
  else                            return _serial_worker_interface->get_returned_reasons_buffer();
}

vector<tuple<int, Success>>* Worker_Interface::get_returned_successes_buffer() {
  if (Global::problem.MPI_active) return _distributed_worker_interface->get_returned_successes_buffer();
  else                            return _serial_worker_interface->get_returned_successes_buffer();
}

void Worker_Interface::finalize() {
  if (Global::problem.MPI_active) _distributed_worker_interface->finalize();
  else                            _serial_worker_interface->finalize();
}
