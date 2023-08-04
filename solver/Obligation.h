#ifndef OBLIGATION_H
#define OBLIGATION_H

class Contextless_Reason; // for circular header dependencies, header at the end

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

    bool trimmed_by_reason(const Contextless_Reason& reason);

    int layer() const;
    int subproblem() const;
    Compressed_State compressed_state() const;
    bool reduce_reason_add_successor_to_queue() const;
    
    Obligation get_with_incremented_layer(int amount) const;

    void get_as_MPI_message(int* data, int start) const;
    int* get_as_MPI_message() const;
    int MPI_message_size() const;
    int MPI_message_tag() const;

    // special function to handle a vector of obligations, this should be done better with polymorphism, then having a function on vector<MPI_SENDABLE>
    static vector<Obligation> vector_obligation(int* data, int start, int stop);
    static void vector_get_as_MPI_message(vector<Obligation> obligations, int* data, int start);
    static int vector_MPI_message_size(vector<Obligation> obligations);

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

#include "Contextless_Reason.h"

#endif
