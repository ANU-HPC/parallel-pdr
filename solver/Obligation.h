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
    Obligation(const Compressed_State& compressed_state, int layer, int subproblem, int or_originating_layer, int or_count, bool reduce_reason_add_successor_to_queue);
    Obligation(int* data, int start, int stop);
    string to_string() const;

    bool operator==(const Obligation& other) const;
    size_t hash() const;

    bool trimmed_by_reason(const Contextless_Reason& reason);

    int layer() const;
    int subproblem() const;
    int or_originating_layer() const;
    int or_count() const;
    Compressed_State compressed_state() const;
    bool reduce_reason_add_successor_to_queue() const;
    vector<int> banned_actions() const;
    
    Obligation get_with_incremented_layer_and_or_count(int layer_amount, int or_count_amount) const;
    Obligation get_with_additional_banned_action(int extra_banned_action) const;

    void get_as_MPI_message(int* data, int start) const;
    int* get_as_MPI_message() const;
    int MPI_message_size() const;
    int MPI_message_tag() const;

    // special function to handle a vector of obligations, this should be done better with polymorphism, then having a function on vector<MPI_SENDABLE>
    static vector<Obligation> vector_obligation(int* data, int start, int stop);
    static void vector_get_as_MPI_message(vector<Obligation> obligations, int* data, int start);
    static int vector_MPI_message_size(vector<Obligation> obligations);
  private:
    Compressed_State _compressed_state;
    int _layer;
    int _subproblem;
    int _or_originating_layer;
    int _or_count;
    bool _reduce_reason_add_successor_to_queue;
    vector<int> _banned_actions;
};

struct Obligation_Hash {
  std::size_t operator () (Obligation const &obligation) const
  {
    return obligation.hash();
  }
};

#include "Contextless_Reason.h"

#endif
