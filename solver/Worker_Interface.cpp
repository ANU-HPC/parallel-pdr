#include "Worker_Interface.h"

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

void Worker_Interface::handle_obligation(const Obligation& obl, bool open_children, int worker) {
  if (Global::problem.MPI_active) _distributed_worker_interface->handle_obligation(obl, open_children, worker);
  else {
    assert (worker == 1);
    _serial_worker_interface->handle_obligation(obl, open_children);
  }
}

void Worker_Interface::handle_reason(const Reason_From_Orchestrator& reason, int worker) {
  if (Global::problem.MPI_active) _distributed_worker_interface->handle_reason(reason, worker);
  else {
    assert (worker == 1);
    _serial_worker_interface->handle_reason(reason);
  }
}

void Worker_Interface::handle_reason_all_workers(const Reason_From_Orchestrator& reason) {
  if (Global::problem.MPI_active) {
    for (auto it=Global::mpi_interface.ENABLED_WORKERS.begin(); it!=Global::mpi_interface.ENABLED_WORKERS.end(); it++) {
      _distributed_worker_interface->handle_reason(reason, *it);
    }
  }
  else _serial_worker_interface->handle_reason(reason);
}

void Worker_Interface::process_inbox() {
  if (Global::problem.MPI_active) _distributed_worker_interface->process_inbox();
}

void Worker_Interface::reset_nondeterministic_solvers_for_new_k(int k) {
  if (Global::problem.MPI_active) {
    for (auto it=Global::mpi_interface.ENABLED_WORKERS.begin(); it!=Global::mpi_interface.ENABLED_WORKERS.end(); it++) {
      _distributed_worker_interface->reset_nondeterministic_solvers_for_new_k(k, *it);
    }
  }
  else _serial_worker_interface->reset_nondeterministic_solvers_for_new_k(k);
}

vector<tuple<int, Reason_From_Worker>>* Worker_Interface::get_returned_reasons_buffer() {
  if (Global::problem.MPI_active) return _distributed_worker_interface->get_returned_reasons_buffer();
  else                            return _serial_worker_interface->get_returned_reasons_buffer();
}

vector<tuple<int, Success>>* Worker_Interface::get_returned_successes_buffer() {
  if (Global::problem.MPI_active) return _distributed_worker_interface->get_returned_successes_buffer();
  else                            return _serial_worker_interface->get_returned_successes_buffer();
}

void Worker_Interface::finalize() {
  if (Global::problem.MPI_active) _distributed_worker_interface->finalize();
}
