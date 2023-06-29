#include "Default_Queue.h"
#include "Single_Layer_Of_Queue.h"

Default_Queue::Default_Queue() { }

void Default_Queue::push(const Obligation& obligation) {
  const int layer = obligation.layer();
  _layers[layer].push(obligation);

  _size++;
  _lowest_layer_with_content = min(_lowest_layer_with_content, layer);
}

Obligation Default_Queue::pop(int heuristic) {
  assert(!empty());
  const Obligation& ret_val = _layers[_lowest_layer_with_content].pop(heuristic);
  _size--;

  // update the lowest layer with content
  if (_layers[_lowest_layer_with_content].empty()) {
    // need to do something, because this one is now empty!
    if (empty()) {
      // if overall empty, just reset this var
      _lowest_layer_with_content = INT_MAX;
    } else {
      // go and find the first layer with content
      for (int layer=_lowest_layer_with_content+1; ;layer++) {
        if (!_layers[layer].empty()) {
          _lowest_layer_with_content = layer;
          break;
        }
      }
    }
  }

  return ret_val;
}

void Default_Queue::trim(const Reason& reason, int k) {
  // if not at the k, then can push to one above the reason, if at k, then just drop them TODO maybe should just keep them for next time
  make_layer_exist(k); // presumably will exist by this point

  const int layer = reason.layer();
  const int layer_to_push_to = layer+1;
  const bool push = layer<k;

  Single_Layer_Of_Queue* single_layer_of_queue_to_push_to;
  if (push) single_layer_of_queue_to_push_to = &_layers[layer_to_push_to];
  else single_layer_of_queue_to_push_to = NULL;
    
  for (int layer = reason.layer(); layer<_layers.size(); layer++) {
    _size -= _layers[layer].trim(reason, single_layer_of_queue_to_push_to);
  }
}

void Default_Queue::make_layer_exist(int layer) {
  while (_layers.size() <= layer) _layers.push_back(Single_Layer_Of_Queue());
}

bool Default_Queue::empty() {
  return _size == 0;
}

int Default_Queue::size() {
  return _size;
}
