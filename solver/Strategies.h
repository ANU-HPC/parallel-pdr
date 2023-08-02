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

// every strategy has:
// a single worker interface
// reason or reasons
// queue or queues
// plan builder or plan builders??
// it gets messy so just let them each do it themself

class Strategies {
  public:
    static bool run_default();
};

#endif
