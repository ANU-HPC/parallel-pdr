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

#include "Cnf.h"
#include "Dag.h"
#include "arguments.h"
#include "gnovelty/gnovelty_main.hh"
#include "LingelingMaster.h"
#include "LingelingWorker.h"
#include "MPICommsInterface.h"
#include "strengthener/StrengthenerInterface.h"
#include "CnfHolder.h"
#include <zlib.h>

#include "SolutionsInterface.h"
#include "TableSolutions.h"
#include "BDDSolutions.h"

#include "mpi_global.h"

extern MPI_Comm mastercommunicator;
extern MPI_Comm subcommunicator_sls;
extern MPI_Comm subcommunicator_strengthener;

extern int world_rank;
extern int world_size;

extern Cnf* cnf;
extern Dag* dag;
extern CnfHolder* cnf_holder;
extern LingelingMaster* master;

extern Arguments command_line_arguments;
extern MPICommsInterface* comms;

extern vector<Message*> extra_clauses;
extern bool workers_in_loop;

int recieve_CNF_DAG();
void load_CNF_DAG(Cnf* new_cnf, Dag* new_dag);
void setup_dagster();
set<int> get_free_workers();
tuple<vector<tuple<Message*, int>>, vector<tuple<Message*, int>>> async_solve(const set<int>& workers_to_send_to);
tuple<vector<tuple<Message*, int>>, vector<tuple<Message*, int>>> sync_solve();
set<int> get_unsat_nodes();
void add_clauses(Message* message);
void add_clauses_worker(Message* message, int worker);
void initial_message(Message* message);
void initial_message(Message* message, int worker);
void shutdown();
void worker_shutdown();
void master_init();
void clearBDD();
void global_init(int argc, char **argv, string tmp_dir, const map<int, vector<int>>& subproblem_to_propositions, const map<int, vector<int>>& subproblem_to_assumptions);
#endif
