#ifndef MPI_WORKER_H
#define MPI_WORKER_H

#include <vector>
#include <tuple>
#include <stdlib.h>
#include <stdio.h>

#include "MPI_Interface.h"
#include "Global.h"
#include "Obligation.h"
#include "Obligation_Processor.h"
#include "Reason.h"

using namespace std;

class MPI_Worker {
  public:
    void run();
  private:
    void handle_obligation(const Obligation& obl);
    void handle_reason(const Reason& reason);
    Obligation_Processor _obligation_processor;
};

#endif
