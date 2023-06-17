#ifndef MPI_ORCHESTRATOR_H
#define MPI_ORCHESTRATOR_H

#include <vector>
#include <tuple>

#include "MPI_Interface.h"
#include "Global.h"
#include "Obligation.h"
#include "Reason.h"
#include "Success.h"

using namespace std;

class MPI_Orchestrator {
  public:
    void handle_obligation(const Obligation& obl, int worker);
    void handle_reason(const Reason& reason, int worker);

    void process_inbox();

    vector<tuple<int, Success>>* successes_to_return_buffer();
    vector<tuple<int, Reason>>* reasons_to_return_buffer();

    void finalize(); 
  private:
    vector<tuple<int, Success>>* _successes_to_return_buffer = new vector<tuple<int, Success>>();
    vector<tuple<int, Reason>>* _reasons_to_return_buffer = new vector<tuple<int, Reason>>();

    int* _empty_int_array = new int[0];
};

#endif
