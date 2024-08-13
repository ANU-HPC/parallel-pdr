#include "Queue_Reference.h"

Queue_Reference::Queue_Reference(int slot, int cost, unsigned long long int timestamp) {
  _slot = slot;
  _cost = cost;
  _timestamp = timestamp;
}

string Queue_Reference::to_string() const {
  return "[QR s:" + std::to_string(_slot) + " c:" + std::to_string(_cost) + " t:" + std::to_string(_timestamp) + "]";
}

int Queue_Reference::slot() const {
  return _slot;
}

int Queue_Reference::cost() const {
  return _cost;
}

unsigned long long int Queue_Reference::timestamp() const {
  return _timestamp;
}

bool Queue_Reference::operator<(const Queue_Reference& other) const {
  // if different costs, use them
  if (this->cost() != other.cost()) return this->cost() < other.cost();

  // same cost, revert to timestamp
  return this->timestamp() > other.timestamp();
}
