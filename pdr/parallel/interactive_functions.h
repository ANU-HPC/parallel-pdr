#ifndef INTERACTIVE_FUNCTIONS_H
#define INTERACTIVE_FUNCTIONS_H

#include <algorithm>
#include <glog/logging.h>
#include <iostream>
#include <cassert>
#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

using namespace std;

#include "arguments.h"
#include "LingelingMaster.h"
#include "LingelingWorker.h"
#include "MPICommsInterface.h"
#include <zlib.h>

#include "mpi_global.h"

extern MPI_Comm mastercommunicator;
extern MPI_Comm subcommunicator_sls;
extern MPI_Comm subcommunicator_strengthener;

extern int world_rank;
extern int world_size;

extern LingelingMaster* master;

extern Arguments command_line_arguments;
extern MPICommsInterface* comms;

extern vector<Message*> extra_clauses;
extern bool workers_in_loop;

void setup_dagster();
set<int> get_free_workers();
tuple<vector<tuple<Message*, int>>, vector<tuple<Message*, int>>> async_solve(const set<int>& workers_to_send_to);
tuple<vector<tuple<Message*, int>>, vector<tuple<Message*, int>>> sync_solve();
void add_clauses_worker(Message* message, int worker);
void initial_message(Message* message);
void initial_message(Message* message, int worker);
void shutdown();
void worker_shutdown();
void master_init();
void global_init(int argc, char **argv, string tmp_dir, const map<int, vector<int>>& subproblem_to_propositions, const map<int, vector<int>>& subproblem_to_assumptions);
#endif
