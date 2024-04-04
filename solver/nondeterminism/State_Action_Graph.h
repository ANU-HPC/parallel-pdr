#ifndef STATE_ACTION_GRAPH_H
#define STATE_ACTION_GRAPH_H

using namespace std;

#include <cassert>
#include <unordered_set>
#include <unordered_map>
#include <vector>
#include <set>

#include "Utils.h"
#include "Success.h"

// NOTES
// Any lone (no in OR out arcs) state is removed
// Internally, dictionaries have all applicapple things - i.e. - if there is a state in the graph with ingoing but no outgoing arcs, it will be in all the dictionaries

class State_Action_Graph {
  public:
    // constructors
    State_Action_Graph(); // plain
    State_Action_Graph(const State_Action_Graph& existing); // copy

    // edits
    void add(const Success& success);
    void remove_state(const int state);
    void remove_state_action_arcs(const pair<int, int>& state_action);

    void print();

    unordered_map<int, unordered_set<int>> _state_to_actions;
    unordered_map<int, unordered_set<pair<int, int>, Int_Pair_Hash>> _state_to_producing_state_action_pairs;

    // retrieve info
    unordered_set<int> state_action_pair_to_outcomes(const pair<int,int>& state_action);
  protected:
    // graph traversal
    unordered_map<pair<int,int>, unordered_set<int>, Int_Pair_Hash> _state_action_pair_to_outcomes;

    // some helpers
    void erase_state_if_lone(int state);
    bool consistency_check();
};

#endif
