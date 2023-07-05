#include "Reason.h"

Reason::Reason() { }

Reason::Reason(const Obligation& comparison_excluded_originating_obligation, const vector<int>& reason, int layer, int subproblem) {
  assert(Utils::is_abs_sorted(reason));

  _comparison_excluded_originating_obligation = comparison_excluded_originating_obligation;
  _reason = reason;
  _layer = layer;
  _subproblem = subproblem;
}


string Reason::to_string() const {
  return "{ Reason, L:" + std::to_string(_layer) + " S:" + std::to_string(_subproblem) + " " + Utils::to_string(_reason)  + " }";
}

bool Reason::operator==(const Reason& other) const {
  return (other.reason() == _reason) & (other.layer() == _layer) & (other.subproblem() == _subproblem);
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

Obligation Reason::comparison_excluded_originating_obligation() const {
  return _comparison_excluded_originating_obligation;
}

vector<int> Reason::reason() const {
  return _reason;
}

int Reason::layer() const {
  return _layer;
}

int Reason::subproblem() const {
  return _subproblem;
}

vector<int> Reason::nogood_clause() const {
  vector<int> ret_val;
  for (auto it=_reason.begin(); it!=_reason.end(); it++) {
    ret_val.push_back(Utils::tilde(-*it, 1)); 
  }
  return ret_val;
}


// MPI
// layer
// subproblem
// reason size
// reason
// obligation

int* Reason::get_as_MPI_message() const {
  int* data = new int[MPI_message_size()];
  get_as_MPI_message(data, 0);
  return data;
}

void Reason::get_as_MPI_message(int* data, int start) const {
  const int direct_reason_size = Utils::MPI_message_size(_reason);

  data[start+0] = _layer;
  data[start+1] = _subproblem;
  data[start+2] = direct_reason_size;

  Utils::get_as_MPI_message(data, start+3, _reason);
  _comparison_excluded_originating_obligation.get_as_MPI_message(data, start+3+direct_reason_size);
}

Reason::Reason(int* data, int start, int stop) {
  _layer = data[start];
  _subproblem = data[start+1];
  const int direct_reason_size = data[start+2];
  _reason = Utils::get_from_MPI_message(data, start+3, start+3+direct_reason_size);
  _comparison_excluded_originating_obligation = Obligation(data, start+3+direct_reason_size, stop);
}

int Reason::MPI_message_size() const {
  return 3 + Utils::MPI_message_size(_reason) + _comparison_excluded_originating_obligation.MPI_message_size();
}

int Reason::MPI_message_tag() const {
  return MPI_Interface::MESSAGE_TAG_REASON;
}
