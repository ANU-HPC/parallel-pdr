#include "Contextless_Reason.h"

Contextless_Reason::Contextless_Reason() { }

Contextless_Reason::Contextless_Reason(const vector<int>& reason, int layer, int subproblem) {
  assert(Utils::is_abs_sorted(reason));

  _reason = reason;
  _layer = layer;
  _subproblem = subproblem;
}

string Contextless_Reason::to_string() const {
  return "{ Contextless_Reason, L:" + std::to_string(_layer) + " S:" + std::to_string(_subproblem) + " " + Utils::to_string(_reason)  + " }";
}

bool Contextless_Reason::operator==(const Contextless_Reason& other) const {
  return (other.reason() == _reason) & (other.layer() == _layer) & (other.subproblem() == _subproblem);
}

size_t Contextless_Reason::hash() const {
  return Utils::hash(_reason) ^ (_layer<<4) ^ _subproblem;
}

size_t Contextless_Reason::hash_just_reason() const {
  return Utils::hash(_reason);
}

bool Contextless_Reason::equal_just_reason(const Contextless_Reason& other_reason) const {
  return _reason == other_reason.reason();
}

vector<int> Contextless_Reason::reason() const {
  return _reason;
}

int Contextless_Reason::layer() const {
  return _layer;
}

int Contextless_Reason::subproblem() const {
  return _subproblem;
}

vector<int> Contextless_Reason::timestep_zero_nogood_clause() const {
  vector<int> ret_val;
  for (auto it=_reason.begin(); it!=_reason.end(); it++) {
    ret_val.push_back(-*it); 
  }
  assert(ret_val.size()); // don't add the empty clause
  return ret_val;
}

// MPI
// layer
// subproblem
// reason size
// reason
// obligation

int* Contextless_Reason::get_as_MPI_message() const {
  int* data = new int[MPI_message_size()];
  get_as_MPI_message(data, 0);
  return data;
}

void Contextless_Reason::get_as_MPI_message(int* data, int start) const {
  data[start+0] = _layer;
  data[start+1] = _subproblem;
  Utils::get_as_MPI_message(data, start+2, _reason);
}

Contextless_Reason::Contextless_Reason(int* data, int start, int stop) {
  _layer = data[start];
  _subproblem = data[start+1];
  _reason = Utils::get_from_MPI_message(data, start+2, stop);
}

int Contextless_Reason::MPI_message_size() const {
  return 2 + Utils::MPI_message_size(_reason);
}

// no tag as not set up to be sent directly
