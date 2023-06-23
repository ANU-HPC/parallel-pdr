#include "Obligation.h"

#include <string>
#include <iostream>

/*
Obligation::Obligation(const vector<int>& state, const int layer, const int subproblem) {
  _state = state;
  _layer = layer;
  _subproblem = subproblem;
}
*/

Obligation::Obligation() {
  cout << "Obligation empty constructor" << endl;
}

Obligation::Obligation(const Compressed_State& compressed_state, int layer, int subproblem, bool reduce_reason_add_successor_to_queue) {
  _compressed_state = compressed_state;
  _layer = layer;
  _subproblem = subproblem;
  _reduce_reason_add_successor_to_queue = reduce_reason_add_successor_to_queue;
}

string Obligation::to_string() const {
  return "{ OBL, L:" + std::to_string(_layer) + " S:" + std::to_string(_subproblem) + " REDUCE:" + std::to_string(_reduce_reason_add_successor_to_queue) + " " + _compressed_state.to_string()  + " }";
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