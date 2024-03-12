#include "State_ID_Manager.h"

State_ID_Manager::State_ID_Manager() { }

// converting to/from id
Compressed_State State_ID_Manager::state_id_to_state(int state_id) {
  assert (state_id_to_state_map.find(state_id) != state_id_to_state_map.end());
  return state_id_to_state_map[state_id];
}

int State_ID_Manager::state_to_state_id(const Compressed_State& state) {
  auto position = state_to_state_id_map.find(state);
  if (position == state_to_state_id_map.end()) {
    int state_id = state_to_state_id_map.size();
    state_to_state_id_map[state] = state_id;
    state_id_to_state_map[state_id] = state;
    LOG << "just registered a new state id: " << state_id << " " << state.to_string() << endl;
    return state_id;
  } else {
    return position->second;
  }
}

void State_ID_Manager::set_initial_state(const Compressed_State& state) {
  initial_state_id_value = state_to_state_id(initial_state);
}

int State_ID_Manager::initial_state_id() {
  return initial_state_id_value;
}


/*
// returns pair[state id's to remove from the obligation queue, has a plan been found
set<int> ND_Manager::register_goal_state(const Compressed_State& state) {
  // should already be a registered state
  int starting_state_id = state_to_state_id_map[state];

  // search frontier of state_id and the action they should execute to get closer to the goal
  set<pair<int, int>> frontier; 
  frontier.insert(pair<int, int>(starting_state_id, NULL_ACTION));

  // states being removed as they are known to reach the goal
  set<int> goal_reaching_state_ids;

  while (frontier.size()) {
    const pair<int, int>& state_id_action = *frontier.begin();
    int state_id = state_id_action.first;
    int action = state_id_action.second;
    frontier.erase(state_id_action);

    if (goal_reaching_state_id_to_reaching_action.find(state_id) == goal_reaching_state_id_to_reaching_action.end()) {
      // register it
      goal_reaching_state_id_to_reaching_action[state_id] = action;
      goal_reaching_state_ids.insert(state_id);

      // add up the tree to frontier
      auto parents = state_id_to_producing_state_id_action_pairs[state_id];
      for (auto it=parents.begin(); it!=parents.end(); it++) {
        frontier.insert(*it);
      }
    }
  }
}

void ND_Manager::register_state_action_to_outcome_states(const Compressed_State& original_state, const int action, const vector<Compressed_State>& successor_states) {
  int original_state_id = state_to_state_id(original_state);
  pair<int, int> original_state_id_action_pair = pair<int, int>(original_state_id, action);

  unordered_set<int> successor_state_ids;
  for (auto it=successor_states.begin(); it!=successor_states.end(); it++) {
    successor_state_ids.insert(state_to_state_id(*it));
  }

  // register this change in the various mappings

  // state_id_to_actions
  if (state_id_to_actions.find(original_state_id) == state_id_to_actions.end()) state_id_to_actions[original_state_id] = unordered_set<int>();
  state_id_to_actions[original_state_id].insert(action);

  // state_id_action_pair_to_outcomes
  state_id_action_pair_to_outcomes[original_state_id_action_pair] = successor_state_ids; // if already seen before just overwrite TODO maybe interesting how often this happens?

  // state_id_to_producing_state_id_action_pairs
  for (auto it=successor_state_ids.begin(); it!=successor_state_ids.end(); it++) {
    int successor_state_id = *it;
    if (state_id_to_producing_state_id_action_pairs.find(successor_state_id) == state_id_to_producing_state_id_action_pairs.end()) {
      state_id_to_producing_state_id_action_pairs[successor_state_id] = unordered_set<pair<int, int>, Int_Pair_Hash>();
    }
    state_id_to_producing_state_id_action_pairs[successor_state_id].insert(original_state_id_action_pair);
  }
}
*/


/*
set<int> ND_Manager::register_state_id_iteration_unprogressable(int state_id) {
  // when a state is deemed unprogressable, only AFTER any OR, so when it is a failed obligation at k, or kicked out of the queue completely. 
  // return other states to kick
  // this is only within a PDR iteration, this is a PDR thing

  set<int> ret_val;

  // drop all siblings, from each set of parents
  auto state_id_action_pairs = state_id_to_producing_state_id_action_pairs[state_id];
  for (auto ita=state_id_action_pairs.begin(); ita!=state_id_action_pairs.end(); ita++) {
    auto outcomes = state_id_action_pair_to_outcomes[*ita];
    for (auto itb=outcomes.begin(); itb!=outcomes.end(); itb++) {
      int sibling_state_id = *itb; 
      ret_val.insert(sibling_state_id);
    }
  }

  // TODO not worrying about children, because should only be saying a state is unprogressable if all its children are unprogressable, make sure this thought is true

  return ret_val;
}


set<int> ND_Manager::state_id_to_open_actions(int state_id) {

}


void ND_Manager::clear_for_new_iteration() {
    state_id_to_actions.clear();
    state_id_action_pair_to_outcomes.clear();
    state_id_to_producing_state_id_action_pairs.clear();
    goal_reaching_state_id_to_reaching_action.clear();
    state_id_to_open_actions_map.clear();
    //state_ids_which_cannot_reach_the_goal.clear();
}
*/
