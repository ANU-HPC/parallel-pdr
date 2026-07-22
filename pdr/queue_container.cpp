#include "queue_container.h"
#include "constants.h"
#include "options.h"

using namespace std;

namespace property_directed_reachability {
  Reference_Entry::Reference_Entry(const int in_reference, const int in_heuristic_cost, const unsigned long long int in_timestamp) {
    reference = in_reference;
    heuristic_cost = in_heuristic_cost;
    timestamp = in_timestamp;
  }

  Reference_Entry::Reference_Entry() {
    // Included as unordered_map needs a no argument constructor
#ifndef NDEBUG
    //cerr << "ERROR: Reference_Entry constructed with no arguments" << endl;
    timestamp = INT_MIN;
    heuristic_cost = INT_MIN;
#endif
  }

  bool reference_entry_comp(Reference_Entry i, Reference_Entry j) { 
    if (i.heuristic_cost == j.heuristic_cost) {
      return i.timestamp > j.timestamp; // break ties favouring newer entries
    } else {
      return i.heuristic_cost < j.heuristic_cost;
    }
  }

  Queue_Entry::Queue_Entry(const vector<int>& in_compressed_state, const unsigned long long int in_timestamp) {
    compressed_state = in_compressed_state;
    timestamp = in_timestamp;
    // The other parameters are set afterwards, otherwise would need a variable length constructor function
#if ALLOW_HEURISTIC_H_ADD
    heuristic_cost_h_add = INT_MIN;
#endif
#if ALLOW_HEURISTIC_NOVELTY
    heuristic_cost_novelty = INT_MIN;
#endif
#if ALLOW_HEURISTIC_RANDOM
    heuristic_cost_novelty = INT_MIN;
#endif
  }

  Queue_Entry::Queue_Entry(const Queue_Entry& existing) {
    compressed_state = existing.compressed_state;
#if ALLOW_HEURISTIC_H_ADD
    heuristic_cost_h_add = existing.heuristic_cost_h_add;
#endif
#if ALLOW_HEURISTIC_NOVELTY
    heuristic_cost_novelty = existing.heuristic_cost_novelty;
#endif
#if ALLOW_HEURISTIC_RANDOM
    heuristic_cost_random = existing.heuristic_cost_random;
#endif
    timestamp = existing.timestamp;
  }

  Queue_Entry::Queue_Entry() {
    // Included as unordered_map needs a no argument constructor
    //cerr << "ERROR: Queue_Entry constructed with no arguments" << endl;
#ifndef NDEBUG
    timestamp = INT_MIN;
    // The other parameters are set afterwards, otherwise would need a variable length constructor function
#if ALLOW_HEURISTIC_H_ADD
    heuristic_cost_h_add = INT_MIN;
#endif
#if ALLOW_HEURISTIC_NOVELTY
    heuristic_cost_novelty = INT_MIN;
#endif
#if ALLOW_HEURISTIC_RANDOM
    heuristic_cost_random = INT_MIN;
#endif
#endif
  }

  Queue_Container::Queue_Container() {
    orderings[HEURISTIC_NONE] = set<Reference_Entry, reference_entry_comp_struct>();
#if ALLOW_HEURISTIC_H_ADD
    orderings[HEURISTIC_H_ADD] = set<Reference_Entry, reference_entry_comp_struct>();
#endif
#if ALLOW_HEURISTIC_NOVELTY
    orderings[HEURISTIC_NOVELTY] = set<Reference_Entry, reference_entry_comp_struct>();
#endif
#if ALLOW_HEURISTIC_RANDOM
    orderings[HEURISTIC_RANDOM] = set<Reference_Entry, reference_entry_comp_struct>();
#endif
    if (heuristics_to_use.size() == 0) {
      cerr << "ERROR: not using any heuristics to sort the queue" << endl;
      exit(1);
    }

    // checking all wanted heuristics are allowed
    bool using_unsuported_heuristic = false;
    for (const int& heuristic_to_use : heuristics_to_use) {
      using_unsuported_heuristic = using_unsuported_heuristic || ((heuristic_to_use == HEURISTIC_H_ADD) && (ALLOW_HEURISTIC_H_ADD == 0));
      using_unsuported_heuristic = using_unsuported_heuristic || ((heuristic_to_use == HEURISTIC_NOVELTY) && (ALLOW_HEURISTIC_NOVELTY == 0));
      using_unsuported_heuristic = using_unsuported_heuristic || ((heuristic_to_use == HEURISTIC_RANDOM) && (ALLOW_HEURISTIC_RANDOM == 0));
    }

    if (using_unsuported_heuristic) {
      cerr << "ERROR: trying to use heuristic (in queue_container.h:heuristics_to_use) that has not been allowed (in options.h)" << endl;
      exit(1);
    }
  }

  Queue_Container::~Queue_Container() {
    clear();
  }

  void Queue_Container::clear() {
    num_elements = 0;
    next_unassigned_free_slot = 0;
    heuristic_to_use_next_index = 0;
    free_slots.clear();

    underlying_queue_entries.clear();

    orderings[HEURISTIC_NONE].clear();
#if ALLOW_HEURISTIC_H_ADD
    orderings[HEURISTIC_H_ADD].clear();
#endif
#if ALLOW_HEURISTIC_NOVELTY
    orderings[HEURISTIC_NOVELTY].clear();
#endif
#if ALLOW_HEURISTIC_RANDOM
    orderings[HEURISTIC_RANDOM].clear();
#endif
  }

  void Queue_Container::push(const Queue_Entry& queue_entry) {
    // Ensure that the required heuristics have been assigned
#if ALLOW_HEURISTIC_H_ADD
    assert(queue_entry.heuristic_cost_h_add != INT_MIN);
#endif
#if ALLOW_HEURISTIC_NOVELTY
    assert(queue_entry.heuristic_cost_novelty != INT_MIN);
#endif
#if ALLOW_HEURISTIC_RANDOM
    assert(queue_entry.heuristic_cost_random != INT_MIN);
#endif

    // Insert the entry into the main store
    int slot;
    if (free_slots.size()) {
      slot = *free_slots.rbegin();
      free_slots.pop_back();
    } else {
      slot = next_unassigned_free_slot;
      next_unassigned_free_slot++;
    }
    underlying_queue_entries[slot] = queue_entry;
    num_elements++;

    // reference where it is in the various sorted orderings
    Reference_Entry reference_entry_none = Reference_Entry(slot, 1, queue_entry.timestamp);
    orderings[HEURISTIC_NONE].insert(reference_entry_none);
    assert(orderings[HEURISTIC_NONE].size() == num_elements);

#if ALLOW_HEURISTIC_H_ADD
    Reference_Entry reference_entry_h_add = Reference_Entry(slot, queue_entry.heuristic_cost_h_add, queue_entry.timestamp);
    orderings[HEURISTIC_H_ADD].insert(reference_entry_h_add);
    assert(orderings[HEURISTIC_H_ADD].size() == num_elements);
#endif

#if ALLOW_HEURISTIC_NOVELTY
    Reference_Entry reference_entry_novelty = Reference_Entry(slot, queue_entry.heuristic_cost_novelty, queue_entry.timestamp);
    orderings[HEURISTIC_NOVELTY].insert(reference_entry_novelty);
    assert(orderings[HEURISTIC_NOVELTY].size() == num_elements);
#endif

#if ALLOW_HEURISTIC_RANDOM
    Reference_Entry reference_entry_random = Reference_Entry(slot, queue_entry.heuristic_cost_random, queue_entry.timestamp);
    orderings[HEURISTIC_RANDOM].insert(reference_entry_random);
    assert(orderings[HEURISTIC_RANDOM].size() == num_elements);
#endif
  }

  Queue_Entry Queue_Container::pop() {
    // determine the heuristic to use
    const int heuristic_to_use = heuristics_to_use[heuristic_to_use_next_index];
    heuristic_to_use_next_index++;
    if (heuristic_to_use_next_index >= heuristics_to_use.size()) heuristic_to_use_next_index = 0;

    // Get the entry to return from the suitable ordering
    const int slot = (*orderings[heuristic_to_use].begin()).reference;
    Queue_Entry queue_entry = underlying_queue_entries[slot];
    erase(slot);
    return queue_entry;
  }

  void Queue_Container::erase(const int slot) {
    Queue_Entry queue_entry = underlying_queue_entries[slot];
    free_slots.push_back(slot);
    num_elements--;

    // remove the corresponding reference from all orders
    Reference_Entry reference_entry_none = Reference_Entry(slot, 1, queue_entry.timestamp);
    orderings[HEURISTIC_NONE].erase(reference_entry_none);
    assert(orderings[HEURISTIC_NONE].size() == num_elements);

#if ALLOW_HEURISTIC_H_ADD
    Reference_Entry reference_entry_h_add = Reference_Entry(slot, queue_entry.heuristic_cost_h_add, queue_entry.timestamp);
    orderings[HEURISTIC_H_ADD].erase(reference_entry_h_add);
    assert(orderings[HEURISTIC_H_ADD].size() == num_elements);
#endif

#if ALLOW_HEURISTIC_NOVELTY
    Reference_Entry reference_entry_novelty = Reference_Entry(slot, queue_entry.heuristic_cost_novelty, queue_entry.timestamp);
    orderings[HEURISTIC_NOVELTY].erase(reference_entry_novelty);
    assert(orderings[HEURISTIC_NOVELTY].size() == num_elements);
#endif

#if ALLOW_HEURISTIC_RANDOM
    Reference_Entry reference_entry_random = Reference_Entry(slot, queue_entry.heuristic_cost_random, queue_entry.timestamp);
    orderings[HEURISTIC_RANDOM].erase(reference_entry_random);
    assert(orderings[HEURISTIC_RANDOM].size() == num_elements);
#endif
  }

  vector<tuple<int, Queue_Entry*>> Queue_Container::get_all_in_timestamp_order() {
    vector<tuple<int, Queue_Entry*>> ret_val;
    for (auto const& reference_entry : orderings[HEURISTIC_NONE]) {
      const int slot = reference_entry.reference;
      ret_val.push_back(tuple<int, Queue_Entry*>(slot, &underlying_queue_entries[slot]));
    }
    return ret_val;
  }

  int Queue_Container::size() {
    return num_elements;
  }

}
