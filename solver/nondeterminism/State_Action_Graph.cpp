#include "State_Action_Graph.h"

State_Action_Graph::State_Action_Graph() { }

State_Action_Graph::State_Action_Graph(const State_Action_Graph& existing) {
  for (const auto& it:existing._state_to_actions) {
    const int state = it.first;
    const auto& actions = it.second;
    _state_to_actions[state] = unordered_set<int>(actions);
  }

  for (const auto& it:existing._state_action_pair_to_outcomes) {
    const pair<int, int>& state_action = it.first;
    const unordered_set<int>& outcomes = it.second;
    _state_action_pair_to_outcomes[state_action] = unordered_set<int>(outcomes);
  }

  for (const auto& it:existing._state_to_producing_state_action_pairs) {
    const int state = it.first;
    const auto& state_action_pairs = it.second;
    _state_to_producing_state_action_pairs[state] = unordered_set<pair<int, int>, Int_Pair_Hash>(state_action_pairs);
  }

  assert(consistency_check());
}

void State_Action_Graph::add(const Success& success) {
  assert(consistency_check());

  // get all as numbers
  const int original_state_id = success.original_obligation().compressed_state().id();
  const int action = success.actions()[0].get_actions()[0];
  unordered_set<int> successor_state_ids;
  for (auto successor_obligation : success.successor_obligations()) {
    successor_state_ids.insert(successor_obligation.compressed_state().id());
  }

  LOG << "adding: " << success.to_string() << endl;

  const pair<int, int> state_action = pair<int, int>(original_state_id, action);

  _state_to_producing_state_action_pairs[original_state_id].size(); // make it exist even if empty

  if (_state_action_pair_to_outcomes.find(state_action) != _state_action_pair_to_outcomes.end()) LOG << "adding a state_action already registered" << endl;

  _state_to_actions[original_state_id].insert(action);
  _state_action_pair_to_outcomes[state_action] = unordered_set<int>(successor_state_ids.begin(), successor_state_ids.end());
  for (int outcome:successor_state_ids) {
    _state_to_producing_state_action_pairs[outcome].insert(state_action);
    _state_to_actions[outcome].size(); // make it exist even if empty
  }

  assert(consistency_check());
}

void State_Action_Graph::remove_state(const int state) {
  //LOG << "start: " << state << endl;
  assert(consistency_check());
  // need to remove the state from:
  // (A) _state_to_actions (both sides!)
  // (B) _state_action_pair_to_outcomes (both sides!)
  // (C) _state_to_producing_state_action_pairs (both sides!)

  // all the actions which come out of this state (after)
  for (auto after_action:_state_to_actions[state]) {
    //LOG << "after action" << endl;
    const pair<int, int> after_state_action = pair<int, int>(state, after_action);
    for (auto outcome:_state_action_pair_to_outcomes[after_state_action]) {
      _state_to_producing_state_action_pairs[outcome].erase(after_state_action); //(C after)
      erase_state_if_lone(outcome);
    }
    _state_action_pair_to_outcomes.erase(after_state_action); // (B after)
  }
  //LOG << "_state_to_actions.erase(" << state << endl;
  _state_to_actions.erase(state); // (A after)

  // all the actions that go to this state (before)
  for (auto before_state_action:_state_to_producing_state_action_pairs[state]) {
    //LOG << "considering before state action" << endl;
    // this state action led here, so remove all the outcomes arcs, and the state-action itself (in 2 places)

    for (int co_outcome:_state_action_pair_to_outcomes[before_state_action]) {
      if (co_outcome == state) continue;
      _state_to_producing_state_action_pairs[co_outcome].erase(before_state_action); // (C before)
      //LOG << "erase from " << co_outcome << " down to size " << _state_to_producing_state_action_pairs[co_outcome].size() << endl;
      erase_state_if_lone(co_outcome);
    }
    _state_action_pair_to_outcomes.erase(before_state_action); // (B before)

    const int before_state = before_state_action.first;
    const int before_action = before_state_action.second;
    _state_to_actions[before_state].erase(before_action); // (A before)

    erase_state_if_lone(before_state);
  }

  _state_to_producing_state_action_pairs.erase(state);
  //LOG << "worked! expected it to fail right before..." << endl;
  //exit(1);
  assert(consistency_check());
}

// Removes nodes with no arcs (in OR out)
void State_Action_Graph::remove_state_action_arcs(const pair<int, int>& state_action) {
  assert(consistency_check());
  const int state = state_action.first;
  const int action = state_action.second;

  for (const int outcome:_state_action_pair_to_outcomes[state_action]) {
    _state_to_producing_state_action_pairs[outcome].erase(state_action);
    erase_state_if_lone(outcome);
  }

  _state_action_pair_to_outcomes.erase(state_action);
  _state_to_actions[state].erase(action);

  erase_state_if_lone(state);
  assert(consistency_check());
}

unordered_set<int> State_Action_Graph::state_action_pair_to_outcomes(const pair<int,int>& state_action) {
  return _state_action_pair_to_outcomes[state_action];
}

bool State_Action_Graph::consistency_check() {
  //LOG << "consistency check (expensive!)" << endl;
  //LOG << _state_to_actions.size() << " " << _state_to_producing_state_action_pairs.size() << endl;

  for (auto state_actions:_state_to_actions) {
    int state = state_actions.first;
    const unordered_set<int>& actions = state_actions.second;

    set<int> seen_actions;
    
    for (auto x:_state_action_pair_to_outcomes) {
      const pair<int, int>& state_action = x.first;
      if (state_action.first == state) {
        int action = state_action.second;

        // make sure this action is in state to actions, and sign off that the state_to_action action has been seen in the _state_action_to_outcomes keys
        bool a_in = (_state_to_actions[state].find(action) != _state_to_actions[state].end());
        if (!a_in) {
          LOG << "error: action in state_action_to_outcomes not in state_to_actions" << endl;
          return false;
        }

        seen_actions.insert(action);
      }
    }

    if (seen_actions.size() != actions.size()) {
      LOG << "error, differing number of actions for the same state between state_action_to_outcomes and state_to_actions" << endl;
      return false;
    }
  }

  // now lets check the symmetry of _state_action_pair_to_outcomes and _state_to_producing_state_action_pairs;
  for (auto x:_state_action_pair_to_outcomes) {
    auto state_action_pair = x.first;
    auto outcomes = x.second;

    for (int outcome:outcomes) {
      if (_state_to_producing_state_action_pairs[outcome].find(state_action_pair) == _state_to_producing_state_action_pairs[outcome].end()) {
        LOG << "error, look into it A" << endl;
        return false;
      }
    }
  }

  for (auto x:_state_to_producing_state_action_pairs) {
    auto outcome = x.first;
    auto state_action_pairs = x.second;

    for (auto state_action_pair:state_action_pairs) {
      if (_state_action_pair_to_outcomes[state_action_pair].find(outcome) == _state_action_pair_to_outcomes[state_action_pair].end()) {
        LOG << "error 2" << endl;
        return false;
      }
    }
  }

  // check that every node has an in or an out
  for (auto x:_state_to_actions) {
    int state = x.first;
    auto actions = x.second;

    if (actions.size() == 0) {
      // state_to_actions is empty, first check that the other one exists
      if (_state_to_producing_state_action_pairs.find(state) == _state_to_producing_state_action_pairs.end()) {
        LOG << "error" << endl;
        return false;
      }

      // then check it is also nonempty 
      if (_state_to_producing_state_action_pairs[state].size() == 0) {
        LOG << "error" << endl;
        return false;
      }
    }
  }

  //LOG << _state_to_actions.size() << " " << _state_to_producing_state_action_pairs.size() << endl;

  for (auto x:_state_to_producing_state_action_pairs) {
    int state = x.first;
    auto producing_state_action_pairs = x.second;

    if (producing_state_action_pairs.size() == 0) {
      // producing_state_action_pairs is empty, first check that the other one exists
      if (_state_to_actions.find(state) == _state_to_actions.end()) {
        LOG << "error" << endl;
        return false;
      }

      // then check it is also nonempty 
      if (_state_to_actions[state].size() == 0) {
        LOG << "error" << endl;
        return false;
      }
    }
  }
  //LOG << "end consistency check" << endl;
  return true;
}

void State_Action_Graph::erase_state_if_lone(int state) {
  //LOG << "considering if lone: " << state << endl;

  // don't assert consistency checks here, as this can be called from inside another edit

  if ((_state_to_actions[state].size() == 0) && (_state_to_producing_state_action_pairs[state].size() == 0)) {
    _state_to_actions.erase(state);
    _state_to_producing_state_action_pairs.erase(state);
  } 
}

void State_Action_Graph::print() {
  for (auto x:_state_action_pair_to_outcomes) {
    auto state_action_pair = x.first;
    auto outcomes = x.second;

    cout << "STATE: " << state_action_pair.first << "\tACTION: " << state_action_pair.second << " OUTCOMES:" << Utils::to_string(outcomes) << endl;
  }
}
  
