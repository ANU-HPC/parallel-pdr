#include "Queue_Entry.h"

Queue_Entry::Queue_Entry(const Obligation& obligation) {
  _timestamp = timestamp_generator();
  _obligation = obligation;
}

unsigned long long int Queue_Entry::timestamp() {
  return _timestamp;
}

Obligation Queue_Entry::obligation() {
  return _obligation;
}

void Queue_Entry::register_reference(int heuristic, Queue_Reference* queue_reference) {
  _references[heuristic] = queue_reference;
}

Queue_Reference* Queue_Entry::get_reference(int heuristic) {
  return _references[heuristic];
}


unsigned long long int Queue_Entry::_timestamp_generator_next_timestamp = 0;

unsigned long long int Queue_Entry::timestamp_generator() {
  _timestamp_generator_next_timestamp++;
  return _timestamp_generator_next_timestamp-1;
}
