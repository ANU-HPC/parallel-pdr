#include "Reason_From_Orchestrator.h"

Reason_From_Orchestrator::Reason_From_Orchestrator() { }

Reason_From_Orchestrator::Reason_From_Orchestrator(const Contextless_Reason& contextless_reason, const int add_from_layer) {
  _contextless_reason = contextless_reason;
  _add_from_layer = add_from_layer;
}

string Reason_From_Orchestrator::to_string() const {
  return "{ Reason_From_Orchestrator; " + _contextless_reason.to_string() + " add from: " + std::to_string(_add_from_layer) + " }";
}

bool Reason_From_Orchestrator::operator==(const Reason_From_Orchestrator& other) const {
  return (other.contextless_reason() == _contextless_reason) & (other.add_from_layer() == _add_from_layer);
}

size_t Reason_From_Orchestrator::hash() const {
  return _contextless_reason.hash() ^ _add_from_layer;
}

Contextless_Reason Reason_From_Orchestrator::contextless_reason() const {
  return _contextless_reason;
}

int Reason_From_Orchestrator::add_from_layer() const {
  return _add_from_layer;
}

// MPI
// layer
// subproblem
// reason size
// reason
// obligation

int* Reason_From_Orchestrator::get_as_MPI_message() const {
  int* data = new int[MPI_message_size()];
  get_as_MPI_message(data, 0);
  return data;
}

void Reason_From_Orchestrator::get_as_MPI_message(int* data, int start) const {
  // layers_back_to_add then reason
  data[start] = _add_from_layer;
  _contextless_reason.get_as_MPI_message(data, start+1);
}

Reason_From_Orchestrator::Reason_From_Orchestrator(int* data, int start, int stop) {
  _add_from_layer = data[start];
  _contextless_reason = Contextless_Reason(data, start+1, stop);
}

int Reason_From_Orchestrator::MPI_message_size() const {
  return 1 + _contextless_reason.MPI_message_size();
}

int Reason_From_Orchestrator::MPI_message_tag() const {
  return MPI_Interface::MESSAGE_TAG_REASON_FROM_ORCHESTRATOR;
}
