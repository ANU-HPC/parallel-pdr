#ifndef SINGLE_LAYER_OF_QUEUE_H
#define SINGLE_LAYER_OF_QUEUE_H

#include <vector>
#include <cassert>
#include <unordered_set>

#include "Queue_Entry_Container.h"
#include "Obligation.h"
#include "Contextless_Reason.h"
#include "Queue_Reference.h"
#include "Queue_Entry.h"
#include "Heuristics.h"
#include "Global.h"

using namespace std;

struct Queue_Reference_Pointer_Compare {
  bool operator() (const Queue_Reference* a, const Queue_Reference* b) const {
    return *a < *b;
  }
};

class Single_Layer_Of_Queue {
  public:
    Single_Layer_Of_Queue();
    bool push(const Obligation& obligation);
    Obligation pop(int heuristic);
    int size();
    bool empty();
    int trim(const Contextless_Reason& reason, Single_Layer_Of_Queue* other_to_push_to, int layer_increment, unordered_set<int>* moved_state_ids);
    int remove_state(const Compressed_State& state);
    vector<Compressed_State> get_states();
  private:
    Obligation remove_obligation_at_slot(int slot);
    Queue_Entry_Container _entries;
    vector<set<Queue_Reference*, Queue_Reference_Pointer_Compare>> _heuristic_to_references = vector<set<Queue_Reference*, Queue_Reference_Pointer_Compare>>(Heuristics::NUM_HEURISTICS);
    unordered_map<Compressed_State, int, Compressed_State_Hash> _state_to_slot;
    //unordered_map<int, int> state_id_to_slot;
    //unordered_map<int, int> state_id_to_slot;
};

#endif
