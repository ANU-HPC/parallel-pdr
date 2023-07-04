#include "Compressed_Actions.h"

Compressed_Actions::Compressed_Actions() { }

Compressed_Actions::Compressed_Actions(const vector<int>& actions, int subproblem) {
  for (auto it=actions.begin(); it!=actions.end(); it++) {
    if ((*it)>0) _raw.push_back(*it);
  }
  _subproblem = subproblem;
}

Compressed_Actions::Compressed_Actions(int* data, int start, int stop) {
  _subproblem = data[start];
  
  for (int i=start+1; i<stop; i++) {
    _raw.push_back(data[i]);
  }
}

vector<int> Compressed_Actions::get_actions() const {
  return _raw;
  //return Utils::inflate_only_true_to_all(_raw, Global::problem.subproblem_to_propositions[_subproblem]);
}

void Compressed_Actions::get_as_MPI_message(int* data, int start) const {
  data[start] = _subproblem;

  for (int i=0; i<_raw.size(); i++) {
    data[start+1+i] = _raw[i];
  }
}

int Compressed_Actions::MPI_message_size() const {
  return 1 + _raw.size();
}

string Compressed_Actions::to_string() const {
  return Utils::to_string(_raw);
}
