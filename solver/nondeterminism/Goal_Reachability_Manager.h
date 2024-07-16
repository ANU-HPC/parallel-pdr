#ifndef GOAL_REACHABILITY_MANAGER_H
#define GOAL_REACHABILITY_MANAGER_H

using namespace std;

#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <iostream>
#include <utility>
#include <set>
#include <cassert>

#include "SCC_Generator.h"
#include "Compressed_State.h"
#include "Success.h"

// keep track of what can reach the goal. Is a sort of wrapper, with algorithms around a State_Action_Graph

class Goal_Reachability_Manager {
  public:
    //Goal_Reachability_Manager();
    unordered_set<int> register_pure_goal_return_new_goal_states(const Compressed_State& state);
    unordered_set<int> register_success_return_new_goal_states(const Success& success); 

    bool goal_reaching_state(const int state);

    void print();
    bool no_change_since_last_check();
    State_Action_Graph* get_global_graph();
  private:
    unordered_set<int> scc_iteration_non_goal_reaching_states(State_Action_Graph* iterative_graph);

    // The wider context just needs to know what states to trim from the queue
    unordered_set<int> find_newly_goal_reaching_states(const Success* optional_success, int optional_goal_state); 

    unordered_map<int, unordered_set<int>> _goal_state_to_actions; // actions needed to progress towards the goal
    State_Action_Graph _graph;

    bool _no_change_since_last_check = false;
};

#endif
