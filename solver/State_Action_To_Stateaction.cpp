#include "State_Action_To_Stateaction.h"

vector<int> State_Action_To_Stateaction::stateaction_to_state;
vector<int> State_Action_To_Stateaction::stateaction_to_action;
vector<map<int, int>> State_Action_To_Stateaction::state_action_to_stateaction;
int State_Action_To_Stateaction::max_stateaction = 0;

int State_Action_To_Stateaction::get_stateaction(int state, int action) {
  if (state >= state_action_to_stateaction.size()) {
    return set_new(state, action);
  }

  const auto& used_set = state_action_to_stateaction[state];
  auto pos = used_set.find(action);
  if (pos == used_set.end()) {
    return set_new(state, action);
  } else {
    // it exists
    return pos->second;
  }
}

int State_Action_To_Stateaction::get_state(int stateaction) {
  assert(stateaction <= max_stateaction);
  return stateaction_to_state[stateaction];
}

int State_Action_To_Stateaction::get_action(int stateaction) {
  assert(stateaction <= max_stateaction);
  return stateaction_to_action[stateaction];
}

int State_Action_To_Stateaction::set_new(int state, int action) {
  // first make sure there is enough space for everything
  if (state >= state_action_to_stateaction.size()) {
    state_action_to_stateaction.resize(state+1000);
  }
  if (max_stateaction+1 >= stateaction_to_state.size()) {
    stateaction_to_action.resize(max_stateaction + 1000);
    stateaction_to_state.resize(max_stateaction + 1000);
  }

  // add
  max_stateaction++;
  state_action_to_stateaction[state][action] = max_stateaction;
  stateaction_to_action[max_stateaction] = action;
  stateaction_to_state[max_stateaction] = state;
  return max_stateaction;
}
