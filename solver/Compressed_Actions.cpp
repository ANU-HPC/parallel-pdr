#include "Compressed_Actions.h"

Compressed_Actions::Compressed_Actions() {}

Compressed_Actions::Compressed_Actions(const vector<int>& actions, const int subproblem) {
  for (auto it=actions.begin(); it!=actions.end(); it++) {
    if ((*it)>0) _compressed_actions.push_back(*it);
  }
  _subproblem = subproblem;
}

vector<int> Compressed_Actions::get_actions() {
  return Utils::inflate_only_true_to_all(_compressed_actions, Global::problem.subproblem_to_actions[_subproblem]);
}
