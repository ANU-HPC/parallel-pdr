#include "Serial_Worker_Interface.h"
#include "Obligation_Processor.h"

Serial_Worker_Interface::Serial_Worker_Interface() {
  _obligation_processor = new Obligation_Processor(1);
}

set<int> Serial_Worker_Interface::workers_wanting_work_snapshot() {
  return _sole_worker;
}

bool Serial_Worker_Interface::all_workers_idle() {
  return true;
}

void Serial_Worker_Interface::handle_obligation(const Obligation& obl) {
  _obligation_processor->process_obligation(obl);

  if (_obligation_processor->last_interaction_was_a_success()) {
    _returned_successes_buffer->push_back(tuple<int, Success>(_SERIAL_WORKER_ID, _obligation_processor->last_interactions_success()));
  } else {
    _returned_reasons_buffer->push_back(tuple<int, Reason>(_SERIAL_WORKER_ID, _obligation_processor->last_interactions_reason()));
  }
}

void Serial_Worker_Interface::handle_reason(const Reason& reason) {
  _obligation_processor->add_reason(reason);
}

vector<tuple<int, Reason>>* Serial_Worker_Interface::get_returned_reasons_buffer() {
  return _returned_reasons_buffer;
}

vector<tuple<int, Success>>* Serial_Worker_Interface::get_returned_successes_buffer() {
  return _returned_successes_buffer;
}
