#ifndef COMPRESSED_STATE_OR_ACTIONSH
#define COMPRESSED_STATE_OR_ACTIONSH

#include <vector>

#include "Utils.h"
#include "Global.h"
#include "MPI_Communicatable.h"

using namespace std;

class Compressed_State_Or_Actions : public MPI_Communicatable {
  public:
    Compressed_State_Or_Actions(); // TODO need this?
    Compressed_State_Or_Actions(int* data, int start, int stop);
    Compressed_State_Or_Actions(const vector<int>& state_or_actions, int subproblem);
    void get_as_MPI_message(int* data, int start);
    //int MPI_message_size();
    virtual int MPI_message_tag();
  protected:
    vector<int> _raw = vector<int>();
    int _subproblem; // for compression
};

#endif
