#ifndef OBLIGATION_H
#define OBLIGATION_H

class Reason; // for circular header dependencies, header at the end

#include "Compressed_State.h"
#include "Log.h"

#include <string>
#include <iostream>

using namespace std;

class Obligation {
  public:
    //Obligation(const vector<int>& state, const int layer, const int subproblem);
    Obligation();
    Obligation(const Compressed_State& compressed_state, int layer, int subproblem, bool reduce_reason_add_successor_to_queue);
    Obligation(int* data, int start, int stop);
    string to_string() const;

    bool operator==(const Obligation& other) const;
    size_t hash() const;

    bool trimmed_by_reason(const Reason& reason);

    int layer() const;
    int subproblem() const;
    Compressed_State compressed_state() const;
    bool reduce_reason_add_successor_to_queue() const;
    
    Obligation get_with_incremented_layer(int amount) const;

    void get_as_MPI_message(int* data, int start) const;
    int* get_as_MPI_message() const;
    int MPI_message_size() const;
    int MPI_message_tag() const;

    const static Obligation BLANK_OBLIGATION;
  private:
    Compressed_State _compressed_state;
    int _layer;
    int _subproblem;
    bool _reduce_reason_add_successor_to_queue;
};

struct Obligation_Hash {
  std::size_t operator () (Obligation const &obligation) const
  {
    return obligation.hash();
  }
};

#include "Reason.h"

#endif
