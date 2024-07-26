#include "State_Action_Graph.h"

// for efficiency:
// have a node list for scc generator

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
}

State_Action_Graph State_Action_Graph::reachable_subgraph(const unordered_map<int, unordered_set<int>>& goal_state_to_actions, const vector<Success>& successes, int optional_goal_state) {
  State_Action_Graph new_graph;

  unordered_set<int> backwards_expanded;
  unordered_set<int> backwards_frontier;
  unordered_set<int> forward_expanded;
  unordered_set<int> forward_frontier;

  bool any_state_reaches_goal = false;

  // set up the frontiers
  for (const Success& success : successes) {
    new_graph.add(success);
    const int original_state = success.original_obligation().compressed_state().id();
    backwards_frontier.insert(original_state);
    any_state_reaches_goal = any_state_reaches_goal || (goal_state_to_actions.find(original_state) != goal_state_to_actions.end());

    for (const Obligation obl : success.successor_obligations()) {
      const int outcome = obl.compressed_state().id();
      forward_frontier.insert(outcome);
      any_state_reaches_goal = any_state_reaches_goal || (goal_state_to_actions.find(outcome) != goal_state_to_actions.end());
    }
  }
  if (optional_goal_state != -1) {
    any_state_reaches_goal = true;
    backwards_frontier.insert(optional_goal_state);
  }

  // explore forwards
  while (forward_frontier.size()) {
    // TODO have a special case, when a goal state don't keep going
    const int state = *forward_frontier.begin();
    forward_frontier.erase(state);
    forward_expanded.insert(state);

    new_graph._state_to_producing_state_action_pairs[state].size(); // make it exist
    new_graph._state_to_actions[state] = _state_to_actions[state];
    for (const int action : _state_to_actions[state]) {
      const pair<int, int> state_action = pair<int, int>(state, action);

      new_graph._state_action_pair_to_outcomes[state_action] = _state_action_pair_to_outcomes[state_action];

      for (const int outcome : _state_action_pair_to_outcomes[state_action]) {
        new_graph._state_to_producing_state_action_pairs[outcome].insert(state_action);
        new_graph._state_to_actions[outcome].size(); // make it exist

        // for each of the outcomes, if they have not been expanded forward AND they are not a goal state (in which case we don't need to go any further), set them up to be
        const bool outcome_already_expanded = forward_expanded.find(outcome) != forward_expanded.end();
        const bool outcome_goal_reaching = goal_state_to_actions.find(outcome) != goal_state_to_actions.end();
        if ((!outcome_already_expanded) && (!outcome_goal_reaching)) {
          forward_frontier.insert(outcome);
        }
      }
    }
  }

  //LOG << "any reaches goal?: " << any_state_reaches_goal << endl;
  // if it doesn't here, then it never will
  // TODO seems to make it slower when exiting early?? which confuses me...
  //if (!any_state_reaches_goal) return State_Action_Graph();

  // explore backwards
  while (backwards_frontier.size()) {
    const int outcome = *backwards_frontier.begin();
    backwards_frontier.erase(outcome);
    backwards_expanded.insert(outcome);

    // work out the state action pairs which produced this outcome
    for (const pair<int, int> producing_state_action : _state_to_producing_state_action_pairs[outcome]) {
      const int parent_state = producing_state_action.first;
      const int action = producing_state_action.second;

      new_graph._state_to_actions[parent_state].insert(action);
      new_graph._state_to_producing_state_action_pairs[parent_state].size(); // make it exist
      new_graph._state_action_pair_to_outcomes[producing_state_action] = _state_action_pair_to_outcomes[producing_state_action];

      for (const int sibling_outcome : _state_action_pair_to_outcomes[producing_state_action]) {
        new_graph._state_to_producing_state_action_pairs[sibling_outcome].insert(producing_state_action);
        new_graph._state_to_actions[sibling_outcome].size(); // make it exist
      }

      // if this parent has not been expanded backwards, set it up to be
      if (backwards_expanded.find(parent_state) == backwards_expanded.end()) {
        backwards_frontier.insert(parent_state);
      }
    }
  }

  assert(new_graph.consistency_check());
  return new_graph;
}

bool State_Action_Graph::add(const Success& success) {
  // get all as numbers
  const int original_state_id = success.original_obligation().compressed_state().id();
  const int action = success.actions()[0].get_actions()[0];
  unordered_set<int> successor_state_ids;
  for (auto successor_obligation : success.successor_obligations()) {
    successor_state_ids.insert(successor_obligation.compressed_state().id());
  }

  //LOG << "adding: " << success.to_string() << endl;

  const pair<int, int> state_action = pair<int, int>(original_state_id, action);

  _state_to_producing_state_action_pairs[original_state_id].size(); // make it exist even if empty

  bool ret_val;
  if (_state_action_pair_to_outcomes.find(state_action) == _state_action_pair_to_outcomes.end()) {
    ret_val = true;
  } else {
    ret_val = false;
    LOG << "adding a state_action already registered" << endl;
  }

  _state_to_actions[original_state_id].insert(action);
  _state_action_pair_to_outcomes[state_action] = unordered_set<int>(successor_state_ids.begin(), successor_state_ids.end());
  for (int outcome:successor_state_ids) {
    _state_to_producing_state_action_pairs[outcome].insert(state_action);
    _state_to_actions[outcome].size(); // make it exist even if empty
  }

  return ret_val;
}

void State_Action_Graph::remove_state(const int state) {
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
}

// Removes nodes with no arcs (in OR out)
void State_Action_Graph::remove_state_action_arcs(const pair<int, int>& state_action) {
  const int state = state_action.first;
  const int action = state_action.second;

  for (const int outcome:_state_action_pair_to_outcomes[state_action]) {
    _state_to_producing_state_action_pairs[outcome].erase(state_action);
    erase_state_if_lone(outcome);
  }

  _state_action_pair_to_outcomes.erase(state_action);
  _state_to_actions[state].erase(action);

  erase_state_if_lone(state);
}

void State_Action_Graph::clear() {
  _state_to_actions.clear();
  _state_to_producing_state_action_pairs.clear();
  _state_action_pair_to_outcomes.clear();
}

unordered_set<int> State_Action_Graph::state_action_pair_to_outcomes(const pair<int,int>& state_action) {
  return _state_action_pair_to_outcomes[state_action];
}

bool State_Action_Graph::consistency_check() {
  //LOG << "skipping check" << endl;
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

int State_Action_Graph::approx_num_nodes() {
  return _state_to_actions.size();
}

void State_Action_Graph::print(const unordered_map<int, unordered_set<int>>& goal_state_to_actions) {
  LOG << "print:" << endl;
  for (auto state_actions:_state_to_actions) {
    auto state = state_actions.first;
    auto actions = state_actions.second;

    string goal_string_A = (goal_state_to_actions.find(state) == goal_state_to_actions.end()) ? "     " : "GOAL ";

    cout << goal_string_A << "STATE: " << Compressed_State::state_id_to_state(state).to_string() << endl;
    for (auto action:actions) {
      cout << "       ACTION: " << Utils::to_symbols_string(action) << endl;
      pair<int, int> state_action_pair = pair<int, int>(state, action);
      for (auto outcome:_state_action_pair_to_outcomes[state_action_pair]) {
        string goal_string_B = (goal_state_to_actions.find(outcome) == goal_state_to_actions.end()) ? "     " : "GOAL ";
        cout << goal_string_B << "    OUTCOME: " << Compressed_State::state_id_to_state(outcome).to_string() << endl;
      }
    }
  }
}
