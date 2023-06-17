#include "Compressed_State.h"

Compressed_State::Compressed_State() { }

// TODO make this nicer?
Compressed_State::Compressed_State(const vector<int>& state, int subproblem, bool guaranteed_full) {
  _subproblem = subproblem;
  _guaranteed_full = guaranteed_full;

  // Want to be able to have a full state by only passing the true ones.
  //assert(!_guaranteed_full || state.size() == Global::problem.subproblem_to_propositions[_subproblem]);

  if (_guaranteed_full) {
    // so only need to store the positive ones
    for (auto it=state.begin(); it!=state.end(); it++) {
      if ((*it)>0) _raw.push_back(*it);
    }
  } else {
    _raw = state;
  }

  cout << "finished cs constructor, raw size: " << std::to_string(_raw.size());
}

Compressed_State::Compressed_State(int* data, int start, int stop) {
  _subproblem = data[start];
  _guaranteed_full = data[start+1]==1 ? true : false;
  
  for (int i=start+2; i<stop; i++) {
    _raw.push_back(data[i]);
  }
}

vector<int> Compressed_State::get_state() const {
  return Utils::inflate_only_true_to_all(_raw, Global::problem.subproblem_to_propositions[_subproblem]);
}

void Compressed_State::get_as_MPI_message(int* data, int start) const {
  data[start] = _subproblem;
  data[start+1] = _guaranteed_full ? 1 : 0;

  for (int i=0; i<_raw.size(); i++) {
    data[start+2+i] = _raw[i];
  }
}

int Compressed_State::MPI_message_size() const {
  return 2 + _raw.size();
}

string Compressed_State::to_string() const {
  return Utils::to_string(_raw);
}
