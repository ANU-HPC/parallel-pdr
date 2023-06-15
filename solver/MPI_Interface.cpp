#include "MPI_Interface.h"

void MPI_Interface::setup() { // call this once universal
  MPI_Init(NULL, NULL);

  // Find out rank, size
  MPI_Comm_rank(MPI_COMM_WORLD, &_world_rank);
  MPI_Comm_size(MPI_COMM_WORLD, &_world_size);

  // We are assuming at least 2 processes for this task
  if (_world_size < 2) {
    cerr << "World size must be greater than 1";
    MPI_Abort(MPI_COMM_WORLD, 1);
  }

  // TODO what does this do?
  MPI_Comm_split(MPI_COMM_WORLD, 0, _world_rank, &_main_communicator);
}

bool MPI_Interface::is_worker() {
  return _world_rank != 0;
}

tuple<int,int,int*,int> MPI_Interface::recieve_message() {
  // get message length
  MPI_Status status;
  int size;
  MPI_Probe(MPI_ANY_SOURCE, MPI_ANY_TAG, _main_communicator, &status);
  MPI_Get_count(&status, MPI_INT, &size);

  // get message
  int* data = new int[size];
  MPI_Recv(data, size, MPI_INT, status.MPI_SOURCE, status.MPI_TAG, _main_communicator, &status);

  return {status.MPI_SOURCE, status.MPI_TAG, data, size};
}

void MPI_Interface::maybe_cleanup_isend_outbox() {
  if (_cleanup_isend_outbox_ticker==0) {
    _cleanup_isend_outbox_ticker = CLEANUP_ISEND_OUTBOX_TICKER_COUNT;

    vector<tuple<int*, MPI_Request*>> new_isend_outbox;

    int* data;
    MPI_Request* request;
    int completed_flag;

    for (auto it=_isend_outbox.begin(); it!=_isend_outbox.end(); it++) {
      auto [data, request] = *it;

      MPI_Request_get_status(*request, &completed_flag, &_status);
      if (completed_flag) {
        delete data;
        delete request;
      } else new_isend_outbox.push_back(*it);
    }

    _isend_outbox = new_isend_outbox;
  } else _cleanup_isend_outbox_ticker--;
}

void MPI_Interface::isend_then_delete_message(int destination, int tag, int* data, int size) {
  maybe_cleanup_isend_outbox();
  MPI_Request* request = new MPI_Request();
  MPI_Isend(data, size, MPI_INT, destination, tag, _main_communicator, request);
  _isend_outbox.push_back(tuple<int*, MPI_Request*>(data, request));
}

void MPI_Interface::send_then_delete_message(int destination, int tag, int* data, int size) {
  MPI_Send(data, size, MPI_INT, destination, tag, _main_communicator);
}

int MPI_Interface::world_size() {
  return _world_size;
}

int MPI_Interface::world_rank() {
  return _world_rank;
}
