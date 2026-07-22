#include "Depth_First_Queue.h" 

Obligation Depth_First_Queue::pop(const int heuristic) {
  // highest depth with content
  assert(size() != 0);

  for (int depth = _depth_to_state_to_layer.size()-1;; depth--) {
    if (_depth_to_state_to_layer[depth].size()) {
      const pair<int, int> state_layer = *_depth_to_state_to_layer[depth].begin();

      const int state = state_layer.first;
      const int layer = state_layer.second;

      _depth_to_state_to_layer[depth].erase(state);
      _size--;

      Obligation ret_val = Obligation(
          Compressed_State::state_id_to_state(state),
          layer,
          0,
          true,
          vector<int>());

      return ret_val;
    }
  }
}

void Depth_First_Queue::push_initial(const Obligation& obligation) {
  const int state = obligation.compressed_state().id();
  set_depth(state, 0); // only needed the first time
  if (_depth_to_state_to_layer.size() == 0) {
    _depth_to_state_to_layer.push_back(unordered_map<int, int>());
  }
  _depth_to_state_to_layer[0][state] = obligation.layer();
  _size++;
}

void Depth_First_Queue::push(const int depth, const int state, const int layer) {
  if (_goal_reaching.find(state) != _goal_reaching.end()) return;

  while (_depth_to_state_to_layer.size() <= depth) {
    _depth_to_state_to_layer.push_back(unordered_map<int, int>());
  }

  const int size_before = _depth_to_state_to_layer[depth].size();
  _depth_to_state_to_layer[depth][state] = layer;
  const int size_after = _depth_to_state_to_layer[depth].size();

  if (size_before != size_after) _size++; // actually added
}

void Depth_First_Queue::register_success(const Success& success) {
  const int original_state = success.original_obligation().compressed_state().id();
  const int original_state_depth = get_depth(original_state);
  const int original_state_layer = success.original_obligation().layer();

  assert (original_state_depth != UNKNOWN_DEPTH); // should have seen this state before

  push(original_state_depth, original_state, original_state_layer);

  // deal with the outcomes
  for (const Obligation& obl : success.successor_obligations()) {
    const int outcome = obl.compressed_state().id();
    const int layer = obl.layer();

    // change the _state_to_depth entry
    const int old_depth = get_depth(outcome);
    const int new_depth = min(old_depth, original_state_depth+1);
    set_depth(outcome, new_depth);

    // work where adding/removing from _depth_to_state_to_layer
    const int already_in_queue = (old_depth != UNKNOWN_DEPTH) && (old_depth < _depth_to_state_to_layer.size()) && (_depth_to_state_to_layer[old_depth].find(outcome) != _depth_to_state_to_layer[old_depth].end());
    const int changed_depths = old_depth != new_depth;

    // if changed and already here - remove then readd
    // if changed and not already here - just add
    // if unchanged and already here do nothing
    // if unchanged and not here add

    if (!changed_depths & already_in_queue) {
      // don't do anything, havent changed and already here
    } else {
      if (already_in_queue) {
        // if already in queue, remove from where it was
        _depth_to_state_to_layer[new_depth].erase(outcome);
        _size--;
      }
      // then add to the new spot
      push(new_depth, outcome, layer);
    }
  }

  trim_to_reachable();

  if (QT) {
    LOG << "finished adding success, queue now:" << endl;
    print();
  }
}

void Depth_First_Queue::register_reason(const Reason_From_Worker& reason) {
  // TODO nothing for now...
  trim_to_reachable();
}

bool Depth_First_Queue::size() {
  return _size;
}

void Depth_First_Queue::print() {
  LOG << "Depth:" << endl;
  for (int depth=0; depth<_depth_to_state_to_layer.size(); depth++) {
    if (_depth_to_state_to_layer[depth].size()) {
      LOG << "  " << depth << " : (state, layer) ";
      for (const pair<int, int> state_layer :_depth_to_state_to_layer[depth]) {
        const int state = state_layer.first;
        const int layer = state_layer.second;
        cout << "(" << state << "," << layer << "), ";
      }
      cout << endl;
    }
  }
}

void Depth_First_Queue::register_goal_reaching_state(const int state) {
  _goal_reaching.insert(state);

  // remove if contained here
  const int depth = get_depth(state);

  if (depth == UNKNOWN_DEPTH) return;

  if (_depth_to_state_to_layer[depth].find(state) != _depth_to_state_to_layer[depth].end()) {
    // contained, remove it
    _depth_to_state_to_layer[depth].erase(state);
    _size--;
  }
}

int Depth_First_Queue::get_depth(int state) {
  if (_state_to_depth.size() <= state) return UNKNOWN_DEPTH;
  return _state_to_depth[state];
}

void Depth_First_Queue::set_depth(int state, int depth) {
  while (_state_to_depth.size() <= state) {
    _state_to_depth.push_back(UNKNOWN_DEPTH);
  }
  _state_to_depth[state] = depth;
}

void Depth_First_Queue::trim_to_reachable_helper(unordered_set<int>* reachable_states, int state) {
  exit(1);
  return;
  /*
  //LOG << "exploring state: " << state << endl;
  //LOG << reachable_states->size() << endl;
  if (_trim_to_reachable_memo.find(state) != _trim_to_reachable_memo.end()) {
    return; // already processed
  }
  _trim_to_reachable_memo.insert(state);

  // go through all of its actions, working out which ones have all the outcomes active
  const unordered_set<int>& actions = _global_reachability_graph->_state_to_actions[state];

  for (int action : actions) {
    pair<int, int> state_action = pair<int, int>(state, action);

    // if all these outcomes are in, then add them all to the reached list and recurse
    const unordered_set<int>& outcomes = _global_reachability_graph->_state_action_pair_to_outcomes[state_action];
    bool all_active = true;
    for (int outcome : outcomes) {
      bool outcome_in = get_depth(outcome) != UNKNOWN_DEPTH;
      if (!outcome_in) {
        all_active = false;
        break;
      }
    }

    if (all_active) {
      for (int outcome : outcomes) {
        //LOG << reachable_states->size() << endl;
        reachable_states->insert(outcome);
        trim_to_reachable_helper(reachable_states, outcome);
      }
    }
  }
  */
}

void Depth_First_Queue::trim_to_reachable() {
  //LOG << "slow trimming, only call when all the states are in" << endl;
  _trim_to_reachable_memo = unordered_set<int>();

  unordered_set<int> reachable;
  reachable.insert(Compressed_State::initial_state_id());
  trim_to_reachable_helper(&reachable, Compressed_State::initial_state_id());

  // now to trim the queue to the states that are reachable

  for (int depth=0; depth<_depth_to_state_to_layer.size(); depth++) {
    unordered_map<int, int> replacement;
    for (pair<int, int> state_layer : _depth_to_state_to_layer[depth]) {
      const int state = state_layer.first;
      if (reachable.find(state) != reachable.end()) {
        replacement.insert(state_layer);
      }
    }
    //LOG << "trimmed depth " << depth << " from " << _depth_to_state_to_layer[depth].size() << " to " << replacement.size() << endl;

    _size += (replacement.size() - _depth_to_state_to_layer[depth].size());
    _depth_to_state_to_layer[depth] = replacement;
  }
}

void Depth_First_Queue::inform_of_global_reachability_graph(State_Action_Graph* global_reachability_graph) {
  _global_reachability_graph = global_reachability_graph;
}
