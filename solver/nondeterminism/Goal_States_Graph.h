#ifndef GOAL_STATES_GRAPH_H
#define GOAL_STATES_GRAPH_H

using namespace std;

#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <iostream>
#include <utility>
#include <set>

#include "Compressed_State.h"

// TODO for efficiency have a pile of single, sink sccs with no edges

class Goal_States_Graph {
  public:
    Goal_States_Graph();
    set<int> register_goal_state(const int state); // returns state ids of newly goal reaching states
    set<int> register_state_action_to_outcome_states(const int original_state, const int action, const vector<int>& successor_states);
  private:
    void find_newly_goal_reaching_states(set<int>* newly_goal_reaching_states, int state, int action);



    // down the tree
    unordered_map<int, unordered_set<int>> state_to_actions;
    unordered_map<pair<int,int>, unordered_set<int>, Int_Pair_Hash> state_action_pair_to_outcomes;

    // up the tree
    unordered_map<int, unordered_set<pair<int, int>, Int_Pair_Hash>> state_to_producing_state_action_pairs;

    // global tree properties
    unordered_map<int, int> goal_reaching_state_id_to_reaching_action;





    // TODO for now just have acyclic plans
    /*
    // have the state-actions which goal and sink
    // SCC to SCC_id
    unordered_map<int, unordered_set<int>> scc_id_to_scc;
    unordered_map<unordered_set<int>, int> scc_to_scc_id;

    // reverse SCC map
    unordered_map<int, int> state_to_scc_id;
    */

    // PDR iteration tree properties
    //unordered_map<int, set<int> state_id_to_iteration_open_actions_map; // here OPEN means we know they are applicable, we don't know if they are dead ends or not, so don't bother applying them again
    // do we need this? unordered_set<int> state_ids_which_cannot_reach_the_goal;
};

#endif
