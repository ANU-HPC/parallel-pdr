#include "Obligation.h"

/*
Obligation::Obligation(const vector<int>& state, const int layer, const int subproblem) {
  _state = state;
  _layer = layer;
  _subproblem = subproblem;
}
*/

Obligation::Obligation() { }

Obligation::Obligation(const Compressed_State& compressed_state, int layer, int subproblem, bool reduce_reason_add_successor_to_queue) {
  _compressed_state = compressed_state;
  _layer = layer;
  _subproblem = subproblem;
  _reduce_reason_add_successor_to_queue = reduce_reason_add_successor_to_queue;
}

string Obligation::to_string() const {
  return "{ OBL, L:" + std::to_string(_layer) + " S:" + std::to_string(_subproblem) + " REDUCE:" + std::to_string(_reduce_reason_add_successor_to_queue) + " " + _compressed_state.to_string()  + " }";
}

bool Obligation::operator==(const Obligation& other) const {
  return 
    (other.compressed_state() == _compressed_state) & 
    (other.layer() == _layer) & 
    (other.subproblem() & _subproblem) & 
    (other.reduce_reason_add_successor_to_queue() == _reduce_reason_add_successor_to_queue);
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

bool Obligation::reduce_reason_add_successor_to_queue() const {
  return _reduce_reason_add_successor_to_queue;
}

Obligation Obligation::get_with_incremented_layer(int amount) const {
  return Obligation(_compressed_state, _layer+amount, _subproblem, _reduce_reason_add_successor_to_queue);
}

// MPI
// TYPE, layer, subproblem, positive_props

void Obligation::get_as_MPI_message(int* data, int start) const {
  data[start+0] = _layer;
  data[start+1] = _subproblem;
  data[start+2] = _reduce_reason_add_successor_to_queue ? 1 : 0;

  _compressed_state.get_as_MPI_message(data, start+3);
}

Obligation::Obligation(int* data, int start, int stop) {
  _layer = data[start];
  _subproblem = data[start+1];
  _reduce_reason_add_successor_to_queue = data[start+2]==1 ? true : false;

  _compressed_state = Compressed_State(data, start+3, stop);
}

int* Obligation::get_as_MPI_message() const {
  int* data = new int[MPI_message_size()];
  get_as_MPI_message(data, 0);
  return data;
}

int Obligation::MPI_message_size() const {
  return 3 + _compressed_state.MPI_message_size();
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

const Obligation Obligation::BLANK_OBLIGATION = Obligation(Compressed_State(vector<int>(), 0, false), 0, 0, false);
