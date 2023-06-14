#include "Compressed_State.h"

Compressed_State::Compressed_State() { }

vector<int> Compressed_State::get_state() {
  return Utils::inflate_only_true_to_all(_raw, Global::problem.subproblem_to_propositions[_subproblem]);
}

int Compressed_State::MPI_message_tag() {
  return MPI_Interface::MESSAGE_TAG_COMPRESSED_ACTIONS;
}
