#include "Goal_States_Graph.h"

Goal_States_Graph::Goal_States_Graph() {

}

// returns state ids of newly goal reaching states
set<int> Goal_States_Graph::register_goal_state(const int state) {
  goal_reaching_state_id_to_reaching_action[state] = -1;

  set<int> ret_val;

  for (auto it=state_to_producing_state_action_pairs[state].begin(); it!=state_to_producing_state_action_pairs[state].end(); it++) {
    const pair<int, int>& state_action = *it;
    const int parent_state = state_action.first;
    const int parent_action = state_action.second;

    find_newly_goal_reaching_states(&ret_val, parent_state, parent_action);
  }

  return ret_val;
}

// returns state ids of newly goal reaching states
set<int> Goal_States_Graph::register_state_action_to_outcome_states(const int original_state, const int action, const vector<int>& successor_states) {
  const pair<int, int> state_action = pair<int, int>(original_state, action);

  state_to_actions[original_state].insert(action);

  state_action_pair_to_outcomes[state_action] = unordered_set<int>(successor_states.begin(), successor_states.end());

  for (auto it=successor_states.begin(); it!=successor_states.end(); it++) {
    const int successor_state = *it; 
    state_to_producing_state_action_pairs[successor_state].insert(state_action);
  }

  // find out if if this is now a goal states
  set<int> ret_val;
  find_newly_goal_reaching_states(&ret_val, original_state, action);
  return ret_val;
}

void Goal_States_Graph::find_newly_goal_reaching_states(set<int>* newly_goal_reaching_states, int state, int action) {
  if (goal_reaching_state_id_to_reaching_action.find(state) != goal_reaching_state_id_to_reaching_action.end()) {
    // state is already a goal, stop
    return;
  }

  // check this state/action and see if all outcomes are goal states
  const pair<int, int> state_action = pair<int, int>(state, action);
  for (auto it=state_action_pair_to_outcomes[state_action].begin(); it!=state_action_pair_to_outcomes[state_action].end(); it++) {
    const int outcome_state = *it;

    if (goal_reaching_state_id_to_reaching_action.find(outcome_state) == goal_reaching_state_id_to_reaching_action.end()) {
      // not all outcomes are a goal state so not a goal state itself
      return;
    }
  }

  // all the outcomes from this action are, so this is a goal state too!
  goal_reaching_state_id_to_reaching_action[state] = action;
  newly_goal_reaching_states->insert(state);

  // do this recursively, maybe this outcome makes one of its parents a goal state too

  for (auto it=state_to_producing_state_action_pairs[state].begin(); it!=state_to_producing_state_action_pairs[state].end(); it++) {
    const pair<int, int>& state_action = *it;
    const int parent_state = state_action.first;
    const int parent_action = state_action.second;

    find_newly_goal_reaching_states(newly_goal_reaching_states, parent_state, parent_action);
  }
}
