#ifndef WORKER_INTERFACE_H
#define WORKER_INTERFACE_H

#include <vector>
#include <tuple>

#include "MPI_Interface.h"
#include "Global.h"
#include "Obligation.h"
#include "Reason.h"
#include "Success.h"
#include "Distributed_Worker_Interface.h"
#include "Serial_Worker_Interface.h"

using namespace std;

class Worker_Interface {
  public:
    Worker_Interface();
    set<int> workers_wanting_work_snapshot();
    bool all_workers_idle();
    void handle_obligation(const Obligation& obl, int worker);
    void handle_reason(const Reason& reason, int worker);
    void process_inbox();
    vector<tuple<int, Reason>>* get_returned_reasons_buffer();
    vector<tuple<int, Success>>* get_returned_successes_buffer();
    void finalize();
  private:
    Distributed_Worker_Interface* _distributed_worker_interface = NULL;
    Serial_Worker_Interface* _serial_worker_interface = NULL;
};
#endif
