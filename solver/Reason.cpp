#include "Reason.h"

Reason::Reason() { }

Reason::Reason(const vector<int>& reason, int layer, int subproblem) {
  _reason = reason;
  _layer = layer;
  _subproblem = subproblem;
}

int Reason::layer() const {
  return _layer;
}

string Reason::to_string() const {
  return "{ Reason, L:" + std::to_string(_layer) + " S:" + std::to_string(_subproblem) + " " + Utils::to_string(_reason)  + " }";
}

bool Reason::operator==(const Reason& other) const {
  return (other.reason() == _reason) & (other.layer() == _layer) & (other.subproblem() & _subproblem);
}

size_t Reason::hash() const {
  return Utils::hash(_reason) ^ (_layer<<4) ^ _subproblem;
}

size_t Reason::hash_contextless() const {
  return Utils::hash(_reason);
}

bool Reason::equal_contextless(const Reason& other_reason) const {
  return _reason == other_reason.reason();
}

int Reason::subproblem() const {
  return _subproblem;
}

vector<int> Reason::reason() const {
  return _reason;
}

vector<int> Reason::nogood_clause() const {
  vector<int> ret_val;
  for (auto it=_reason.begin(); it!=_reason.end(); it++) {
    ret_val.push_back(Utils::tilde(-*it, 1)); 
  }
  return ret_val;
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
