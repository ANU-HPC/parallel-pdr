#ifndef SUCCESS_H
#define SUCCESS_H

#include "Obligation.h"
#include "Compressed_Actions.h"
#include "MPI_Interface.h"

using namespace std;

class Success {
  public:
    Success();
    Success(Obligation original_obligation, vector<Compressed_Actions> actions, vector<Obligation> successor_obligations);
    Success(int* data, int start, int stop); // MPI
    string to_short_string() const;
    string to_string() const;
    Obligation original_obligation() const;
    vector<Compressed_Actions> actions() const;
    vector<Obligation> successor_obligations() const;

    bool operator==(const Success& other) const;
    size_t hash() const;

    int* get_as_MPI_message() const;
    int MPI_message_size() const;
    int MPI_message_tag() const;
  private:
    Obligation _original_obligation;
    vector<Compressed_Actions> _actions;
    vector<Obligation> _successor_obligations;
};

struct Bad_Success_Hash {
  std::size_t operator () (Success const &success) const
  {
    return success.hash();
  }
};

#endif
