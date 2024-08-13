#include "Default_Queue.h"

Default_Queue::Default_Queue() { }

bool Default_Queue::remove(const Compressed_State& state) {
  const int state_id = state.id();
  if (_state_id_to_layer.find(state_id) == _state_id_to_layer.end()) return false;

  // otherwise it should be here
  const int layer = _state_id_to_layer[state.id()];
  const int removed = _layers[layer].remove_state(state);
  assert(removed);
  _state_id_to_layer.erase(state.id());
  _size--;
  update_lowest_layer_with_content();


  assert(_size == _state_id_to_layer.size());

  return true;
}

void Default_Queue::remove_and_ban_states_as_goal_reaching(const Compressed_State& state) {
  remove(state);
  _banned_states.insert(state);
}

bool Default_Queue::contains_state_id(const int state_id) {
  return _state_id_to_layer.find(state_id) != _state_id_to_layer.end();
}

int Default_Queue::state_id_to_layer(const int state_id) {
  return _state_id_to_layer[state_id];
}

void Default_Queue::push(const Obligation& obligation) {
  //LOG << _name << "pushing " << obligation.to_string() << endl;
  assert(obligation.layer() > 0); // AAA
  if (_banned_states.find(obligation.compressed_state()) != _banned_states.end()) {
    LOG << "not adding as banned: " << obligation.to_string() << endl;
    return;
  }

  const Compressed_State& state = obligation.compressed_state();
  const int state_id = state.id();

  if (_state_id_to_layer.find(state_id) == _state_id_to_layer.end()) {
    // not in the queue, add as usual
    const int layer = obligation.layer();
    make_layer_exist(layer);

    bool added = _layers[layer].push(obligation);
    _size++;
    _lowest_layer_with_content = min(_lowest_layer_with_content, layer);
    _state_id_to_layer[state_id] = layer;
  } else {
    LOG << " already in the queue..." << endl;
    assert(false);
    // state already exists in the queue. 
    // keep the higher of the 2, it must know something
    const int existing_layer = _state_id_to_layer[state_id];
    const int new_layer = obligation.layer();

    if (new_layer > existing_layer) {
      // remove the old one
      int removed = _layers[existing_layer].remove_state(state);
      assert(removed);

      // add at new layer
      bool added = _layers[new_layer].push(obligation);
      assert(added);

      // update layer
      _state_id_to_layer[state_id] = new_layer;
    }
  }
  assert(_size == _state_id_to_layer.size());
}

Obligation Default_Queue::pop(int heuristic) {
  assert(!empty());
  assert(!_layers[_lowest_layer_with_content].empty());

  const Obligation& ret_val = _layers[_lowest_layer_with_content].pop(heuristic);
  assert(ret_val.layer() == _lowest_layer_with_content);
  _size--;

  update_lowest_layer_with_content();

  const int state_id = ret_val.compressed_state().id();

  assert(_state_id_to_layer[state_id] == ret_val.layer());
  _state_id_to_layer.erase(state_id);

  assert (empty() || !_layers[_lowest_layer_with_content].empty());
  assert(_size == _state_id_to_layer.size());

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

// For this, work out which states where moved/deleted, then add all these to a set, return the set
unordered_set<int> Default_Queue::trim(const Contextless_Reason& reason, int k) {
  // if the reason is below k, then can push to one above the reason, if at k, then just drop them TODO maybe should just keep them for next time
  //LOG << "INT start trimming for " << _name << endl;
  unordered_set<int> moved_state_ids;

  make_layer_exist(k); // presumably will exist by this point

  const int reason_layer = reason.layer();
  const int layer_to_push_to = reason_layer+1;
  const bool push = layer_to_push_to<=k;

  Single_Layer_Of_Queue* single_layer_of_queue_to_push_to;
  if (push) single_layer_of_queue_to_push_to = &_layers[layer_to_push_to];
  else      single_layer_of_queue_to_push_to = NULL;
    
  for (int layer = 1; layer<=reason_layer; layer++) {
    const int layer_increment = layer_to_push_to - layer;
    _size -= _layers[layer].trim(reason, single_layer_of_queue_to_push_to, layer_increment, &moved_state_ids);
  }

  for (auto it=moved_state_ids.begin(); it!=moved_state_ids.end(); it++) {
    const int state_id = *it; 
    if (push) _state_id_to_layer[state_id] = layer_to_push_to;
    else      _state_id_to_layer.erase(state_id);
  }

  update_lowest_layer_with_content();

  //LOG << "INT end trimming for " << _name << endl;
  return moved_state_ids;
}

void Default_Queue::print_sizes() {

  vector<Obligation> obligations = get_obligations();


  for (int layer=0; layer<_layers.size(); layer++) {
    vector<int> ids;

    for (auto it=obligations.begin(); it!=obligations.end(); it++) {
      const Obligation& obligation =*it;
      if (obligation.layer() == layer) {
        ids.push_back(obligation.compressed_state().id());
      }
    }

    LOG << "layer " << layer << " has size " << _layers[layer].size() << " : " << Utils::to_string(ids) << endl;
  }
}

void Default_Queue::set_name(string name) {
  _name = "[QUEUE:" + name + "] ";
}

vector<Obligation> Default_Queue::get_obligations() {
  LOG << "expensive, use with care..." << endl;
  vector<Obligation> obligations;
  for (int layer=0; layer<_layers.size(); layer++) {
    const vector<Compressed_State>& states = _layers[layer].get_states();

    for (auto it=states.begin(); it!=states.end(); it++) {
      obligations.push_back(Obligation(*it, layer, 0, true, vector<int>()));
    }
  }
  return obligations;
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
