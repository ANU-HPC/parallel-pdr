#ifndef REASON_H
#define REASON_H

#include <string>
#include <iostream>

#include "MPI_Interface.h"
#include "Utils.h"

using namespace std;

class Reason {
  public:
    //Obligation(const vector<int>& state, const int layer, const int subproblem);
    Reason();
    Reason(const vector<int>& reason, int layer, int subproblem);
    Reason(int* data, int start, int stop);
    bool operator==(const Reason& other) const;
    size_t hash() const;
    size_t hash_contextless() const;
    bool equal_contextless(const Reason& other_reason) const;
    string to_string() const;
    int layer() const;
    int subproblem() const;
    vector<int> reason() const;
    vector<int> nogood_clause() const;
    int* get_as_MPI_message() const;
    void get_as_MPI_message(int* data, int start) const;
    int MPI_message_size() const;
    int MPI_message_tag() const;
  private:
    vector<int> _reason;
    int _layer;
    int _subproblem;
};

struct Reason_Hash {
  std::size_t operator () (Reason const &reason) const
  {
    return reason.hash();
  }
};

struct Reason_Hash_Contextless {
  std::size_t operator () (Reason const &reason) const
  {
    return reason.hash_contextless();
  }
};

struct Reason_Equal_Contextless {
  std::size_t operator () (Reason const &reason_a, Reason const &reason_b) const
  {
    return reason_a.equal_contextless(reason_b);
  }
};

#endif
