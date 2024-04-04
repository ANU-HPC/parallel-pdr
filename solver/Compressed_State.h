#ifndef COMPRESSED_STATE_H
#define COMPRESSED_STATE_H

#define DEFAULT_ID -1

class Contextless_Reason;

#include <vector>

#include "Utils.h"
#include "Global.h"
#include "Log.h"

using namespace std;

struct Compressed_State_Hash;

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

    void assign_id(Compressed_State* state);
    int id() const;

    static Compressed_State state_id_to_state(int state_id);

    static void set_initial_state(const Compressed_State& state);
    static int initial_state_id();
  protected:
    vector<int> _raw = vector<int>();
    bool _guaranteed_full; // this being FALSE means all the literals will be stored and without compression
    int _subproblem; // for compression
    int _id = DEFAULT_ID;

    static int _initial_state_id;

    static int state_to_state_id(const Compressed_State& state);

    // converting to/from id
    static unordered_map<int, Compressed_State> _state_id_to_state_map;
    static unordered_map<Compressed_State, int, Compressed_State_Hash> _state_to_state_id_map;
};

struct Compressed_State_Hash {
  std::size_t operator () (Compressed_State const &compressed_state) const
  {
    return compressed_state.hash();
  }
};

#endif
