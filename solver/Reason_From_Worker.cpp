#include "Reason_From_Worker.h"

Reason_From_Worker::Reason_From_Worker() { }

Reason_From_Worker::Reason_From_Worker(const Contextless_Reason& contextless_reason, const Obligation& originating_obligation) {
  _contextless_reason = contextless_reason;
  _originating_obligation = originating_obligation;
}

string Reason_From_Worker::to_string() const {
  return "{ Reason_From_Worker; " + _contextless_reason.to_string() + " " + _originating_obligation.to_string() + " }";
}

bool Reason_From_Worker::operator==(const Reason_From_Worker& other) const {
  return (other.contextless_reason() == _contextless_reason) & (other.originating_obligation() == _originating_obligation);
}

size_t Reason_From_Worker::hash() const {
  return _contextless_reason.hash() ^ _originating_obligation.hash();
}

Contextless_Reason Reason_From_Worker::contextless_reason() const {
  return _contextless_reason;
}

Obligation Reason_From_Worker::originating_obligation() const {
  return _originating_obligation;
}

// MPI
// layer
// subproblem
// reason size
// reason
// obligation

int* Reason_From_Worker::get_as_MPI_message() const {
  int* data = new int[MPI_message_size()];
  get_as_MPI_message(data, 0);
  return data;
}

void Reason_From_Worker::get_as_MPI_message(int* data, int start) const {
  const int contextless_reason_size = _contextless_reason.MPI_message_size();

  // reason then obligation
  data[start] = contextless_reason_size;
  _contextless_reason.get_as_MPI_message(data, start+1);
  _originating_obligation.get_as_MPI_message(data, start+1+contextless_reason_size);
}

Reason_From_Worker::Reason_From_Worker(int* data, int start, int stop) {
  const int contextless_reason_size = data[start];
  _contextless_reason = Contextless_Reason(data, start+1, start+1+contextless_reason_size);
  _originating_obligation = Obligation(data, start+1+contextless_reason_size, stop);
}

int Reason_From_Worker::MPI_message_size() const {
  return 1 + _contextless_reason.MPI_message_size() + _originating_obligation.MPI_message_size();
}

int Reason_From_Worker::MPI_message_tag() const {
  return MPI_Interface::MESSAGE_TAG_REASON_FROM_WORKER;
}
