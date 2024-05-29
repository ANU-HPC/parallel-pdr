#include "Open_States_Tracking_Queue.h"
#include <cassert>

void Open_States_Tracking_Queue::push_initial(const Obligation& obligation) {
  _standard_queue.push(obligation);
}

void Open_States_Tracking_Queue::register_success(const Success& success) {
  assert(consistent());
  const int original_state = success.original_obligation().compressed_state().id();

  // work out if a "real" success, or an indication that a obligation failed because of blocked actions
  const bool real_success = success.successor_obligations().size();
  if (real_success) {
    // deal with the starting state, first remove the wild (which might have been turned into a goal reaching) state from those lists
    const bool is_wild = _wild_state_to_layer.find(original_state) != _wild_state_to_layer.end();
    if (is_wild) { 
      const int layer_for_checking = success.original_obligation().layer();
      assert(_wild_state_to_layer[original_state] == success.original_obligation().layer());

      _wild_state_to_layer.erase(original_state);
      _standard_queue.push(success.original_obligation());
      
      assert(layer_for_checking == _standard_queue.state_id_to_layer(original_state));
    } else {
      // just a check
      const bool is_seen_goal_reaching = _seen_goal_reaching_state_to_layer.find(original_state) != _seen_goal_reaching_state_to_layer.end();
      assert (is_seen_goal_reaching);
      assert (_seen_goal_reaching_state_to_layer[original_state] == success.original_obligation().layer());
    }

    // outcomes
    for (const Obligation& successor_obligation : success.successor_obligations()) {
      const int outcome = successor_obligation.compressed_state().id();
      const int status = state_to_status(outcome);
      if (status == UNSEEN_NON_GOAL_REACHING) {
        _standard_queue.push(successor_obligation);
      } else if (status == UNSEEN_GOAL_REACHING) {
        _unseen_goal_reaching_states.erase(outcome);
        _seen_goal_reaching_state_to_layer[outcome] = successor_obligation.layer();
      } // otherwise it is already taken care of (if in a queue, keep it there, if a goal or banned, leave it
    }

    // tracking blocked actions
    assert(success.actions().size() == 1);
    assert(success.actions()[0].get_actions().size() == 1);
    const int action = success.actions()[0].get_actions()[0];
    const pair<int, int> original_state_action_pair = pair<int, int>(original_state, action);
    _state_to_blocked_actions[original_state].insert(action);

    assert(_state_to_blocked_actions[original_state].size());

    for (const Obligation& successor_obligation : success.successor_obligations()) {
      const int outcome = successor_obligation.compressed_state().id();
      _outcome_to_state_actions_it_is_blocking[outcome].insert(original_state_action_pair);
    }

    // should be a new arc in the system
    _graph.add(success);

    // it might already be unblocked, check that
    check_if_state_action_should_be_unblocked(original_state_action_pair);
  } else { // this "success" is saying that an obligation couldn't progress BECAUSE of banned actions

    // deal with the starting state, first remove the wild (which might have been turned into a goal reaching) state from those lists
    const bool is_wild = _wild_state_to_layer.find(original_state) != _wild_state_to_layer.end();
    if (is_wild) { 
      _wild_state_to_layer.erase(original_state);
      // put it on an appropriate queue
      if (_state_to_blocked_actions[original_state].size() == 0) {
        // might have been unblocked by the time we get here
        _standard_queue.push(success.original_obligation());
      } else {
        // actually blocked
        _deadlock_queue.push(success.original_obligation());
      }
    } else {
      // just a check
      const bool is_seen_goal_reaching = _seen_goal_reaching_state_to_layer.find(original_state) != _seen_goal_reaching_state_to_layer.end();
      assert (is_seen_goal_reaching);
      assert (_seen_goal_reaching_state_to_layer[original_state] == success.original_obligation().layer());
    }
  }



  // just for debugging
  if (_seen_successes.find(success) != _seen_successes.end()) {
    LOG << "SEEN THE SUCCESS BEFORE: " << success.to_string() << endl;
    assert(false);
  }
  _seen_successes.insert(success);
  assert(consistent());
}

void Open_States_Tracking_Queue::register_reason(const Reason_From_Worker& reason) {
  assert(consistent());
  const int original_state = reason.originating_obligation().compressed_state().id();
  const int original_state_layer = reason.originating_obligation().layer();

  // deal with the starting state, first remove the wild (which might have been turned into a goal reaching) state from those lists
  const bool is_wild = _wild_state_to_layer.find(original_state) != _wild_state_to_layer.end();
  if (is_wild) { 
    // remove from wild
    _wild_state_to_layer.erase(original_state);
    
    // put wherever it should go
    if (original_state_layer == _k) _banned_states.insert(original_state);
    else  {
      // obligation rescheduling, see if unblocks
      assert(Global::problem.obligation_rescheduling);
      _standard_queue.push(reason.originating_obligation().get_with_incremented_layer(1));
    }

    // see if that unblocks other things
    check_if_outcome_layer_change_triggers_unblocking_of_proceeding_state_actions(original_state);
  } else {
    // just a check
    const bool is_seen_goal_reaching = _seen_goal_reaching_state_to_layer.find(original_state) != _seen_goal_reaching_state_to_layer.end();
    assert (is_seen_goal_reaching);
    assert (_seen_goal_reaching_state_to_layer[original_state] == original_state_layer);
  }

  // apply reason, pushing states in standard queue
  const unordered_set<int> standard_pushed_states = _standard_queue.trim(reason.contextless_reason(), _k);
  if (original_state_layer == _k) _banned_states.insert(standard_pushed_states.begin(), standard_pushed_states.end());
  for (int state : standard_pushed_states) {
    // TODO need this?
    check_if_outcome_layer_change_triggers_unblocking_of_proceeding_state_actions(state);
  }

  // apply reason, pushing states in deadlocked queue
  const unordered_set<int> deadlocked_pushed_states = _standard_queue.trim(reason.contextless_reason(), _k);
  if (original_state_layer == _k) _banned_states.insert(deadlocked_pushed_states.begin(), deadlocked_pushed_states.end());
  for (int state : deadlocked_pushed_states) {
    // this will never make the state be unblocked, it goes up, which only makes things easier
    check_if_outcome_layer_change_triggers_unblocking_of_proceeding_state_actions(state);
    LOG << "not sure if this would happen..." << endl;
  }
  assert(consistent());
}

void Open_States_Tracking_Queue::register_goal_reaching_state(const int state) {
  assert(consistent());
  const int status = state_to_status(state);
  assert (status != SEEN_GOAL_REACHING);
  assert (status != UNSEEN_GOAL_REACHING);
  if (status == UNSEEN_NON_GOAL_REACHING)  _unseen_goal_reaching_states.insert(state); // keep a note of it for if it turns up later
  else {
    const int layer = seen_state_to_layer(state);
    if (status == DEADLOCK) _deadlock_queue.remove(Compressed_State::state_id_to_state(state));
    else if (status == STANDARD) _standard_queue.remove(Compressed_State::state_id_to_state(state));
    else if (status == BANNED) _banned_states.erase(state);
    else if (status == WILD) _wild_state_to_layer.erase(state);
    _seen_goal_reaching_state_to_layer[state] = layer;
  }
  assert(consistent());
}

bool Open_States_Tracking_Queue::available_work() {
  return !_standard_queue.empty();
}

bool Open_States_Tracking_Queue::fully_empty() {
  return _standard_queue.empty() && _deadlock_queue.empty();
  //if (!_standard_queue.empty()) return false;

  // if the standard queue is empty, make sure the deadlock one is too
  //assert (_deadlock_queue.empty());
  //return true;
}

int Open_States_Tracking_Queue::lowest_layer_with_content() {
  return _standard_queue.lowest_layer_with_content();
}

Obligation Open_States_Tracking_Queue::pop(const int heuristic) {
  assert(consistent());
  assert (!_standard_queue.empty());
  const Obligation& obligation = _standard_queue.pop(heuristic);
  _wild_state_to_layer[obligation.compressed_state().id()] = obligation.layer();
  //Utils::print(_state_to_blocked_actions);
  const unordered_set<int>& banned_actions = _state_to_blocked_actions[obligation.compressed_state().id()];
  //LOG << "getting state " << obligation.compressed_state().id() << " " << " with banned actions: " << Utils::to_string(banned_actions) << endl;
  assert(consistent());
  return obligation.get_with_banned_actions(vector<int>(banned_actions.begin(), banned_actions.end()));
}

void Open_States_Tracking_Queue::new_k(const int k) {
  assert(consistent());
  LOG << "NEW K !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" << endl;
  _k = k;
  _banned_states.clear();
  assert (_deadlock_queue.empty());
  assert (_standard_queue.empty());
  assert(_wild_state_to_layer.empty());

  _outcome_to_state_actions_it_is_blocking.clear();
  _state_to_blocked_actions.clear();

  // TODO self check could make it so these are already empty
  assert(_outcome_to_state_actions_it_is_blocking.empty());
  assert(_state_to_blocked_actions.empty());

  _graph.clear();
  assert(consistent());
}

int Open_States_Tracking_Queue::state_to_status(const int state) {
  if (_standard_queue.contains_state_id(state)) return STANDARD;
  if (_deadlock_queue.contains_state_id(state)) return DEADLOCK;
  if (_wild_state_to_layer.find(state) != _wild_state_to_layer.end()) return WILD;
  if (_seen_goal_reaching_state_to_layer.find(state) != _seen_goal_reaching_state_to_layer.end()) return SEEN_GOAL_REACHING;
  if (_banned_states.find(state) != _banned_states.end()) return BANNED;
  if (_unseen_goal_reaching_states.find(state) != _unseen_goal_reaching_states.end()) return UNSEEN_GOAL_REACHING;
  return UNSEEN_NON_GOAL_REACHING;
}

int Open_States_Tracking_Queue::seen_state_to_layer(const int state) {
  // we don't know which queue the state is in (if any)
  if (_standard_queue.contains_state_id(state)) return _standard_queue.state_id_to_layer(state);
  if (_deadlock_queue.contains_state_id(state)) return _deadlock_queue.state_id_to_layer(state);
  if (_wild_state_to_layer.find(state) != _wild_state_to_layer.end()) return _wild_state_to_layer[state];
  if (_seen_goal_reaching_state_to_layer.find(state) != _seen_goal_reaching_state_to_layer.end()) return _seen_goal_reaching_state_to_layer[state];
  if (_banned_states.find(state) != _banned_states.end()) return _k+1;

  LOG << "ERROR trying to retrieve the layer of an untracked state" << endl;
  assert(false);
  return -999;
}

string Open_States_Tracking_Queue::status_to_string(const int status) {
  if (status == -111) return "STANDARD";
  if (status == -222) return "DEADLOCK";
  if (status == -333) return "WILD";
  if (status == -444) return "BANNED";
  if (status == -555) return "SEEN_GOAL_REACHING";
  if (status == -666) return "UNSEEN_GOAL_REACHING";
  if (status == -777) return "UNSEEN_NON_GOAL_REACHING";
  assert(false);
  return "AAAAAAAAAAAAAAAAAAAAAAAAH!";
}

void Open_States_Tracking_Queue::check_if_outcome_layer_change_triggers_unblocking_of_proceeding_state_actions(const int state) {
  assert(consistent());
  //assert(_outcome_to_state_actions_it_is_blocking.find(state) != _outcome_to_state_actions_it_is_blocking.end());


  const unordered_set<pair<int, int>, Int_Pair_Hash> state_actions_to_check = _outcome_to_state_actions_it_is_blocking[state];


  for (auto state_action : state_actions_to_check) {
    check_if_state_action_should_be_unblocked(state_action);
  }
  assert(consistent());
}

void Open_States_Tracking_Queue::check_if_state_action_should_be_unblocked(const pair<int, int> state_action) {
  assert(consistent());
  const int state = get<0>(state_action);
  const int action = state_action.second;
  const int original_state_layer = seen_state_to_layer(state);



  //LOG << "checking if unblocking: " << action << endl;
  //LOG << "original state layer " << original_state_layer << endl;
  //LOG << "original status " << status_to_string(state_to_status(state)) << endl;

  // work out if still blocking action
  bool one_goes_forward = false;
  bool all_not_banned = true;
  for (const int outcome : _graph._state_action_pair_to_outcomes[state_action]) {
    const int outcome_layer = seen_state_to_layer(outcome);
    //LOG << "outcome " << outcome << " has layer " << outcome_layer << " and status " << status_to_string(state_to_status(outcome)) << endl;
    all_not_banned = all_not_banned && (outcome_layer <= _k);
    one_goes_forward = one_goes_forward || (outcome_layer < original_state_layer);
  }

  //LOG << "all_not_banned " << all_not_banned << endl;
  //LOG << "one_goes_forward " << one_goes_forward << endl;

  const int keep_blocking = all_not_banned && one_goes_forward;
  if (!keep_blocking) {
    // remove from maps
    //LOG << "unblocking state: " << state << " action " << action << endl;
    _state_to_blocked_actions[state].erase(action);
    for (const int outcome : _graph._state_action_pair_to_outcomes[state_action]) {

      assert(_outcome_to_state_actions_it_is_blocking[outcome].find(state_action) != _outcome_to_state_actions_it_is_blocking[outcome].end());

      _outcome_to_state_actions_it_is_blocking[outcome].erase(state_action);
    }

    // removed this blocking action, if the state itself was actually deadlocked in the first place (not guaranteed) and this released the last banned action, then move it from the deadlock to standard queue
    LOG << "TODO what is goal reaching? or banned etc?" << endl;
    if (_state_to_blocked_actions[state].size() == 0 && state_to_status(state) == DEADLOCK) {
      // move between queues
      Compressed_State state_object = Compressed_State::state_id_to_state(state);
      Obligation obligation = Obligation(state_object, original_state_layer, 0, true, vector<int>());
      const bool removed = _deadlock_queue.remove(state_object);
      assert(removed);
      _standard_queue.push(obligation);
    }
  }
  assert(consistent());
}

bool Open_States_Tracking_Queue::consistent() {
  //print();
  if (!_deadlock_queue.empty()) {
    const int live_states = _wild_state_to_layer.size() + _standard_queue.size();
    if (live_states == 0) return false;
  }

  return true;
}


void Open_States_Tracking_Queue::print() {
  LOG << "STANDARD" << endl;
  _standard_queue.print_sizes();

  LOG << "DEADLOCK" << endl;
  _deadlock_queue.print_sizes();

  LOG << "WILD: " << _wild_state_to_layer.size() << endl;
  LOG << "SEEN_GOAL_REACHING: " << _seen_goal_reaching_state_to_layer.size() << endl;
  LOG << "UNSEEN_GOAL_REACHING: " << _seen_goal_reaching_state_to_layer.size() << endl;
  LOG << "BANNED: " << _banned_states.size() << endl;
}










/*

void Open_States_Tracking_Queue::release_deadlocks_from_layer_change(const int state_id, const int new_layer) {
  // the rest of the graph keeps track of the layers, and may be in the middle of updating, so use this given new layer, not the graph's one

  // see what it is locking, and see if any of them get unlocked
  const auto& state_actions = _outcome_to_state_action_it_is_blocking[state_id];
  
  for (auto it=state_actions.begin(); it!=state_actions.end(); it++) {
    const pair<int, int>& state_action = *it;
    const unordered_set<int>& outcomes = _graph._state_action_pair_to_outcomes[state_action];

    const int previous_state = state_actions->first(); 
    const int previous_state_layer = state_id_to_layer(previous_state);

    // go through the outcomes, see if there is a change in the action executability conditions
    bool one_goes_forward = false;
    bool all_outcomes_at_k_or_less = true;
    for (auto it=outcomes.begin(); it!=outcomes.end(); it++) {
      const int outcome = *it;
      const int layer = state_id_to_layer(outcome);

      one_goes_forward = one_goes_forward || (layer < previous_state_layer);
      all_outcomes_at_k_or_less = all_outcomes_at_k_or_less && TODO;
       
    }
  }
}

void Open_States_Tracking_Queue::remove_and_ban_states_as_goal_reaching(const Compressed_State state) {
  // remove it from the graph, maybe triggering the release of a deadlock
  const int state_id = state.id();
  LOG << "TODO what happens here??" << endl;
  release_deadlocks_from_layer_change(state.id(), 0);
  _graph.remove_state(state.id());

  // ban it from all the queues
  _standard_queue.remove_and_ban_states_as_goal_reaching(state);
  _deadlock_queue.remove_and_ban_states_as_goal_reaching(state);
  
  // if this state is out in the wild somewhere, remove it from being tracked
  _wild_state_to_layer.erase(state_id);
}

void Open_States_Tracking_Queue::push(const Obligation& obligation) {
  const int state_id = obligation.compressed_state().id();
  const int new_layer = obligation.layer();

  // if out in the wild, remove it from there
  _wild_state_to_layer.erase(state_id);

  // where should it go? if it is already deadlocked, keep it in the deadlock, otherwise add to the normal queue
  if (_deadlock_queue.contains_state_id(state_id)) {
    // if at a new, higher layer, push the new version
    if (new_layer > _deadlock_queue.state_it_to_layer(state_id)) {
      _deadlock_queue.push(obligation);
      release_deadlocks_from_layer_change(state_id, new_layer);
    }
  } else {
    // if not in the deadlock queue, add to the standard queue
    if (_standard_queue.contains_state_id(state_id) && _standard_queue.state_id_to_layer(state_id) >= new_layer) {
      // then don't bother, it already has it, otherwise: 
    } else {
      _standard_queue.push(obligation);
      release_deadlocks_from_layer_change(state_id, new_layer);
    }
  }
}

*/










/*
void Open_States_Tracking_Queue::push(const Obligation& obligation) {


  // work out what queue it should go in, if it is not in either, put it in the normal one
  // That is all that this needs to do



void Open_States_Tracking_Queue::register_success(const Success& success) {
  // work out where it should go


        if (success.successor_obligations().size() == 0) {
          // UNSAT from open children
          TODO();
          open_children_tracker.add();
          continue;
        }

}

void Open_States_Tracking_Queue::register_reason(const Reason& reason) {

}

pair<bool, Obligation> pop(int heuristic) { // open_children, obligation
  // grab the wanted obligation
  Obligation obligation = _standard_queue.pop(heuristic);

  // work out if has open children
  bool open_children = _graph.open_children(Global::state_id_manager.state_to_id(obligation.compressed_state()));

  return pair<bool, Obligation>(open_children, obligation);
}

bool Open_States_Tracking_Queue::empty() {
  return _standard_queue.empty();
}

int Open_States_Tracking_Queue::size() {
  return _standard_queue.size();
}

void Open_States_Tracking_Queue::trim(const Contextless_Reason& reason, int obligation_rescheduling_upper_layer) {
  // when trimming from the queue, the graph is informed that these states have been removed/rescheduled, and the graph internally handles that
  _standard_queue.trim(reason, obligation_rescheduling_upper_layer, *_graph);
  _deadlock_queue.trim(reason, obligation_rescheduling_upper_layer, *_graph);
}

int Open_States_Tracking_Queue::lowest_layer_with_content() {
  return _standard_queue.lowest_layer_with_content();
}

void Open_States_Tracking_Queue::print_sizes() {
  cout << "===== Standard Queue =====" << endl;
  _standard_queue.print_sizes();
  cout << "===== deadlock Queue =====" << endl;
  _deadlock_queue.print_sizes();
}
*/
