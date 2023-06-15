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
    string to_string() const;
    int layer() const;
    int subproblem() const;
    vector<int> reason() const;
    int* get_as_MPI_message() const;
    void get_as_MPI_message(int* data, int start) const;
    int MPI_message_size() const;
    int MPI_message_tag() const;
  private:
    vector<int> _reason;
    int _layer;
    int _subproblem;
};

#endif
