#include "SCC_Generator.h"

SCC_Generator::SCC_Generator(State_Action_Graph* base_graph) {
  _base_graph = base_graph;

  _state_to_index_value =  (int*) calloc(Compressed_State::max_id()+1, sizeof(int));
  _state_to_index_exists = (int*) calloc(Compressed_State::max_id()+1, sizeof(int));
  _state_to_lowlink =      (int*) calloc(Compressed_State::max_id()+1, sizeof(int));

  //LOG << "starting with iterative graph: " << base_graph->approx_num_nodes() << endl;
}

vector<unordered_set<int>*> SCC_Generator::run() {
  for (const auto state_actions:_base_graph->_state_to_actions) {
    const int state = state_actions.first;
    //LOG << "considering state when creating SCCs" << state << endl;
    if (_state_to_index_exists[state] == 0) {
      //LOG << "considering new state (and corresponding SCC): " << state << endl;
      strong_connect(state);
    }
  }

  return _sccs;
}

// TODO _state_to_index map is expensive, use arrays
void SCC_Generator::strong_connect(const int state) {
  _state_to_index_value[state] = _index;
  _state_to_index_exists[state] = 1;
  _state_to_lowlink[state] = _index;
  _index++;
  _stack.push_back(state);
  _unordered_stack.insert(state);

  for (const auto action:_base_graph->_state_to_actions[state]) {
    const int stateaction = State_Action_To_Stateaction::get_stateaction(state, action);
    for (auto outcome:_base_graph->_stateaction_to_outcomes[stateaction]) {
      if (_state_to_index_exists[outcome] == 0) {
        strong_connect(outcome);
        _state_to_lowlink[state] = min(_state_to_lowlink[state], _state_to_lowlink[outcome]);
      } else if (_unordered_stack.find(outcome) != _unordered_stack.end()) {
        _state_to_lowlink[state] = min(_state_to_lowlink[state], _state_to_index_value[outcome]);
      }
    }
  }

  //LOG << "considering if is a root node: " << state << " will be if =: " << _state_to_lowlink[state] << " " << _state_to_index[state] << endl;

  // If v is a root node, pop the stack and generate an SCC
  if (_state_to_lowlink[state] == _state_to_index_value[state]) {
    // start a new SCC
    unordered_set<int>* scc = new unordered_set<int>();

    while (true) {
      const int other_state = *_stack.rbegin();

      _stack.pop_back();
      _unordered_stack.erase(other_state);

      scc->insert(other_state);
      if (state == other_state) break;
    }
    //LOG << "actually pushing back an SCC" << endl;
    _sccs.push_back(scc);
  }
}
