#ifndef MPI_INTERFACE_H
#define MPI_INTERFACE_H
// strict MPI things

#include<mpi.h>

using namespace std;

class MPI_Interface {
  public:
    // have a default constructor that doesn't do anything - not sure the best way to go about it, I would like the constructor to just set up everything, but this is being called even if not in MPI, and there is no way to check if in MPI (cleanly)...
    void setup();
    bool is_worker();

    const static int MESSAGE_TAG_OBLIGATION         = 1;
    const static int MESSAGE_TAG_COMPRESSED_ACTIONS = 2;
    const static int MESSAGE_TAG_COMPRESSED_STATE   = 3;
  private:
    int _world_size;
    int _world_rank;
    MPI_Comm _main_communicator;
};

#endif
