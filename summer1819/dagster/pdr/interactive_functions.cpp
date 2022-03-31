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


MPI_Comm mastercommunicator;
MPI_Comm subcommunicator_sls;
MPI_Comm subcommunicator_strengthener;

int world_rank;
int world_size;

Cnf* cnf;
Dag* dag;
CnfHolder* cnf_holder;
LingelingMaster* master = NULL;

Arguments command_line_arguments;
MPICommsInterface* comms;

vector<Message*> extra_clauses;
bool workers_in_loop = false;

int recieve_CNF_DAG() {
  // load up the DAG and CNF, and connect them together
  if (cnf!=NULL)
    delete cnf;
  cnf = comms->receive_Cnf(0, MPI_TAG_CNF_SEND);
  if (cnf == NULL) // if NULL CNF sent and recieved then send zero, thus terminate
    return 0;
  if (cnf_holder != NULL)
    delete cnf_holder;
  if (dag!=NULL)
    delete dag;
  dag = comms->receive_Dag(0, MPI_TAG_DAG_SEND);
  //dag->reference_clauses(cnf);
  cnf_holder = new CnfHolder(dag, NULL, NULL, 0);
  cnf_holder->master_cnf = cnf; cnf_holder->generate_decomposition();
  cnf_holder->max_vc=cnf->vc;
  return 1; // return of one indicates successfull recieve of a dag/cnf
}

void load_CNF_DAG(Cnf* new_cnf, Dag* new_dag) {
  if (workers_in_loop)
    master->send_exit();
  cnf = new_cnf;
  dag = new_dag;
  if (cnf==NULL) {
    for (int i=1; i<world_size; i++) {
      comms->send_Cnf(i,MPI_TAG_CNF_SEND,cnf);
    }
  } else {
    for (int i=1; i<world_size; i++) {
      comms->send_Cnf(i,MPI_TAG_CNF_SEND,cnf);
      comms->send_Dag(i,MPI_TAG_DAG_SEND,dag);
    }
    // load up the DAG and CNF, and connect them together
    //dag->reference_clauses(cnf);
    if (cnf_holder != NULL)
      delete cnf_holder;
    cnf_holder = new CnfHolder(dag, NULL, NULL, 0);
    cnf_holder->master_cnf = cnf; cnf_holder->generate_decomposition();
    cnf_holder->max_vc=cnf->vc;
    for (auto it = extra_clauses.begin(); it != extra_clauses.end(); it++)
      delete *it;
    extra_clauses.clear();
    workers_in_loop = true;
  }
}


void setup_dagster() {
  const int num_workers = master->comms->world_size-1;
  for (int i=1; i < master->comms->world_size; i++) master->free_workers.insert(i);
}

set<int> get_free_workers() {
  return master->free_workers;
}

tuple<vector<tuple<Message*, int>>, vector<tuple<Message*, int>>> async_solve(const set<int>& workers_to_send_to) {
  master->async_send(workers_to_send_to);
  return master->async_recieve();
}

tuple<vector<tuple<Message*, int>>, vector<tuple<Message*, int>>> sync_solve() {
  return master->sync_loop();
}

set<int> get_unsat_nodes() {
  assert (master->last_call_unsat);
  set<int> unsat_nodes = set<int>();

  // for all nodes which were given an assignment
  for (auto ita=master->dag_nodes_given_assignments.begin(); ita!=master->dag_nodes_given_assignments.end(); ita++) {
    // dag_node given assignment
    const int dag_node = *ita; 
    if (master->dag_nodes_generated_solutions.find(dag_node) == master->dag_nodes_generated_solutions.end()) {
      // given assignment and didn't produce a solution
      unsat_nodes.insert(dag_node);
    } else {
      // if this node DID produce a solution, check if its descendants didn't
      // also see if any descendant can't create a solution
      for (auto itb=dag->forward_connections[dag_node].begin(); itb!=dag->forward_connections[dag_node].end(); itb++) {
        const int descendant = *itb;
        //check if descendant produced a solution
        if (master->dag_nodes_generated_solutions.find(descendant) == master->dag_nodes_generated_solutions.end()) {
          // if all THEIR parents produced solutions AND it didn't produce a solution then either:
          // 1. then the BDD couldn't combine solutions
          // 2. it could, but all those were unsat
          // Either way, the node is unsat

          bool all_coparents_produced_solutions = true;
          for (auto itc=dag->reverse_connections[descendant].begin(); itc!=dag->reverse_connections[descendant].end(); itc++) {
            const int coparent = *itc; 
            if (master->dag_nodes_generated_solutions.find(coparent) == master->dag_nodes_generated_solutions.end()){
              all_coparents_produced_solutions = false;
              break;
            }
          }
          if (all_coparents_produced_solutions) unsat_nodes.insert(descendant);
        }
      }
    }
  }

  assert(unsat_nodes.size());
  return unsat_nodes;
}

/*
void addClause(int node, int* clause) {
  Message* m = new Message(node,node);
  for (int i=0; clause[i]!=0; i++)
    m->assignments.push_back(-clause[i]);
  extra_clauses.push_back(m);
  VLOG(4) << "xyz addClause on message " << *m;
  master_implementation->register_message_completion(m);
}
*/

void add_clauses(Message* message) {
  assert(0);
  for (int node=0; node<comms->world_size; node++) {
    master->add_clauses_messages_to_process[node].push_back(message);
  }
}

void add_clauses_worker(Message* message, int worker) {
  master->add_clauses_messages_to_process[worker].push_back(message);
}

void initial_message(Message* message) {
  VLOG(4) << "xyz Placing intial message " << *message;
  master->messages_to_process.push_back(message);
}

void initial_message(Message* message, int worker) {
  VLOG(4) << "xyz Placing intial message (specific worker)" << *message;
  master->worker_to_message_to_process[worker] = message;
  assert(master->worker_with_unprocessed_message.find(worker) == master->worker_with_unprocessed_message.end());
  master->worker_with_unprocessed_message.insert(worker);
}

void shutdown() {
  //load_CNF_DAG(NULL,NULL);
  master->isend_exit();
  while (master->free_workers.size() != comms->world_size-1) master->async_recieve();
  comms->cancel_all_isend_tags();
  VLOG(2) << "process " << world_rank << " exiting";
  delete comms;
  if (master != NULL)
    delete master;
  //if (cnf!=NULL)
    //delete cnf;
  //if (dag!=NULL)
    //delete dag;
  for (auto it = extra_clauses.begin(); it != extra_clauses.end(); it++)
    delete *it;
  MPI_Finalize();
}

void worker_shutdown() {
  VLOG(2) << "process " << world_rank << " exiting";
  /*
  if (comms != NULL)
    delete comms;
  if (cnf!=NULL)
    delete cnf;
  if (dag!=NULL)
    delete dag;
  */
  MPI_Finalize();
}

void master_init() {
  comms = new MPICommsInterface(&mastercommunicator);
  master = new LingelingMaster(comms,command_line_arguments.ENUMERATE_SOLUTIONS,command_line_arguments.BREADTH_FIRST_NODE_ALLOCATIONS,false);
  for (int node = 0; node < comms->world_size; node++) master->add_clauses_messages_to_process.push_back(vector<Message*>());
}

void clearBDD() {
  assert(0); //meaningless here
}

void global_init(int argc, char **argv, string tmp_dir, const map<int, vector<int>>& subproblem_to_propositions, const map<int, vector<int>>& subproblem_to_assumptions) {
  google::InitGoogleLogging(argv[0]);
  google::InstallFailureSignalHandler();
  //command_line_arguments.load(argc, argv);
  //initialise all the MPI stuff
  MPI_Init(NULL, NULL);
  // Find out rank, size
  MPI_Comm_rank(MPI_COMM_WORLD, &world_rank);
  MPI_Comm_size(MPI_COMM_WORLD, &world_size);
  comms = NULL;
  cnf_holder = NULL;
  extra_clauses.clear();

  // if mode 0, we dont need to worry about any gnovelty stuff
  // and we can proceed with a tested vanilla TinySAT structure



  assert(command_line_arguments.mode == 3);
  if (command_line_arguments.mode == 3) {
    // We are assuming at least 2 processes for this task
    if (world_size < 2) {
      LOG(ERROR) << "World size must be greater than 1";
      MPI_Abort(MPI_COMM_WORLD, 1);
    }
    MPI_Comm_split(MPI_COMM_WORLD, 0, world_rank, &mastercommunicator);
    if (world_rank == 0) { // enter the master loop if rank zero
      /*
      //touch dag_out file before master loop
      FILE *fout;
      TEST_NOT_NULL(fout = fopen(command_line_arguments.output_filename, "w"))
      fclose(fout);
      //enter master loop
      MPICommsInterface* comms = new MPICommsInterface(&mastercommunicator);
      LingelingMaster master = LingelingMaster(comms,master_implementation,command_line_arguments.ENUMERATE_SOLUTIONS,command_line_arguments.BREADTH_FIRST_NODE_ALLOCATIONS);
      const tuple<vector<Message*>, vector<Message*>> solutions_and_used_assumptions = master.loop();
      const vector<Message*> solutions = get<0>(solutions_and_used_assumptions);
      const vector<Message*> used_assumptions = get<1>(solutions_and_used_assumptions);
      delete comms;
      */
    } else {
      comms = new MPICommsInterface(&mastercommunicator);

      recieve_CNF_DAG(); // don't loop over this - only recieve once
      LingelingWorker* lingelingWorker = new LingelingWorker(dag, comms, NULL, NULL, command_line_arguments.ENUMERATE_SOLUTIONS);
      lingelingWorker->loop(tmp_dir, subproblem_to_propositions, subproblem_to_assumptions); // enter the lingelingWorker loop otherwise
      delete comms;
      delete lingelingWorker;
    }
  }

  if (world_rank != 0) { // all worker processes terminate once they exit their loops, but the master processes dosnt enter a loop and proceeds
    worker_shutdown();
	exit(0);
  }
  master_init();
}




