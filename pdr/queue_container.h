#ifndef QUEUE_CONTAINER_H
#define QUEUE_CONTAINER_H

//#include "property_directed_reachability.h"
//#include "queue.h"

#include "options.h"

#include <vector>
#include <map>
#include <unordered_map>
#include <set>
#include <unordered_set>
#include <list>
#include <cassert>
#include <stdlib.h> 
#include <string>
#include <sstream>
#include <cstdlib>
#include <iterator>
#include <iomanip>
#include <iostream>
#include <climits>


using namespace std;

namespace property_directed_reachability {
  class Reference_Entry {
    public:
      Reference_Entry(const int in_reference, const int in_heuristic_cost, const unsigned long long int in_timestamp);
      Reference_Entry();
      int reference;
      int heuristic_cost;
      unsigned long long int timestamp; // Guaranteed to be at least 64 bits
  };

  class Queue_Entry {
    public:
      Queue_Entry(const vector<int>& in_compressed_state, const unsigned long long int in_adding_timestamp);
      Queue_Entry(const Queue_Entry& existing);
      Queue_Entry();
      vector<int> compressed_state;
#if ALLOW_HEURISTIC_H_ADD
      int heuristic_cost_h_add;
#endif
#if ALLOW_HEURISTIC_NOVELTY
      int heuristic_cost_novelty;
#endif
#if ALLOW_HEURISTIC_RANDOM
      int heuristic_cost_random;
#endif
      unsigned long long int timestamp; // Guaranteed to be at least 64 bits
  };

  bool reference_entry_comp(Reference_Entry i,Reference_Entry j);

  struct reference_entry_comp_struct {
    bool operator() (Reference_Entry i, Reference_Entry j) const {
      return reference_entry_comp(i, j);
    }
  };

  class Queue_Container {
    public:
      Queue_Container();
      ~Queue_Container();
      int size();
      void push(const Queue_Entry& entry);
      void erase(const int slot);
      Queue_Entry pop();
      void clear();
      vector<tuple<int, Queue_Entry*>> get_all_in_timestamp_order();

      unordered_map<int, Queue_Entry> underlying_queue_entries;
      set<int> valid_underlying_queue_entry_references; // MAKE PRIVATE
    private:
      // References to the actual data, sorted by the various heuristics employed
      unordered_map<int, set<Reference_Entry, reference_entry_comp_struct>> orderings;

      // The actual data, to be referenced indirectly
      int num_elements = 0;
      vector<int> free_slots;
      int next_unassigned_free_slot = 0;
      int heuristic_to_use_next_index = 0;

      vector<int> heuristics_to_use = vector<int>{HEURISTICS_TO_USE};
  };
}

#endif
