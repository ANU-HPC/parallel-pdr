#ifndef QUEUE_H
#define QUEUE_H

#include "property_directed_reachability.h"
#include "queue_container.h"

#if PORTFOLIO_QUEUE
#define QUEUE_TYPE PDR::PDR_Portfolio_Queue
#else
#define QUEUE_TYPE PDR::PDR_Queue
#endif

namespace property_directed_reachability {
  class PDR_Queue {
    // TODO efficiency copying? pass by reference?
    public:
      PDR_Queue();
      PDR_Queue(int* in_obligation_rescheduling_upper_layer);
      ~PDR_Queue();
      void set_up_novelty_heuristic();
      void helper_remove_states_matching_reason_include_layer_subproblem_specific_layer(property_directed_reachability::Queue_Container* specific_queue, const vector<int>& reason, const int layer, const int subproblem);
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
      /*
         vector<tuple<vector<int>, int, int, bool, bool>> get_projections_of_top_or_top_itself();
         vector<tuple<vector<int>, int, int, bool, bool>> get_states_each_nonfinal_subproblem();
         vector<tuple<vector<int>, int, int, bool, bool>> get_states_priority_lower(int num_states);
         vector<tuple<vector<int>, int, int, bool, bool>> get_states_uniform(int num_states);
         */
      int get_fd_heuristic_cost(const vector<int>& compressed_state);
      int get_novelty_heuristic_cost(const vector<int>& state);
      void push(const vector<int>& state, int layer, int subproblem); 
      void push_compressed_state(const vector<int>& compressed_state, int layer, int subproblem);
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
      vector<vector<Queue_Container*>> data; // subproblem to layer to deque of compressed states
      set<pair<pair<vector<int>, int>, int>> hash;
      set<int> available_layers;
      vector<set<int>> available_layers_subproblems;
      set<int> debug_removed_subproblems;
      set<int> active_subproblems;
      unsigned long long int next_timestamp = 0;
      unordered_set<int> novelty_single_seen;
      unordered_map<int, unordered_set<int>> novelty_pair_seen;
  };

  class PDR_Portfolio_Queue {
    public:
      PDR_Portfolio_Queue();
      PDR_Portfolio_Queue(int* in_obligation_rescheduling_upper_layer);
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
#if PORTFOLIO_QUEUE
  extern PDR_Portfolio_Queue queue;
#else
  extern PDR_Queue queue;
#endif
}

#endif
