#include "Obligation.h"

/*
Obligation::Obligation(const vector<int>& state, const int layer, const int subproblem) {
  _state = state;
  _layer = layer;
  _subproblem = subproblem;
}
*/

Obligation::Obligation(const Compressed_State& compressed_state, const int layer, const int subproblem) {
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
