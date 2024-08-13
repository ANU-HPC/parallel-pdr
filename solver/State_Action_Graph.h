#ifndef STATE_ACTION_GRAPH_H
#define STATE_ACTION_GRAPH_H

using namespace std;

#include <cassert>
#include <unordered_set>
#include <unordered_map>
#include <vector>
#include <set>
#include <map>

#include "Utils.h"
#include "Success.h"
#include "State_Action_To_Stateaction.h"
#include "../data_structures/Int_Bitmap.h"
#include "../data_structures/Int_Iterable_Bitmap.h"

// NOTES
// Any lone (no in OR out arcs) state is removed
// Internally, dictionaries have all applicapple things - i.e. - if there is a state in the graph with ingoing but no outgoing arcs, it will be in all the dictionaries

/*
template<typename T2>
class my_unordered_map{
public:
  my_unordered_map(int size = 0){
    initialised = vector<int>(size, 0);
    data = vector<T2>(size);
  }

  bool find(int query){return 0 != initialised[query];}
  bool end() {return false;}

  T2& operator[](int query) {
    initialised[query] = 1;
    return data[query];
  }
  
  vector<int> initialised;
  vector<T2> data;
};
*/

class State_Action_Graph {
  public:
    // constructors
    State_Action_Graph(); // plain
    State_Action_Graph(const State_Action_Graph& existing); // copy

    State_Action_Graph reachable_subgraph(const unordered_map<int, unordered_set<int>>& goal_state_to_actions, const vector<Success>& successes, int optional_goal_state);

    // edits
    bool add(const Success& success);
    void remove_state(const int state);
    //void remove_state_action_arcs(const pair<int, int>& state_action);
    void clear();

    int approx_num_nodes();
    void print(const unordered_map<int, unordered_set<int>>& _goal_state_to_actions);

    // graph traversal

    map<int, set<int>> _state_to_actions;
    map<int, set<int>> _state_to_producing_stateactions;
    map<int, set<int>> _stateaction_to_outcomes;

    // retrieve info
    //unordered_set<int> state_action_pair_to_outcomes(const pair<int,int>& state_action);
  protected:
    // some helpers
    void erase_state_if_lone(int state);
    bool consistency_check();
};

#endif
