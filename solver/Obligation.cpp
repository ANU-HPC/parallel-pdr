#include "Obligation.h"

/*
Obligation::Obligation(const vector<int>& state, const int layer, const int subproblem) {
  _state = state;
  _layer = layer;
  _subproblem = subproblem;
}
*/

Obligation::Obligation(const Compressed_State& compressed_state, int layer, int subproblem) {
  _compressed_state = compressed_state;
  _layer = layer;
  _subproblem = subproblem;
}

int Obligation::layer() {
  return _layer;
}

int Obligation::subproblem() {
  return _subproblem;
}

Compressed_State Obligation::compressed_state() {
  return _compressed_state;
}

// MPI
// TYPE, layer, subproblem, positive_props

void Obligation::get_as_MPI_message(int* data, int start) {
  data[start+0] = _layer;
  data[start+1] = _subproblem;

  _compressed_state.get_as_MPI_message(data, 2);
}

Obligation::Obligation(int* data, int start, int stop) {
  _layer = data[0];
  _subproblem = data[1];
  _compressed_state = Compressed_State(data, start+2, stop);
}

int Obligation::MPI_message_tag() {
  return MPI_Interface::MESSAGE_TAG_OBLIGATION;
}


