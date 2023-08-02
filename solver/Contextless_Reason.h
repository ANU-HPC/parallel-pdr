#ifndef CONTEXTLESS_REASON_H
#define CONTEXTLESS_REASON_H

#include <string>
#include <iostream>

#include "MPI_Interface.h"
#include "Utils.h"

using namespace std;

class Contextless_Reason {
  public:
    Contextless_Reason();
    Contextless_Reason(const vector<int>& reason, int layer, int subproblem);
    Contextless_Reason(int* data, int start, int stop);
    bool operator==(const Contextless_Reason& other) const;
    size_t hash_just_reason() const;
    bool equal_just_reason(const Contextless_Reason& other_reason) const;
    size_t hash() const;
    string to_string() const;
    vector<int> reason() const;
    int layer() const;
    int subproblem() const;
    vector<int> timestep_zero_nogood_clause() const;

    int* get_as_MPI_message() const;
    void get_as_MPI_message(int* data, int start) const;
    int MPI_message_size() const;
  private:
    vector<int> _reason; // TODO should be a compressed state?
    int _layer;
    int _subproblem;
};

struct Contextless_Reason_Hash {
  std::size_t operator () (Contextless_Reason const &reason) const
  {
    return reason.hash();
  }
};

struct Contextless_Reason_Hash_Just_Reason {
  std::size_t operator () (Contextless_Reason const &reason) const
  {
    return reason.hash_just_reason();
  }
};

struct Contextless_Reason_Equal_Just_Reason {
  std::size_t operator () (Contextless_Reason const &reason_a, Contextless_Reason const &reason_b) const
  {
    return reason_a.equal_just_reason(reason_b);
  }
};

#endif

