#include "Obligation.h"

Obligation::Obligation() { }

Obligation::Obligation(const Compressed_State& compressed_state, int layer, int subproblem, bool reduce_reason_add_successor_to_queue, const vector<int>& banned_actions) {
  _compressed_state = compressed_state;
  _layer = layer;
  _subproblem = subproblem;
  _reduce_reason_add_successor_to_queue = reduce_reason_add_successor_to_queue;
  _banned_actions = banned_actions;
}

string Obligation::to_short_string() const {
  return "{OBL LAYER:" + std::to_string(_layer) 
    + " STATE: " + std::to_string(_compressed_state.id())  
    + " BANNED: " + Utils::to_string(_banned_actions)
    + " }";
}

string Obligation::to_string() const {
  if (VERBOSE_STATE_STRING) {
    return "{ OBL, L:" + std::to_string(_layer) 
      + " S:" + std::to_string(_subproblem) 
      + " REDUCE:" + std::to_string(_reduce_reason_add_successor_to_queue) 
      + " BANNED_ACTIONS: " + Utils::to_string(_banned_actions)
      + " STATE: " + _compressed_state.to_string()  + " }";
  } else {
    return "{OBL, L:" + std::to_string(_layer) 
      + ", ID:" + std::to_string(_compressed_state.id())
      + " BA:" + Utils::to_string(_banned_actions) + "}";

  }
}

bool Obligation::operator==(const Obligation& other) const {
  return 
    (other.compressed_state() == _compressed_state) & 
    (other.layer() == _layer) & 
    (other.subproblem() == _subproblem) & 
    (other.reduce_reason_add_successor_to_queue() == _reduce_reason_add_successor_to_queue) &
    (other.banned_actions() == _banned_actions);
}

size_t Obligation::hash() const {
  return _compressed_state.hash() ^ (_layer<<4) ^ (_subproblem<<8) ^ _reduce_reason_add_successor_to_queue;
}

bool Obligation::trimmed_by_reason(const Contextless_Reason& reason) {
  return _compressed_state.trimmed_by_reason(reason);
}

int Obligation::layer() const {
  return _layer;
}

int Obligation::subproblem() const {
  return _subproblem;
}

Compressed_State Obligation::compressed_state() const {
  return _compressed_state;
}

vector<int> Obligation::banned_actions() const {
  return _banned_actions;
}

bool Obligation::reduce_reason_add_successor_to_queue() const {
  return _reduce_reason_add_successor_to_queue;
}

Obligation Obligation::get_with_incremented_layer(int layer_amount) const {
  return Obligation(_compressed_state, _layer+layer_amount, _subproblem, _reduce_reason_add_successor_to_queue, _banned_actions);
}

Obligation Obligation::get_with_additional_banned_action(int extra_banned_action) const {
  vector<int> new_banned_actions = _banned_actions;
  new_banned_actions.push_back(extra_banned_action);
  return Obligation(_compressed_state, _layer, _subproblem, _reduce_reason_add_successor_to_queue, new_banned_actions);
}

Obligation Obligation::get_with_banned_actions(const vector<int>& banned_actions) const {
  return Obligation(_compressed_state, _layer, _subproblem, _reduce_reason_add_successor_to_queue, banned_actions);
}

// MPI

void Obligation::get_as_MPI_message(int* data, int start) const {
  data[start+0] = _layer;
  data[start+1] = _subproblem;
  data[start+2] = _reduce_reason_add_successor_to_queue ? 1 : 0;

  const int state_size = _compressed_state.MPI_message_size();
  data[start+3] = state_size;
  _compressed_state.get_as_MPI_message(data, start+4);

  Utils::get_as_MPI_message(data, start+4+state_size, _banned_actions);
}

Obligation::Obligation(int* data, int start, int stop) {

  _layer = data[start+0];
  _subproblem = data[start+1];
  _reduce_reason_add_successor_to_queue = data[start+2]==1 ? true : false;

  const int state_size = data[start+3];
  _compressed_state = Compressed_State(data, start+4, start+4+state_size);

  _banned_actions = Utils::get_from_MPI_message(data, start+4+state_size, stop);
}

int* Obligation::get_as_MPI_message() const {
  int* data = new int[MPI_message_size()];
  get_as_MPI_message(data, 0);
  return data;
}

int Obligation::MPI_message_size() const {
  return 4 + _compressed_state.MPI_message_size() + Utils::MPI_message_size(_banned_actions);
}

int Obligation::MPI_message_tag() const {
  return MPI_Interface::MESSAGE_TAG_OBLIGATION;
}

vector<Obligation> Obligation::vector_obligation(int* data, int start, int stop) {
  vector<Obligation> ret_val;
  const int num_obligations = data[start];
  int read_from = start+1;
  for (int i=0; i<num_obligations; i++) {
    const int mpi_size = data[read_from];
    ret_val.push_back(Obligation(data, read_from+1, read_from+1+mpi_size));
    read_from += 1 + mpi_size;
  }
  return ret_val;
}

void Obligation::vector_get_as_MPI_message(vector<Obligation> obligations, int* data, int start) {
  data[start] = obligations.size();
  int write_from = start+1;
  for (auto it=obligations.begin(); it!=obligations.end(); it++) {
    const int mpi_size = it->MPI_message_size();
    data[write_from] = mpi_size;
    it->get_as_MPI_message(data, write_from+1);
    write_from += 1 + mpi_size;
  }
}

int Obligation::vector_MPI_message_size(vector<Obligation> obligations) {
  int size = 1;
  for (auto it=obligations.begin(); it!=obligations.end(); it++) {
    size += it->MPI_message_size() + 1; 
  }
  return size;
}
