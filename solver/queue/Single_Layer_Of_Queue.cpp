#include "Single_Layer_Of_Queue.h"

Single_Layer_Of_Queue::Single_Layer_Of_Queue() { }

bool Single_Layer_Of_Queue::push(const Obligation& obligation) {
  // first check it is not already in here
  if (_all_obligations.find(obligation) != _all_obligations.end()) return false;
  _all_obligations.insert(obligation);

  // to add, so make the entry
  Queue_Entry queue_entry = Queue_Entry(obligation);

  const int slot = _entries.next_slot();
  const unsigned long long int timestamp = queue_entry.timestamp();

  // then all the references, and add them to the reference lists and the entry itself
  for (auto it=Global::active_heuristics.begin(); it!=Global::active_heuristics.end(); it++) {
    const int heuristic = *it;
    const int cost = Heuristics::get_cost(heuristic, obligation);

    Queue_Reference* queue_reference = new Queue_Reference(slot, cost, timestamp);
    queue_entry.register_reference(heuristic, queue_reference);
    _heuristic_to_references[heuristic].insert(queue_reference);
  }

  // just a check to make sure entries worked as it should (TODO remove when more confident)
  const int actual_slot = _entries.insert(queue_entry);
  assert(actual_slot == slot);

  return true;
}

Obligation Single_Layer_Of_Queue::pop(int heuristic) {
  assert(!empty());

  // first get the relevant reference
  Queue_Reference* queue_reference = *_heuristic_to_references[heuristic].rbegin();

  // then the slot, and remove and return it
  Obligation ret_val = remove_obligation_at_slot(queue_reference->slot());

  // remove from global set
  _all_obligations.erase(ret_val);
  return ret_val;
}

Obligation Single_Layer_Of_Queue::remove_obligation_at_slot(int slot) {
  // get the entry from the slot
  Queue_Entry queue_entry = _entries.retrieve(slot);

  // go through the references to this entry and remove them
  for (auto it=Global::active_heuristics.begin(); it!=Global::active_heuristics.end(); it++) {
    const int heuristic = *it;
    Queue_Reference* queue_reference = queue_entry.get_reference(heuristic);
    _heuristic_to_references[heuristic].erase(queue_reference);
    delete queue_reference;
  }

  return queue_entry.obligation();
}

int Single_Layer_Of_Queue::trim(const Reason& reason, Single_Layer_Of_Queue* other_to_push_to) {
  // return the number of deleted elements, if not pushed to alternate layer
  int num_removed = 0;

  // grab A used heuristic (it doesn't matter which one, we will just go through all the obligations)
  const int heuristic = *Global::active_heuristics.begin();
  const bool pushing = other_to_push_to != NULL;

  // go through all references noting the slots to remove from (then remove them after so we are not editing the set we are iterating over)
  vector<int> slots_to_remove;
  for (auto it=_heuristic_to_references[heuristic].begin(); it!=_heuristic_to_references[heuristic].end(); it++) {
    Queue_Reference* queue_reference = *it; 
    const int slot = queue_reference->slot();
    Queue_Entry* queue_entry = _entries.peek(slot);
    if (queue_entry->obligation().trimmed_by_reason(reason)) {
      slots_to_remove.push_back(slot);
    }
  }

  for (auto it=slots_to_remove.begin(); it!=slots_to_remove.end(); it++) {
    const int slot = *it;
    Obligation obligation = remove_obligation_at_slot(slot);
    if (pushing) {
      const bool successful_push_up = other_to_push_to->push(obligation);
      assert(successful_push_up); // unsure if this is actually bad... may be triggered by a change later on
      if (!successful_push_up) num_removed--;
    } else num_removed++;
  }

  return num_removed;
}

int Single_Layer_Of_Queue::size() {
  return _entries.size();
}

bool Single_Layer_Of_Queue::empty() {
  return _entries.size() == 0;
}
