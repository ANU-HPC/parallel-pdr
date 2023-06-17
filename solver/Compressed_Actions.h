#ifndef COMPRESSED_ACTIONS_H
#define COMPRESSED_ACTIONS_H

#include <vector>

#include "Utils.h"
#include "Global.h"

using namespace std;

// TODO maybe just use a vector implace of this?

class Compressed_Actions {
  public:
    Compressed_Actions();
    Compressed_Actions(const vector<int>& actions, int subproblem);
    Compressed_Actions(int* data, int start, int stop);
    string to_string() const;
    vector<int> get_actions() const;
    void get_as_MPI_message(int* data, int start) const;
    int MPI_message_size() const;
  protected:
    vector<int> _raw = vector<int>();
    int _subproblem; // for compression
};

#endif
