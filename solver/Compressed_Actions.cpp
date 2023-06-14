#include "Compressed_Actions.h"

vector<int> Compressed_Actions::get_actions() {
  return _raw;
}

int Compressed_Actions::MPI_message_tag() {
  return MPI_Interface::MESSAGE_TAG_COMPRESSED_ACTIONS;
}
