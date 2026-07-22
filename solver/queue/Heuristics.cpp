#include "Heuristics.h"

//H^+
unordered_map<int, int> Heuristics::_h_add_h_function_memo; // MUST BE CLEARED BETWEEN EACH H_ADD CALL
unordered_set<int> Heuristics::_h_add_h_function_open;

// Novelty
unordered_set<int> Heuristics::_novelty_single_seen;
unordered_map<int, unordered_set<int>> Heuristics::_novelty_pair_seen;

int Heuristics::get_cost(int heuristic, const Obligation& obligation) {
  switch(heuristic) {
    case NONE:
      return get_cost_none(obligation);
    case H_ADD:
      return get_cost_h_add(obligation);
    case NOVELTY:
      return get_cost_novelty(obligation);
    case RANDOM:
      return get_cost_random(obligation);
    default:
      cerr << "ERROR unknown heuristic" << endl;
      exit(1);
      return 0;
  }
}

// Actual Heuristic implementations

int Heuristics::get_cost_none(const Obligation& obligation) {
  return 0; // just here to fit the standard
}

int Heuristics::get_cost_h_add(const Obligation& obligation) {
  cerr << "H^+ not implemented" << endl;
  exit(1);
  return 0;
}

int Heuristics::get_cost_novelty(const Obligation& obligation) {
  const vector<int>& state = obligation.compressed_state().get_state();

  int ret_val = 3;
  for (auto ita=state.begin(); ita!=state.end(); ita++) {
    const int a = *ita;
    if (_novelty_single_seen.find(a) == _novelty_single_seen.end()) {
      ret_val = min(1, ret_val);
      _novelty_single_seen.insert(a);
    }
    for (auto itb=ita+1; itb!=state.end(); itb++) {
      const int b = *itb;
      if (_novelty_pair_seen[a].find(b) == _novelty_pair_seen[a].end()) {
        ret_val = min(2, ret_val);
        _novelty_pair_seen[a].insert(b);
      }
    }
  }
  return ret_val;
}

int Heuristics::get_cost_random(const Obligation& obligation) {
  return rand();
}






// TODO REVISIT once had a look at the parser

/*
int h_add(const vector<int>& compressed_state) {
  if (compressed_state[1] == COMPRESS_PARTIAL_STATE) {
    // a partial state, convert to full state format
    const int subproblem = compressed_state[0];
    return h_add(compress_state(uncompress_state(compressed_state), subproblem, COMPRESS_FULL_STATE));
  }

  assert(ALLOW_HEURISTIC_H_ADD);
  if (h_add_memo.find(compressed_state) != h_add_memo.end()) return h_add_memo[compressed_state];

  h_add_h_function_memo.clear();
  const unordered_set<int> state_props(compressed_state.begin()+2, compressed_state.end());
  int sum = 0;
  for (int const positive_goal : positive_goal_condition) {
    sum += h_add_h_function(positive_goal, state_props);
    //sum =max(sum, h_add_h_function(positive_goal, compressed_state)); // to change to h^max
  }

  h_add_memo[compressed_state] = sum;
  return sum;
}

int h_add_h_function(const int p, const unordered_set<int>& state_props) {
  // If already working on it, are in a loop, so cut this path off
  if (h_add_h_function_open.find(p) != h_add_h_function_open.end()) return 100000;

  // Get the noted value if present
  if (h_add_h_function_memo.find(p) != h_add_h_function_memo.end()) return h_add_h_function_memo[p];

  // If p \in s, return 0
  if (state_props.find(p) != state_props.end()) return 0;

  // Mark as "open" investigation into p
  h_add_h_function_open.insert(p);
  // Not an end, so instead return the min
  int min_so_far = 10000;

  // Start out with strips
  vector<int> actions_to_test = positive_effect_strips_to_actions[p];

  // Add some more from ADL
  for (auto const& action_condition : positive_effect_adl_to_actions_conditions[p]) {
    const int action = *action_condition.begin();
    assert(actions_set.find(action) != actions_set.end());

    for (auto it=action_condition.begin()+1; it!=action_condition.end(); it++) {
      const int condition_lit = *it;
      const int condition_prop = abs(condition_lit);
      assert(propositions_set.find(condition_prop) != propositions_set.end());
      if (condition_lit>0) {
        if (state_props.find(condition_prop) == state_props.end()) {
          // To be relevant this prop has to be in the state. It is not so the action is not relevant.
          continue;
        }
      } else {
        if (state_props.find(condition_prop) != state_props.end()) {
          // To be relevant this prop has to NOT be in the state. It IS so the action is not relevant.
          continue;
        }
      }
    }
    // Got through that, so must be relevant
    actions_to_test.push_back(action);
  }

  for (int const& action : actions_to_test) {
    int one_plus_sum = 1;
    for (int const& q : action_to_positive_preconditions[action]) {
      one_plus_sum += h_add_h_function(q, state_props);
    }
    min_so_far = min(min_so_far, one_plus_sum);
  }
  h_add_h_function_memo[p] = min_so_far;
  h_add_h_function_open.erase(p);
  return min_so_far;
}
*/
