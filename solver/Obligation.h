#ifndef OBLIGATION_H
#define OBLIGATION_H

#include "Compressed_State.h"

using namespace std;

class Obligation {
  public:
    //Obligation(const vector<int>& state, const int layer, const int subproblem);
    Obligation();
    Obligation(const Compressed_State& compressed_state, int layer, int subproblem);
    Obligation(int* data, int start, int stop);
    string to_string();
    int layer();
    int subproblem();
    Compressed_State compressed_state();
    void get_as_MPI_message(int* data, int start);
    int MPI_message_size();
    int MPI_message_tag();
  private:
    Compressed_State _compressed_state;
    int _layer;
    int _subproblem;
};

#endif
