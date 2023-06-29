#ifndef SUCCESS_H
#define SUCCESS_H

#include "Obligation.h"
#include "Compressed_Actions.h"
#include "MPI_Interface.h"

using namespace std;

class Success {
  public:
    Success();
    Success(Obligation original_obligation, Compressed_Actions actions, Obligation successor_obligation);
    Success(int* data, int start, int stop); // MPI
    string to_string() const;
    Obligation original_obligation() const;
    Compressed_Actions actions() const;
    Obligation successor_obligation() const;
    int* get_as_MPI_message() const;
    int MPI_message_size() const;
    int MPI_message_tag() const;
  private:
    Obligation _original_obligation;
    Compressed_Actions _actions;
    Obligation _successor_obligation;
};

#endif
