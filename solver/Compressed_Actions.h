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

    // special function to handle a vector of compressed_actions, this should be done better with polymorphism, then having a function on vector<MPI_SENDABLE>
    static vector<Compressed_Actions> vector_compressed_actions(int* data, int start, int stop);
    static void vector_get_as_MPI_message(vector<Compressed_Actions> compressed_actions, int* data, int start);
    static int vector_MPI_message_size(vector<Compressed_Actions> compressed_actions);
  protected:
    vector<int> _raw = vector<int>();
    int _subproblem; // for compression
};

#endif
