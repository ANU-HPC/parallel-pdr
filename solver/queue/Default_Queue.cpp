#include "Default_Queue.h"

Default_Queue::Default_Queue() { }

void Default_Queue::remove_and_ban_states_as_goal_reaching(const Compressed_State state) {
  _banned_states.insert(state);

  int removed = 0;
  for (int layer=0; layer<=_lowest_layer_with_content; layer++) {
    removed += _layers[layer].remove_state(state);
  }

  assert(removed <= 1);
  _size -= removed;

  update_lowest_layer_with_content();
}

void Default_Queue::push(const Obligation& obligation) {
  if (_banned_states.find(obligation.compressed_state()) != _banned_states.end()) return;

  //LOG << "not already banned: " << obligation.to_string() << endl;

  const int layer = obligation.layer();
  make_layer_exist(layer);

  if (_layers[layer].push(obligation)) {
    _size++;
    _lowest_layer_with_content = min(_lowest_layer_with_content, layer);
    //LOG << "could add to single layer" << endl;
  } else LOG << "not added" << endl;

}

Obligation Default_Queue::pop(int heuristic) {
  assert(!empty());
  assert(!_layers[_lowest_layer_with_content].empty());

  const Obligation& ret_val = _layers[_lowest_layer_with_content].pop(heuristic);
  assert(ret_val.layer() == _lowest_layer_with_content);
  _size--;

  update_lowest_layer_with_content();

  assert (empty() || !_layers[_lowest_layer_with_content].empty());
  return ret_val;
}

/*
void Default_Queue::trim(const Contextless_Reason& reason, int k, Layer_State_Action_Graph* graph) {
  // also update the changes in the layer state action graph
  // if the reason is below k, then can push to one above the reason, if at k, then just drop them TODO maybe should just keep them for next time
  make_layer_exist(k); // presumably will exist by this point

  const int reason_layer = reason.layer();
  const int layer_to_push_to = reason_layer+1;
  const bool push = layer_to_push_to<k;

  Single_Layer_Of_Queue* single_layer_of_queue_to_push_to;
  if (push) single_layer_of_queue_to_push_to = &_layers[layer_to_push_to];
  else      single_layer_of_queue_to_push_to = NULL;
    
  for (int layer = 1; layer<=reason_layer; layer++) {
    const int layer_increment = layer_to_push_to - layer;
    _size -= _layers[layer].trim(reason, single_layer_of_queue_to_push_to, layer_increment);
  }

  update_lowest_layer_with_content();
}
*/

void Default_Queue::trim(const Contextless_Reason& reason, int k) {
  // if the reason is below k, then can push to one above the reason, if at k, then just drop them TODO maybe should just keep them for next time
  make_layer_exist(k); // presumably will exist by this point

  const int reason_layer = reason.layer();
  const int layer_to_push_to = reason_layer+1;
  const bool push = layer_to_push_to<k;

  Single_Layer_Of_Queue* single_layer_of_queue_to_push_to;
  if (push) single_layer_of_queue_to_push_to = &_layers[layer_to_push_to];
  else      single_layer_of_queue_to_push_to = NULL;
    
  for (int layer = 1; layer<=reason_layer; layer++) {
    const int layer_increment = layer_to_push_to - layer;
    _size -= _layers[layer].trim(reason, single_layer_of_queue_to_push_to, layer_increment);
  }

  update_lowest_layer_with_content();
}

void Default_Queue::print_sizes() {
  for (int layer=0; layer<_layers.size(); layer++) {
    LOG << "layer " << layer << " has size " << _layers[layer].size() << endl;
  }
}

void Default_Queue::make_layer_exist(int layer) {
  assert(layer>=0);
  while (_layers.size() <= layer) _layers.push_back(Single_Layer_Of_Queue());
}

bool Default_Queue::empty() {
  return _size == 0;
}

int Default_Queue::size() {
  return _size;
}

int Default_Queue::lowest_layer_with_content() {
  return _lowest_layer_with_content;
}

void Default_Queue::update_lowest_layer_with_content() {
  if (empty()) {
    // if overall empty, just reset this var
    _lowest_layer_with_content = INT_MAX;
    return;
  } else if (_layers[_lowest_layer_with_content].empty()) { // there is content overall, lets see if there is content in this one
    // need to do something, because this one is now empty! Go and find the first layer with content
    for (int layer = _lowest_layer_with_content+1; layer < _layers.size(); layer++) {
      if (!_layers[layer].empty()) {
        _lowest_layer_with_content = layer;
        return;
      }
    }

    // if have not found a layer with content when searching upwards, there is a problem
    LOG << "ERROR: SHOULD NOT BE HERE!" << endl;
    assert(0);
    exit(1);
  }
}
