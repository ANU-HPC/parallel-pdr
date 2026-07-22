#ifndef MPI_WORKER_H
#define MPI_WORKER_H

#include <vector>
#include <tuple>
#include <stdlib.h>
#include <stdio.h>
#include "unistd.h"

#include "MPI_Interface.h"
#include "Global.h"
#include "Stopwatch.h"
#include "Obligation.h"
#include "Obligation_Processor.h"
#include "Reason_From_Orchestrator.h"
#include "Reason_From_Worker.h"
#include "Success.h"
#include "Log.h"

using namespace std;

class MPI_Worker {
  public:
    MPI_Worker();
    void run();
    static void wait_for_then_finalize();
  private:
    void handle_obligation(const Obligation& obl, bool open_children);
    void handle_reason(const Reason_From_Orchestrator& reason);
    Obligation_Processor* _obligation_processor;
};

#endif
