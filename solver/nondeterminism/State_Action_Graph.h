#ifndef STATE_ACTION_GRAPH_H
#define STATE_ACTION_GRAPH_H

using namespace std;

#include <cassert>
#include <unordered_set>
#include <unordered_map>
#include <vector>
#include <set>

#include "Utils.h"

class State_Action_Graph {
  public:
    State_Action_Graph();
    State_Action_Graph(const State_Action_Graph& existing);

    // add info
    void add(const int original_state, const int action, const vector<int>& successor_states);

    void remove_state(const int state);
    void remove_state_action_arcs(const pair<int, int>& state_action);

    unordered_set<int> scc_refinement_find_newly_goal_reaching_states(unordered_map<int, unordered_set<int>>* existing_goal_reaching_states);

    // retrieve info
    unordered_set<int> state_to_actions(int state);
    unordered_set<int> state_action_pair_to_outcomes(const pair<int,int>& state_action);
    unordered_set<pair<int, int>, Int_Pair_Hash> state_to_producing_state_action_pairs(int state);

    // down the graph
    unordered_map<int, unordered_set<int>> _state_to_actions;
  private:
    unordered_map<pair<int,int>, unordered_set<int>, Int_Pair_Hash> _state_action_pair_to_outcomes;

    // up the graph
    unordered_map<int, unordered_set<pair<int, int>, Int_Pair_Hash>> _state_to_producing_state_action_pairs;

    void erase_state_if_lone(int state);

    unordered_set<int> scc_iteration_non_goal_reaching_states(const unordered_map<int, unordered_set<int>>& goal_state_to_actions);

    bool consistency_check();
};


#endif
