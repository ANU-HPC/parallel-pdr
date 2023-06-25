#include "Log.h"

int MPI_RANK() {
  int rank;
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  return rank;
}

string RANK_TEXT() {
  int flag;
    MPI_Initialized(&flag);
    if (flag==1)
      return "RANK(" + to_string(MPI_RANK()) + ") :: ";
    else
      return "";
}
