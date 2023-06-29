#ifndef SINGLE_LAYER_OF_QUEUE_H
#define SINGLE_LAYER_OF_QUEUE_H

#include <vector>
#include <cassert>
#include <unordered_set>

#include "Queue_Entry_Container.h"
#include "Obligation.h"
#include "Reason.h"
#include "Queue_Reference.h"
#include "Queue_Entry.h"
#include "Heuristics.h"
#include "Global.h"

struct Queue_Reference_Pointer_Compare {
  bool operator() (const Queue_Reference* a, const Queue_Reference* b) const {
    return *a < *b;
  }
};

class Single_Layer_Of_Queue {
  public:
    Single_Layer_Of_Queue();
    void push(const Obligation& obligation);
    Obligation pop(int heuristic);
    int size();
    bool empty();
    int trim(const Reason& reason, Single_Layer_Of_Queue* other_to_push_to);
  private:
    Obligation remove_obligation_at_slot(int slot);

    unordered_set<Obligation, Obligation_Hash> _all_obligations;
    Queue_Entry_Container _entries;
    vector<set<Queue_Reference*, Queue_Reference_Pointer_Compare>> _heuristic_to_references = vector<set<Queue_Reference*, Queue_Reference_Pointer_Compare>>(Heuristics::NUM_HEURISTICS);
};

#endif
