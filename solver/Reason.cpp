#include "Reason.h"

Reason::Reason() {
  cout << "Reason empty constructor" << endl;
}

Reason::Reason(const vector<int>& reason, int layer, int subproblem) {
  _reason = reason;
  _layer = layer;
  _subproblem = subproblem;
}

string Reason::to_string() const {
  return "{ Reason, L:" + std::to_string(_layer) + " S:" + std::to_string(_subproblem) + " " + Utils::to_string(_reason)  + " }";
}

int Reason::layer() const {
  return _layer;
}

int Reason::subproblem() const {
  return _subproblem;
}

vector<int> Reason::reason() const {
  return _reason;
}

// MPI
// TYPE, layer, subproblem, positive_props

int* Reason::get_as_MPI_message() const {
  int* data = new int[MPI_message_size()];
  get_as_MPI_message(data, 0);
  return data;
}

void Reason::get_as_MPI_message(int* data, int start) const {
  data[start+0] = _layer;
  data[start+1] = _subproblem;

  Utils::get_as_MPI_message(data, start+2, _reason);
}

Reason::Reason(int* data, int start, int stop) {
  _layer = data[start];
  _subproblem = data[start+1];
  _reason = Utils::get_from_MPI_message(data, start+2, stop);
}

int Reason::MPI_message_size() const {
  return 2 + Utils::MPI_message_size(_reason);
}

int Reason::MPI_message_tag() const {
  return MPI_Interface::MESSAGE_TAG_REASON;
}
