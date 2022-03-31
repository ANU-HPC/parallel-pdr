#ifndef MPI_COMMS_INTERFACE_H_
#define MPI_COMMS_INTERFACE_H_

#include "message.h"
#include <tuple>
#include "mpi.h"
#include "exceptions.h"
#include "Cnf.h"
#include "Dag.h"

class MPICommsInterface {
  private:
  MPI_Comm *communicator;
  int max_message_length;
  int *MPI_message_buffer;
  void reset_buffer(int size);
  MPI_Status tmp_status;
  
  vector<int*> MPI_isend_message_buffers;
  vector<int> max_isend_message_lengths;
  vector<MPI_Request*> MPI_isend_requests;
  vector<MPI_Request*> MPI_isend_tag_requests;


  public:
  int world_size;
  int world_rank;

  MPICommsInterface(MPI_Comm *communicator);
  ~MPICommsInterface();

  // sends an empty message with a specified tag to designation, can be recieved by recieve_message, which will give NULL message 
  void send_tag(int destination, int tag);

  void cancel_all_isend_tags();
  void isend_tag(int destination, int tag);
  // recieves a Message object from whoever sends it, return tupple is <sending_source, sending_tag, message_object>
  // NOTE: must delete message object when done.
  std::tuple<int,int,Message*> receive_message();
  // given a message object, send it to a destination with a specified tag
  void send_message(int destination, int tag, Message* m);

  bool message_waiting();
  int get_isend_buffer_id(int message_length);
  // given a message object, send it to a destination with a specified tag asynchronously
  void isend_message(int destination, int tag, Message* m);
  // recieves a CNF object from whoever sends it, returning CNF_object
  // NOTE: must delete CNF object when done.
  Cnf* receive_Cnf(int source, int tag);
  // given a CNF object, send it to a destination with a specified tag
  void send_Cnf(int destination, int tag, Cnf* cnf);
  // recieves a Dag object from whoever sends it, returning dag_object
  // NOTE: must delete dag object when done.
  Dag* receive_Dag(int source, int tag);
  // given a dag object, send it to a destination with a specified tag
  void send_Dag(int destination, int tag, Dag* dag);

};


#endif

