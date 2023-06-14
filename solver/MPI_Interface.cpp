#include "MPI_Interface.h"

void MPI_Interface::setup() {
  // Come back and review

  /*
  MPI_Init(NULL, NULL);
  // Find out rank, size
  MPI_Comm_rank(MPI_COMM_WORLD, &_world_rank);
  MPI_Comm_size(MPI_COMM_WORLD, &_world_size);

  // We are assuming at least 2 processes for this task
  if (world_size < 2) {
    cerr << "World size must be greater than 1";
    MPI_Abort(MPI_COMM_WORLD, 1);
  }

  // TODO what does this do?
  MPI_Comm_split(MPI_COMM_WORLD, 0, _world_rank, &_main_communicator);

  // the original then sets up a comms object


  if (world_rank != 0) { // enter the master loop if rank zero
    comms = new MPICommsInterface(&mastercommunicator);

    LingelingWorker* lingelingWorker = new LingelingWorker(comms);
    lingelingWorker->loop(tmp_dir, subproblem_to_propositions, subproblem_to_assumptions); // enter the lingelingWorker loop otherwise
    delete comms;
    delete lingelingWorker;
  }

  if (world_rank != 0) { // all worker processes terminate once they exit their loops, but the master processes dosnt enter a loop and proceeds
    worker_shutdown();
	  exit(0);
  }
  master_init();
  */
}

bool MPI_Interface::is_worker() {
  return _world_rank != 0;
}

