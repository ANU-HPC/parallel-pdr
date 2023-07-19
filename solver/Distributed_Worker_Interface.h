#ifndef DISTRIBUTED_WORKER_INTERFACE_H
#define DISTRIBUTED_WORKER_INTERFACE_H

#include <vector>
#include <tuple>

#include "MPI_Interface.h"
#include "Global.h"
#include "Obligation.h"
#include "Reason.h"
#include "Success.h"
#include "Utils.h"
#include "Log.h"

using namespace std;

class Distributed_Worker_Interface {
  public:
    set<int> workers_wanting_work_snapshot();
    bool all_workers_idle();
    void handle_obligation(const Obligation& obl, int worker);
    void handle_reason(const Reason& reason, int worker);
    void process_inbox();
    vector<tuple<int,Reason>>* get_returned_reasons_buffer();
    vector<tuple<int,Success>>* get_returned_successes_buffer();
    void finalize();
  private:
    set<int> _workers_wanting_work;
    set<int> _workers_setup;
    vector<tuple<int, Reason>>* _returned_reasons_buffer = new vector<tuple<int,Reason>>();
    vector<tuple<int, Success>>* _returned_successes_buffer = new vector<tuple<int,Success>>();
};
#endif
