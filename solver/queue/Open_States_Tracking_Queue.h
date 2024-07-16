#ifndef OPEN_STATES_TRACKING_QUEUE_H
#define OPEN_STATES_TRACKING_QUEUE_H

#include <iostream>
#include <cassert>

#include "Default_Queue.h"
#include "../nondeterminism/State_Action_Graph.h"
#include "../Reason_From_Worker.h"
#include "Success.h"

using namespace std;

class Open_States_Tracking_Queue {
  public:
    const int STANDARD = -111;
    const int DEADLOCK = -222;
    const int WILD = -333;
    const int BANNED = -444;
    const int SEEN_GOAL_REACHING = -555;
    const int UNSEEN_GOAL_REACHING = -666;
    const int UNSEEN_NON_GOAL_REACHING = -777;

    void push_initial(const Obligation& obligation);
    void register_success(const Success& success);
    void register_reason(const Reason_From_Worker& reason);
    void register_goal_reaching_state(const int state);
    bool available_work();
    bool fully_empty();
    int lowest_layer_with_content();
    Obligation pop(const int heuristic);

    void inform_of_global_reachability_graph(State_Action_Graph* global_reachability_graph);

    void new_k(const int k);
  private:
    Default_Queue _standard_queue;
    Default_Queue _deadlock_queue;
    unordered_map<int, int> _wild_state_to_layer;
    unordered_map<int, int> _seen_goal_reaching_state_to_layer;
    unordered_set<int> _unseen_goal_reaching_states;
    unordered_set<int> _banned_states;
    State_Action_Graph _graph; // only for this iteration, reset each increment of k
    State_Action_Graph* _global_reachability_graph; // comes in handy for checking consistency
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
    void print();
};

#endif
