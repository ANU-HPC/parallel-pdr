#ifndef QUEUE_ENTRY_H
#define QUEUE_ENTRY_H

#include "Obligation.h"
#include "Queue_Reference.h"
#include "Heuristics.h"

class Queue_Entry {
  public:
    Queue_Entry(const Obligation& obligation);
    void register_reference(int heuristic, Queue_Reference* queue_reference);
    Queue_Reference* get_reference(int heuristic);
    Obligation obligation();
    unsigned long long int timestamp();
  private:
    Obligation _obligation;
    unsigned long long int _timestamp;
    vector<Queue_Reference*> _references = vector<Queue_Reference*>(Heuristics::NUM_HEURISTICS);

    static unsigned long long int _timestamp_generator_next_timestamp;
    static unsigned long long int timestamp_generator();
};

#endif
