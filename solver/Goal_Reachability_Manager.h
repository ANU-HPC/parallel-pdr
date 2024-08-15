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
#include "Stopwatch.h"

#define CHEAP_NON_SCC_CHECK_RATE INT_MAX // effectively turns it off

// keep track of what can reach the goal. Is a sort of wrapper, with algorithms around a State_Action_Graph

class Goal_Reachability_Manager {
  public:
    //Goal_Reachability_Manager();
    unordered_set<int> register_pure_goal_return_new_goal_states(const Compressed_State& state);
    unordered_set<int> register_success_return_new_goal_states(const Success& success); 

    bool revalidate_plan_from_scratch();
    bool goal_reaching_state(const int state);

    void print();
    bool no_change_since_last_check();
    State_Action_Graph* get_global_graph();
    void inform_of_layer_graph(State_Action_Graph* layer_graph);

    unordered_set<int> scc_find_newly_goal_reaching_states(const vector<Success>& successes, const vector<int>& goal_states, bool run_on_whole_graph); 

  private:
    unordered_set<int> scc_iteration_non_goal_reaching_states(State_Action_Graph* iterative_graph);

    // The wider context just needs to know what states to trim from the queue
    unordered_set<int> find_newly_goal_reaching_states(const Success* optional_success, int optional_goal_state); 

    void cheap_find_newly_goal_reaching_states_helper(int newly_goal_reaching_state, unordered_set<int>* ret_val);
    unordered_set<int> cheap_find_newly_goal_reaching_states(const Success* optional_success, int optional_goal_state); 

    unordered_map<int, unordered_set<int>> _goal_state_to_actions; // actions needed to progress towards the goal
    State_Action_Graph _graph;
    State_Action_Graph* _layer_graph;

    bool _no_change_since_last_check = false;

    int _cheap_non_scc_checks_since_scc_check = 1;
    unordered_set<int> _memo;
};

#endif
