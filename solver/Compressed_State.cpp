#include "Compressed_State.h"

Compressed_State::Compressed_State() { }

// TODO make this nicer?
Compressed_State::Compressed_State(const vector<int>& state, int subproblem, bool guaranteed_full) {
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

  cout << "finished cs constructor, raw size: " << std::to_string(_raw.size());
}

Compressed_State::Compressed_State(int* data, int start, int stop) {
  _subproblem = data[start];
  _guaranteed_full = data[start+1]==1 ? true : false;
  
  for (int i=start+2; i<stop; i++) {
    _raw.push_back(data[i]);
  }
}

bool Compressed_State::trimmed_by_reason(const Reason& reason) {
  if (!_guaranteed_full) {
    LOG << "ERROR trying to trim on partial state, not set up for this" << endl;
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
  return Utils::to_string(_raw);
}
