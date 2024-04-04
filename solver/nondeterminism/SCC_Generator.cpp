#include "SCC_Generator.h"

SCC_Generator::SCC_Generator(State_Action_Graph* base_graph) {
  _base_graph = base_graph;
}

vector<unordered_set<int>*> SCC_Generator::run() {
  vector<unordered_set<int>*> sccs;
  for (const auto state_actions:_base_graph->_state_to_actions) {
    const int state = state_actions.first;
    //LOG << "considering state when creating SCCs" << state << endl;
    if (_state_to_index.find(state) == _state_to_index.end()) {
      //LOG << "considering new state (and corresponding SCC): " << state << endl;
      strong_connect(&sccs, state);
    }
  }
  return sccs;
}

void SCC_Generator::strong_connect(vector<unordered_set<int>*>* sccs, const int state) {
  _state_to_index[state] = _index;
  _state_to_lowlink[state] = _index;
  _index++;
  _stack.push_back(state);
  _unordered_stack.insert(state);

  for (const auto action:_base_graph->_state_to_actions[state]) {
    for (auto outcome:_base_graph->state_action_pair_to_outcomes(pair<int, int>(state, action))) {
      if (_state_to_index.find(state) == _state_to_index.end()) {
        strong_connect(sccs, outcome);
        _state_to_lowlink[state] = min(_state_to_lowlink[state], _state_to_lowlink[outcome]);
      } else if (_unordered_stack.find(state) != _unordered_stack.end()) {
        _state_to_lowlink[state] = min(_state_to_lowlink[state], _state_to_index[outcome]);
      }
    }
  }

  //LOG << "considering if is a root node: " << state << " will be if =: " << _state_to_lowlink[state] << " " << _state_to_index[state] << endl;

  // If v is a root node, pop the stack and generate an SCC
  if (_state_to_lowlink[state] == _state_to_index[state]) {
    // start a new SCC
    unordered_set<int>* scc = new unordered_set<int>();

    while (true) {
      const int other_state = *_stack.rbegin();

      _stack.pop_back();
      _unordered_stack.erase(other_state);

      scc->insert(other_state);
      if (state == other_state) break;
    }
    sccs->push_back(scc);
  }
}
