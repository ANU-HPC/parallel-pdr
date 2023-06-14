#include "MPI_Communicatable.h"

MPI_Communicatable::MPI_Communicatable() { }

MPI_Communicatable::MPI_Communicatable(int* data, int start, int stop) {
  constructor(data, start, stop);
}

int* MPI_Communicatable::get_as_MPI_message() {
  int* data = new int[MPI_message_size()];
  get_as_MPI_message(data, 0);
  return data;
}
