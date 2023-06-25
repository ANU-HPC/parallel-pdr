#ifndef QUEUE_REFERENCE_H
#define QUEUE_REFERENCE_H

#include <string>

using namespace std;

class Queue_Reference {
  public:
    Queue_Reference(int slot, int cost, unsigned long long int timestamp);
    string to_string() const;
    int slot() const;
    int cost() const;
    unsigned long long int timestamp() const;
    bool operator<(const Queue_Reference& other) const;
  private:
    int _slot;
    int _cost;
    unsigned long long int _timestamp;
};

/*
// want the least to be the most wanted
bool operator<(const Queue_Reference& qr_a, const Queue_Reference& qr_b) {
  // if different costs, use them
  if (qr_a.cost() != qr_b.cost()) return qr_a.cost() < qr_b.cost();

  // same cost, revert to timestamp
  return qr_a.timestamp() > qr_b.timestamp();
}
*/

#endif
