#ifndef SUCCESS_H
#define SUCCESS_H

#include "Obligation.h"
#include "Compressed_Actions.h"
#include "MPI_Interface.h"

using namespace std;

class Success {
  public:
    Success(Obligation original_obligation, Compressed_Actions actions, Obligation successor_obligation);
    Success(int* data, int start, int stop); // MPI
    string to_string();
    Obligation original_obligation();
    Compressed_Actions action();
    Obligation successor_obligation();
    int* get_as_MPI_message();
    int MPI_message_size();
    int MPI_message_tag();
  private:
    Obligation _original_obligation;
    Compressed_Actions _actions;
    Obligation _successor_obligation;
};

#endif
