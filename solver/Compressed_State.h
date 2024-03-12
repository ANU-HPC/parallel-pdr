#ifndef COMPRESSED_STATE_H
#define COMPRESSED_STATE_H

class Contextless_Reason;

#include <vector>

#include "Utils.h"
#include "Global.h"
#include "Log.h"

using namespace std;

class Compressed_State {
  public:
    Compressed_State();
    Compressed_State(const vector<int>& state, int subproblem, bool guaranteed_full);
    Compressed_State(int* data, int start, int stop);
    string to_string() const;

    bool operator==(const Compressed_State& other) const;
    size_t hash() const;

    Compressed_State apply_effect(const vector<int>& effect);

    bool trimmed_by_reason(const Contextless_Reason& reason);

    vector<int> get_state() const;

    void get_as_MPI_message(int* data, int start) const;
    int MPI_message_size() const;
    // something about matches reason?
  protected:
    vector<int> _raw = vector<int>();
    bool _guaranteed_full; // this being FALSE means all the literals will be stored and without compression
    int _subproblem; // for compression
};

struct Compressed_State_Hash {
  std::size_t operator () (Compressed_State const &compressed_state) const
  {
    return compressed_state.hash();
  }
};

#endif
