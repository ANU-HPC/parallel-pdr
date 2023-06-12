#include "Compressed_State.h"

Compressed_State::Compressed_State() {}

Compressed_State::Compressed_State(const vector<int>& state, const int subproblem) {
  for (auto it=state.begin(); it!=state.end(); it++) {
    if ((*it)>0) _compressed_state.push_back(*it);
  }
  _subproblem = subproblem;
}

vector<int> Compressed_State::get_state() {
  return Utils::inflate_only_true_to_all(_compressed_state, Global::problem.subproblem_to_propositions[_subproblem]);
}
