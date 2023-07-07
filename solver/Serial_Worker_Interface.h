#ifndef SERIAL_WORKER_INTERFACE_H
#define SERIAL_WORKER_INTERFACE_H

#include <vector>
#include <tuple>

#include "MPI_Interface.h"
#include "Global.h"
#include "Obligation.h"
#include "Reason.h"
#include "Success.h"
#include "Obligation_Processor.h"

using namespace std;

class Serial_Worker_Interface {
  public:
    Serial_Worker_Interface();
    set<int> workers_wanting_work_snapshot();
    bool all_workers_idle();
    void handle_obligation(const Obligation& obl);
    void handle_reason(const Reason& reason);
    vector<tuple<int,Reason>>* get_returned_reasons_buffer();
    vector<tuple<int,Success>>* get_returned_successes_buffer();
  private:
    const int _SERIAL_WORKER_ID = 1;
    const set<int> _sole_worker = set<int>({1});
    Obligation_Processor* _obligation_processor;
    vector<tuple<int, Reason>>* _returned_reasons_buffer = new vector<tuple<int, Reason>>();
    vector<tuple<int, Success>>* _returned_successes_buffer = new vector<tuple<int, Success>>();
};
#endif
