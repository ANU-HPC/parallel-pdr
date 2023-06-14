#ifndef COMPRESSED_STATE_H
#define COMPRESSED_STATE_H

#include <vector>

#include "Utils.h"
#include "Global.h"
#include "Compressed_State_Or_Actions.h"

using namespace std;

class Compressed_State : public Compressed_State_Or_Actions {
  public:
    Compressed_State();
    Compressed_State(const vector<int>& state, int subproblem);
    Compressed_State(int* data, int start, int stop);
    vector<int> get_state();
    void get_as_MPI_message(int* data, int start);
    int MPI_message_size();
    int MPI_message_tag();
    // something about matches reason?
};

#endif
