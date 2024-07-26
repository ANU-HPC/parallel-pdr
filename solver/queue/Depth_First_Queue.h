#ifndef DEPTH_FIRST_QUEUE_H
#define DEPTH_FIRST_QUEUE_H

#include <iostream>
#include <cassert>

#include "../Reason_From_Worker.h"
#include "Success.h"
#include "../nondeterminism/State_Action_Graph.h"

using namespace std;

// TODO queue trimming

class Depth_First_Queue {
  public:
    Obligation pop(const int heuristic);
    void push_initial(const Obligation& obligation);
    void register_success(const Success& success);
    void register_reason(const Reason_From_Worker& reason);
    bool size();
    void print();

    void register_goal_reaching_state(const int state);
    void inform_of_global_reachability_graph(State_Action_Graph* global_reachability_graph);

    // some unused function for compliance with wrapper
    int lowest_layer_with_content() {return INT_MAX;}
    void new_k(int k) {}
    bool available_work() {return _size != 0;}
    bool fully_empty() {return _size == 0;}

  private:
    const int UNKNOWN_DEPTH = INT_MAX;
    void push(const int depth, const int state, const int layer);
    int get_depth(int state);
    void set_depth(int state, int depth);
    vector<int> _state_to_depth; // includes states not in the queue currently, UNKNOWN_DEPTH for unknown
    vector<unordered_map<int, int>> _depth_to_state_to_layer; // TODO change this to some sort of ordered set to add a heuristic
    int _size = 0;
    unordered_set<int> _goal_reaching;

    void trim_to_reachable_helper(unordered_set<int>* reachable_states, int state);
    void trim_to_reachable();
    unordered_set<int> _trim_to_reachable_memo;

    State_Action_Graph* _global_reachability_graph;
    /*

    Default_Queue _standard_queue;
    Default_Queue _deadlock_queue;
    unordered_map<int, int> _wild_state_to_layer;
    unordered_map<int, int> _seen_goal_reaching_state_to_layer;
    unordered_set<int> _unseen_goal_reaching_states;
    unordered_set<int> _banned_states;
    State_Action_Graph _graph; // only for this iteration, reset each increment of k
    int _k;

    unordered_map<int, unordered_set<pair<int, int>, Int_Pair_Hash>> _outcome_to_state_actions_it_is_blocking;
    unordered_map<int, unordered_set<int>> _state_to_blocked_actions;

    int state_to_status(const int state);
    int seen_state_to_layer(const int state);
    string status_to_string(const int status);

    void check_if_outcome_layer_change_triggers_unblocking_of_proceeding_state_actions(const int state);
    void check_if_state_action_should_be_unblocked(const pair<int, int> state_action);

    unordered_set<Success, Bad_Success_Hash> _seen_successes;

    bool consistent();
    */
};

#endif
