#include "Reason.h"

Reason::Reason() {
  cout << "Reason empty constructor" << endl;
}

Reason::Reason(const vector<int>& reason, int layer, int subproblem) {
  _reason = reason;
  _layer = layer;
  _subproblem = subproblem;
}

string Reason::to_string() {
  return "{ Reason, L:" + std::to_string(_layer) + " S:" + std::to_string(_subproblem) + " " + Utils::to_string(_reason)  + " }";
}

int Reason::layer() {
  return _layer;
}

int Reason::subproblem() {
  return _subproblem;
}

vector<int> Reason::reason() {
  return _reason;
}

// MPI
// TYPE, layer, subproblem, positive_props

void Reason::get_as_MPI_message(int* data, int start) {
  data[start+0] = _layer;
  data[start+1] = _subproblem;

  Utils::get_as_MPI_message(data, start+2, _reason);
}

Reason::Reason(int* data, int start, int stop) {
  _layer = data[start];
  _subproblem = data[start+1];
  _reason = Utils::get_from_MPI_message(data, start+2, stop);
}

int Reason::MPI_message_size() {
  return 2 + Utils::MPI_message_size(_reason);
}

int Reason::MPI_message_tag() {
  return MPI_Interface::MESSAGE_TAG_REASON;
}
