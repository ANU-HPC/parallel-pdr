#include "Compressed_State.h"

Compressed_State::Compressed_State() { }

Compressed_State::Compressed_State(const vector<int>& state, int subproblem) {
  for (auto it=state.begin(); it!=state.end(); it++) {
    if ((*it)>0) _raw.push_back(*it);
  }
  _subproblem = subproblem;
  cout << "finished cs constructor, raw size: " << std::to_string(_raw.size());
}

Compressed_State::Compressed_State(int* data, int start, int stop) {
  _subproblem = data[start];
  
  for (int i=start+1; i<stop; i++) {
    _raw.push_back(data[i]);
  }
}

vector<int> Compressed_State::get_state() {
  return Utils::inflate_only_true_to_all(_raw, Global::problem.subproblem_to_propositions[_subproblem]);
}

void Compressed_State::get_as_MPI_message(int* data, int start) {
  data[start] = _subproblem;

  for (int i=0; i<_raw.size(); i++) {
    data[start+1+i] = _raw[i];
  }
}

int Compressed_State::MPI_message_size() {
  return 1 + _raw.size();
}

string Compressed_State::to_string() {
  cout << "cs to string on size: " << std::to_string(_raw.size()) << endl;
  return Utils::to_string(_raw);
}
