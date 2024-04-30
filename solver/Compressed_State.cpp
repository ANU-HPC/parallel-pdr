#include "Compressed_State.h"
#include "Contextless_Reason.h" // to manage a circular dependency

Compressed_State::Compressed_State() {
  _id = -2;
}

// TODO make this nicer?
Compressed_State::Compressed_State(const vector<int>& state, int subproblem, bool guaranteed_full) {
  assert(Utils::is_abs_sorted(state));

  _subproblem = subproblem;
  _guaranteed_full = guaranteed_full;

  // Want to be able to have a full state by only passing the true ones.
  //assert(!_guaranteed_full || state.size() == Global::problem.subproblem_to_propositions[_subproblem]);

  if (_guaranteed_full) {
    // so only need to store the positive ones
    for (auto it=state.begin(); it!=state.end(); it++) {
      if ((*it)>0) _raw.push_back(*it);
    }
  } else {
    _raw = state;
  }

  assign_id(this);
}

Compressed_State::Compressed_State(int* data, int start, int stop) {
  _subproblem = data[start];
  _guaranteed_full = data[start+1]==1 ? true : false;
  
  for (int i=start+2; i<stop; i++) {
    _raw.push_back(data[i]);
  }

  assign_id(this);
}

// not the most elegant - I doubt this will be expensive
void Compressed_State::assign_id(Compressed_State* state) {
  if (!_guaranteed_full) {
    _id = -999;
    return;
  }

  if (_state_to_state_id_map.find(*state) == _state_to_state_id_map.end()) {
    _id = _state_to_state_id_map.size(); // can predict the behaviour
    int new_id = state_to_state_id(*state);
    assert(new_id == _id);
  } else {
    _id = state_to_state_id(*state);
  }
}

bool Compressed_State::operator==(const Compressed_State& other) const {
  if (!_guaranteed_full) {
    LOG << "ERROR not set up to compare partial states" << endl;
    assert(0);
    exit(1);
  }

  return (_subproblem == other._subproblem) & (_raw == other._raw);
}

size_t Compressed_State::hash() const {
  if (!_guaranteed_full) {
    LOG << "ERROR not set up to hash partial states" << endl;
    assert(0);
    exit(1);
  }

  return Utils::hash(_raw) ^ _subproblem;
}

int Compressed_State::id() const {
  assert(_id != DEFAULT_ID);
  return _id;
}

Compressed_State Compressed_State::state_id_to_state(int state_id) {
  assert (_state_id_to_state_map.find(state_id) != _state_id_to_state_map.end());
  return _state_id_to_state_map[state_id];
}

int Compressed_State::state_to_state_id(const Compressed_State& state) {
  auto position = _state_to_state_id_map.find(state);
  if (position == _state_to_state_id_map.end()) {
    int state_id = _state_to_state_id_map.size();
    _state_to_state_id_map[state] = state_id;
    _state_id_to_state_map[state_id] = state;
    //LOG << "just registered a new state id: " << state_id << " " << state.to_string() << endl;
    return state_id;
  } else {
    return position->second;
  }
}

void Compressed_State::set_initial_state(const Compressed_State& state) {
  _initial_state_id = state_to_state_id(state);
}

int Compressed_State::initial_state_id() {
  return _initial_state_id;
}

int Compressed_State::_initial_state_id;
unordered_map<int, Compressed_State> Compressed_State::_state_id_to_state_map;
unordered_map<Compressed_State, int, Compressed_State_Hash> Compressed_State::_state_to_state_id_map;

Compressed_State Compressed_State::apply_effect(const vector<int>& effect) {
  // take a vector of lits
  if (!_guaranteed_full) {
    LOG << "ERROR not set up to apply effect to partial states" << endl;
    assert(0);
    exit(1);
  }

  // TODO not efficient - revise if a problem
  set<int> pos_vars = set<int>(_raw.begin(), _raw.end());

  for (auto it=effect.begin(); it!=effect.end(); it++) {
    const int lit = *it; 
    if (lit>0) pos_vars.insert(lit);
    else pos_vars.erase(-lit); // TODO may throw error
  }

  vector<int> pos_vars_vector = vector<int>(pos_vars.begin(), pos_vars.end());
  return Compressed_State(pos_vars_vector, 0, true);
}

bool Compressed_State::trimmed_by_reason(const Contextless_Reason& reason) {
  if (!_guaranteed_full) {
    LOG << "ERROR trying to trim on partial state, not set up for this" << endl;
    assert(0);
    exit(1);
  }

  const vector<int>& reason_state = reason.reason();

  auto compressed_state_current = _raw.begin();
  const auto compressed_state_end = _raw.end();
  auto reason_current = reason_state.begin();
  const auto reason_end = reason_state.end();

  while (true) {
    if (compressed_state_current == compressed_state_end) {
      // ran out of compressed
      // matches iff the rest of the reason is negative
      while (reason_current != reason_end) {
        if (*reason_current>0) return false;
        else reason_current++;
      }
      return true;
    } else if (reason_current == reason_end) {
      return true; // gotten to the end of the reason, doesn't matter what the state is, it matches
    } else if (*reason_current == *compressed_state_current) {
      // match, keep up the assumption that they match
      reason_current++;
      compressed_state_current++;
    } else if (*reason_current == -(*compressed_state_current)) {
      // opposite!
      return false;
    } else if (abs(*reason_current) > abs(*compressed_state_current)) { 
      // At this point, they are unequal
      // Reason is mentioning a variable that is later, so just let the compressed state catch up
      compressed_state_current++;
    } else {
      assert(abs(*reason_current) < abs(*compressed_state_current));
      // reason has mentioned a variable that compressed has skipped past
      // So if the reason lit is negative, that is all fine, but if it is positive, then there is a mismatch
      if (*reason_current>0) return false;
      else reason_current++;
    }
  }
}

bool Compressed_State::is_goal() const {
  if (!_guaranteed_full) {
    LOG << "ERROR not set up to handle partial states" << endl;
    assert(0);
    exit(1);
  }

  // need to check if inconsistent with the goal condition
  // inconsistent when positive (mentioned) in the state, and negative in the goal condition
  // OR
  // mentioned in the goal condition, and missed in the state (for efficiency, see how many positive lits are in the goal condition, and make sure they are all checked off as being in the state)

  int unaccounted_for_goal_positive_lits = Global::problem.goal_condition_num_pos_lits;
  for (int pos_in_state : _raw) {
    assert(pos_in_state>0);
    if (Utils::in(Global::problem.goal_condition_set, pos_in_state)) {
      unaccounted_for_goal_positive_lits--;
    } else if (Utils::in(Global::problem.goal_condition_set, -pos_in_state)) {
      //LOG << "returning false as " << -pos_in_state << " is in " << Utils::to_string(Global::problem.goal_condition_set) << endl;
      return false;
    }
    // if neither, then it is not mentioned, so no issues
  }
  // if there are positive goal lits not seen in the state, then they are implicitly false in the state => problem
  // otherwise the state is consistent
  //LOG << "unaccounted_for_goal_positive_lits: " << unaccounted_for_goal_positive_lits  << endl;
  return unaccounted_for_goal_positive_lits == 0;
}

vector<int> Compressed_State::get_state() const {
  if (_guaranteed_full) return Utils::inflate_only_true_to_all(_raw, Global::problem.subproblem_to_propositions[_subproblem]);
  else return _raw; // return as is
}

void Compressed_State::get_as_MPI_message(int* data, int start) const {
  data[start] = _subproblem;
  data[start+1] = _guaranteed_full ? 1 : 0;

  for (int i=0; i<_raw.size(); i++) {
    data[start+2+i] = _raw[i];
  }
}

int Compressed_State::MPI_message_size() const {
  return 2 + _raw.size();
}

string Compressed_State::to_string() const {
  //return "{CS, full:" + std::to_string(_guaranteed_full) + 
  return "{CS ID:" + std::to_string(_id) + 
    " " + Utils::to_symbols_string(_raw) + "}";
}
