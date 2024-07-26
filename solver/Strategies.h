#ifndef STRATEGIES_H
#define STRATEGIES_H

using namespace std;

#include "Compressed_State.h"
#include "Global.h"
#include "Layers.h"
#include "Obligation.h"
#include "Worker_Interface.h"
#include "Plan_Builder.h"
#include "queue/Default_Queue.h"
#include "queue/Open_States_Tracking_Queue.h"
#include "queue/Heuristics.h"
#include "Contextless_Reason.h"
#include "Reason_From_Orchestrator.h"
#include "Reason_From_Worker.h"


#include "Contextless_Reason.h"
#include "Reason_From_Orchestrator.h"
#include "Success.h"
#include "nondeterminism/State_ID_Manager.h"
#include "nondeterminism/Goal_Reachability_Manager.h"
#include "queue/Wrapper_Queue.h"
#include "queue/Open_States_Tracking_Queue.h"


#include <chrono>

// every strategy has:
// a single worker interface
// reason or reasons
// queue or queues
// plan builder or plan builders??
// it gets messy so just let them each do it themself

class Strategies {
  public:
    bool run_default();
  private:
    // some statistics
    void manage_per_inbox_check_periodic_stats(int reasons_size, int successes_size);
    long long int get_results_iteration = 0;
    long long int successes_count = 1;
    long long int reasons_count = 1;
    long long int reasons_count_iteration_checkpoint = 0;
    long long int successes_count_iteration_checkpoint = 0;
    uint64_t already_displayed_elapsed_time = 0;
    void print_elapsed_time();
    int one_worker_results;
    int more_than_one_worker_results;

    // set up everything we need
    Wrapper_Queue queue;
    Layers layers;
    Worker_Interface worker_interface;
    Goal_Reachability_Manager goal_reachability_manager; // only for nondeterminism
    Plan_Builder deterministic_plan_builder; // only for deterministic

    const int FULL_SCC_REFRESH_RATE = INT_MAX; // effectively turns it off
    bool full_scc_goal_refresh();
    int full_scc_refresh_loop_count = 0;
    vector<Success> successes_since_last_scc_refresh;

};

#endif
