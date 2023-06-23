#ifndef OBLIGATION_H
#define OBLIGATION_H

#include "Compressed_State.h"

using namespace std;

class Obligation {
  public:
    //Obligation(const vector<int>& state, const int layer, const int subproblem);
    Obligation();
    Obligation(const Compressed_State& compressed_state, int layer, int subproblem, bool reduce_reason_add_successor_to_queue);
    Obligation(int* data, int start, int stop);
    string to_string() const;
    int layer() const;
    int subproblem() const;
    Compressed_State compressed_state() const;
    bool reduce_reason_add_successor_to_queue() const;
    void get_as_MPI_message(int* data, int start) const;
    int* get_as_MPI_message() const;
    int MPI_message_size() const;
    int MPI_message_tag() const;
  private:
    Compressed_State _compressed_state;
    int _layer;
    int _subproblem;
    bool _reduce_reason_add_successor_to_queue;
};
#endif
