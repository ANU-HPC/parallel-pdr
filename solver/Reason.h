#ifndef OBLIGATION_H
#define OBLIGATION_H

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
    string to_string();
    int layer();
    int subproblem();
    vector<int> reason();
    void get_as_MPI_message(int* data, int start);
    int MPI_message_size();
    int MPI_message_tag();
  private:
    vector<int> _reason;
    int _layer;
    int _subproblem;
};

#endif
