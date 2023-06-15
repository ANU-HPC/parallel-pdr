#ifndef COMPRESSED_STATE_H
#define COMPRESSED_STATE_H

#include <vector>

#include "Utils.h"
#include "Global.h"

using namespace std;

class Compressed_State {
  public:
    Compressed_State();
    Compressed_State(const vector<int>& state, int subproblem);
    Compressed_State(int* data, int start, int stop);
    string to_string() const;
    vector<int> get_state() const;
    void get_as_MPI_message(int* data, int start) const;
    int MPI_message_size() const;
    // something about matches reason?
  protected:
    vector<int> _raw = vector<int>();
    int _subproblem; // for compression
};

#endif
