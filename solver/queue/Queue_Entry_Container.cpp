#include "Queue_Entry_Container.h"

int Queue_Entry_Container::insert(Queue_Entry element) {
  // first get a free slot, then add it
  int slot;
  if (_pool.empty()) {
    slot = _largest_never_assigned;
    _largest_never_assigned++;
    _elements.push_back(element);
  } else {
    slot = *_pool.rbegin();
    _pool.pop_back();
    _elements[slot] = element;
  }
  _size++;
  return slot;
}

int Queue_Entry_Container::next_slot() {
  if (_pool.empty()) return _largest_never_assigned;
  else return *_pool.rbegin();
}

Queue_Entry Queue_Entry_Container::retrieve(int slot) {
  _size--;
  _pool.push_back(slot);
  return _elements[slot];
}

Queue_Entry* Queue_Entry_Container::peek(int slot) {
  return &_elements[slot];
}

int Queue_Entry_Container::size() {
  return _size;
}
