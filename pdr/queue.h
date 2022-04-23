#ifndef QUEUE_H
#define QUEUE_H

#include <vector>
#include <deque>
#include <map>
#include <set>
#include <list>
#include <cassert>
#include <stdlib.h> 
#include <string>
#include <sstream>
#include <cstdlib>

#include <iterator>
#include <iomanip>
#include <sstream>

#include <iostream>
#include <algorithm>
#include <iterator>

#define MONOLYTH_WITH_PROJECTIONS 0
#define USE_HEURISTIC 1

using namespace std;

class Queue_Entry {
  public:
    Queue_Entry(const vector<int>& in_compressed_state, const int in_heuristic_cost, const unsigned long long int in_adding_timestamp);
    Queue_Entry(const Queue_Entry& existing);
    vector<int> compressed_state;
    int heuristic_cost;
    unsigned long long int timestamp; // Guaranteed to be at least 64 bits
};

bool queue_entry_comp(Queue_Entry i,Queue_Entry j);

struct queue_entry_comp_struct {
  bool operator() (Queue_Entry i, Queue_Entry j) const {
    return queue_entry_comp(i, j);
  }
};


class PDR_Queue {
  // TODO efficiency copying? pass by reference?
  public:
    PDR_Queue(int in_num_subproblems, int* in_obligation_rescheduling_upper_layer, bool in_performing_obligation_rescheduling, map<int, vector<int>> in_subproblem_to_propositions);
    ~PDR_Queue();
    void helper_remove_states_matching_reason_include_layer_subproblem_specific_layer(set<Queue_Entry, queue_entry_comp_struct>* specific_queue, const vector<int>& reason, const int layer, const int subproblem);
    void remove_states_matching_reason_layer_subproblem(const vector<int>& reason, const int max_layer, const int subproblem);
    void remove_subproblem(int subproblem);
    void make_layer_exist(int layer);
    bool empty_for_subproblem(const int subproblem);
    bool empty();
    int get_next_layer();
    int get_next_subproblem_from_layer(int layer);
    tuple<vector<int>, int, int> get_next_state();
    tuple<vector<int>, int, int> get_next_state_layer(int layer);
    tuple<vector<int>, int, int> get_next_state_layer_subproblem(int layer, int subproblem);
#if MONOLYTH_WITH_PROJECTIONS
    void monolyth_succeeded();
#else
    void a_top_projection_failed();
#endif
    vector<tuple<vector<int>, int, int, bool, bool>> pop(int num_states);
    int get_heuristic_cost(const vector<int>& state);
    int get_novelty_heuristic_cost(const vector<int>& state);
    void push(const vector<int>& state, int layer, int subproblem);
    //void push(const Queue_Entry& queue_entry, int layer, int subproblem);
    void push(Queue_Entry queue_entry, int layer, int subproblem);
    void print_size();
    int size();

    tuple<vector<int>, int, int> contemplated_monolyth = tuple<vector<int>, int, int>(vector<int>(), 0, 0);
  private:
    int* obligation_rescheduling_upper_layer = NULL;
    bool performing_obligation_rescheduling; 
    map<int, vector<int>> subproblem_to_propositions;
    int num_subproblems = -1;
    int max_layer_ever = -1;
    //vector<vector<Set_Trie>>* reasons;
    vector<vector<set<Queue_Entry, queue_entry_comp_struct>*>> data; // subproblem to layer to deque of compressed states
    set<pair<pair<vector<int>, int>, int>> hash;
    set<int> available_layers;
    vector<set<int>> available_layers_subproblems;
    set<int> debug_removed_subproblems;
    set<int> active_subproblems;
    unsigned long long int next_timestamp = 0;
    set<int> novelty_single;
    map<int, set<int>> novelty_pair;
};


class PDR_Portfolio_Queue {
  public:
    PDR_Portfolio_Queue(int in_num_subproblems, int* in_obligation_rescheduling_upper_layer, bool in_performing_obligation_rescheduling, int in_num_workers, map<int, vector<int>> in_subproblem_to_propositions);
    ~PDR_Portfolio_Queue();
    void push(const vector<int>& state, int layer, int subproblem, int worker);
    void remove_states_matching_reason_layer_subproblem(const vector<int>& reason, const int max_layer, const int subproblem);
    bool empty();
    vector<tuple<vector<int>, int, int, int, bool, bool>> pop(const set<int>& free_workers);
    bool empty_for_subproblem(int subproblem);
    void remove_subproblem(int subproblem);
    void a_top_projection_failed();
    void print_size();
  private:
    int num_workers;
    vector<PDR_Queue*> worker_queues;
};
#endif
