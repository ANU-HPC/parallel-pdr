#ifndef MPI_INTERFACE_H
#define MPI_INTERFACE_H
// strict MPI things

#include <mpi.h>
#include <vector>
#include <tuple>
#include <cassert>
#inlcude <iostream>

#include "Log.h"

using namespace std;

class MPI_Interface {
  public:
    // have a default constructor that doesn't do anything - not sure the best way to go about it, I would like the constructor to just set up everything, but this is being called even if not in MPI, and there is no way to check if in MPI (cleanly)...
    void setup();
    bool is_worker();

    bool message_waiting();
    tuple<int,int,int*,int> recieve_message();
    void send_then_delete_message(int destination, int tag, int* data, int size);
    void isend_then_delete_message(int destination, int tag, int* data, int size);
    void isend_tag(int destination, int tag);

    int world_size();
    int world_rank();

    void barriered_finalize();

    const static int MESSAGE_TAG_OBLIGATION         = 1;
    const static int MESSAGE_TAG_SUCCESS            = 2;
    const static int MESSAGE_TAG_REASON             = 3;
    const static int MESSAGE_TAG_FINALIZE           = 4;
    const static int MESSAGE_TAG_IDLE               = 5;

  private:
    void maybe_cleanup_isend_outbox();
    int _world_size;
    int _world_rank;
    MPI_Comm _main_communicator;

    vector<tuple<int*, MPI_Request*>> _isend_outbox;
    const int CLEANUP_ISEND_OUTBOX_TICKER_COUNT = 100; // how often to clear out the outbox
    int _cleanup_isend_outbox_ticker = CLEANUP_ISEND_OUTBOX_TICKER_COUNT;
    MPI_Status _scratch_status;
};

#endif
