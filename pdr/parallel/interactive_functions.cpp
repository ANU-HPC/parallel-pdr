#include "interactive_functions.h"

MPI_Comm mastercommunicator;
MPI_Comm subcommunicator_sls;
MPI_Comm subcommunicator_strengthener;

int world_rank;
int world_size;

LingelingMaster* master = NULL;

Arguments command_line_arguments;
MPICommsInterface* comms;

vector<Message*> extra_clauses;
bool workers_in_loop = false;

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
  master->isend_exit();
  while (master->free_workers.size() != comms->world_size-1) master->async_recieve();
  comms->cancel_all_isend_tags();
  VLOG(2) << "process " << world_rank << " exiting";
  delete comms;
  if (master != NULL)
    delete master;
  for (auto it = extra_clauses.begin(); it != extra_clauses.end(); it++)
    delete *it;
  MPI_Finalize();
}

void worker_shutdown() {
  VLOG(2) << "process " << world_rank << " exiting";
  MPI_Finalize();
}

void master_init() {
  comms = new MPICommsInterface(&mastercommunicator);
  master = new LingelingMaster(comms,command_line_arguments.ENUMERATE_SOLUTIONS,command_line_arguments.BREADTH_FIRST_NODE_ALLOCATIONS,false);
  for (int node = 0; node < comms->world_size; node++) master->add_clauses_messages_to_process.push_back(vector<Message*>());
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
  extra_clauses.clear();

  assert(command_line_arguments.mode == 3);
  if (command_line_arguments.mode == 3) {
    // We are assuming at least 2 processes for this task
    if (world_size < 2) {
      LOG(ERROR) << "World size must be greater than 1";
      MPI_Abort(MPI_COMM_WORLD, 1);
    }
    MPI_Comm_split(MPI_COMM_WORLD, 0, world_rank, &mastercommunicator);
    if (world_rank != 0) { // enter the master loop if rank zero
      comms = new MPICommsInterface(&mastercommunicator);

      LingelingWorker* lingelingWorker = new LingelingWorker(comms);
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
