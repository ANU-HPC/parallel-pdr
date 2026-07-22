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
#include "queue/Heuristics.h"
#include "Contextless_Reason.h"
#include "Reason_From_Orchestrator.h"
#include "Reason_From_Worker.h"

#include <chrono>

// every strategy has:
// a single worker interface
// reason or reasons
// queue or queues
// plan builder or plan builders??
// it gets messy so just let them each do it themself

class Strategies {
  public:
    static bool run_default();
  private:
    static void manage_per_inbox_check_periodic_stats(int reasons_size, int successes_size);

    static long long int get_results_iteration;
    static long long int successes_count;
    static long long int reasons_count;
    static long long int reasons_count_iteration_checkpoint;
    static long long int successes_count_iteration_checkpoint;

    static int one_worker_results;
    static int more_than_one_worker_results;
};

#endif
