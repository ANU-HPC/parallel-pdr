#include "MPICommsInterface.h"
#include "message.h"
#include <tuple>
#include "mpi_global.h"
#include <cassert>


// standard constructor, sets communicator and defines world_rank and world_size by it
// also allocates dynamic message_buffer or otherwise throws exception
MPICommsInterface::MPICommsInterface(MPI_Comm *communicator) {
  this->communicator = communicator;
  this->max_message_length = 1024;
  TEST_NOT_NULL(this->MPI_message_buffer = (int *)malloc(sizeof(int) * this->max_message_length))
  MPI_Comm_size(*communicator, &(this->world_size));
  MPI_Comm_rank(*communicator, &(this->world_rank));
};

// standard destructor, the mpi_message buffer needs to be freed
MPICommsInterface::~MPICommsInterface() {
  free(this->MPI_message_buffer);
  for (int i=0; i<this->MPI_isend_message_buffers.size(); i++) {
    free(this->MPI_isend_message_buffers[i]);
  }
}

// resize the buffer (if nessisary) to have atleast message_length length
void MPICommsInterface::reset_buffer(int message_length) {
  if (message_length > this->max_message_length) {
    while (message_length > this->max_message_length) this->max_message_length *= 2;
    TEST_NOT_NULL(this->MPI_message_buffer = (int*)realloc(this->MPI_message_buffer,sizeof(int)*(this->max_message_length)))
  }
}

bool MPICommsInterface::message_waiting() {
  int completed_flag;
  const int error_code = MPI_Iprobe(MPI_ANY_SOURCE, MPI_ANY_TAG, *(this->communicator), &completed_flag, &(this->tmp_status));
  assert(error_code==0);
  return completed_flag;
}


// Find a buffer to do the isend and
// resize the buffer (if nessisary) to have atleast message_length length
int MPICommsInterface::get_isend_buffer_id(int message_length) {
  int buffer_id = -1;

  // Try find a free existing buffer - TODO if this is expensive, could be made faster by, each time start checking, check from beyond the last check
  MPI_Status status;
  int completed_flag;
  for (int i=0; i<this->MPI_isend_message_buffers.size(); i++) {
    const int error_code = MPI_Request_get_status(*(this->MPI_isend_requests[i]), &completed_flag, &status);
    assert(error_code == 0);
    if (completed_flag) {
      buffer_id = i;
      break;
    }
  }

  // check if found a buffer or not
  if (buffer_id == -1) {
    // haven't found a free buffer, so make a new one
    const int default_length = 1024;
    int* new_buffer = (int *)malloc(sizeof(int) * default_length);
    TEST_NOT_NULL(new_buffer)

    this->max_isend_message_lengths.push_back(default_length);
    this->MPI_isend_message_buffers.push_back(new_buffer);
    this->MPI_isend_requests.push_back(new MPI_Request);
    buffer_id = this->MPI_isend_message_buffers.size()-1;
  }

  // Now have a buffer, make sure it is big enough
  if (message_length > this->max_isend_message_lengths[buffer_id]) {
    while (message_length > max_isend_message_lengths[buffer_id]) max_isend_message_lengths[buffer_id] *= 2;
    int* new_buffer = (int*)realloc(this->MPI_isend_message_buffers[buffer_id],sizeof(int)*(max_isend_message_lengths[buffer_id]));
    TEST_NOT_NULL(new_buffer)
    this->MPI_isend_message_buffers[buffer_id] = new_buffer;
  }

  return buffer_id;
}

// sends an empty message to destination with a tag.
void MPICommsInterface::send_tag(int destination, int tag) {
  MPI_Send(NULL, 0, MPI_INT, destination, tag, *(this->communicator));
}

// sends an empty message to destination with a tag.
void MPICommsInterface::isend_tag(int destination, int tag) {
  this->MPI_isend_tag_requests.push_back(new MPI_Request);
  MPI_Isend(NULL, 0, MPI_INT, destination, tag, *(this->communicator), this->MPI_isend_tag_requests[this->MPI_isend_tag_requests.size()-1]);
}

void MPICommsInterface::cancel_all_isend_tags() {
  for (int i=0; i<this->MPI_isend_tag_requests.size(); i++) {
    MPI_Request* r = this->MPI_isend_tag_requests[i];
    MPI_Cancel(r);
    delete r;
  }
}

// recieves a message from any source with any tag,
// reallocates the size of the message_buffer as appropriate and parses the incomming stream as a Message object which it returns
// return tuple is <message_source, message_tag, Message_object>
// NOTE: message object must be deleted when done.
std::tuple<int,int,Message*> MPICommsInterface::receive_message() {
  MPI_Status status;
  int message_length;
  MPI_Probe(MPI_ANY_SOURCE, MPI_ANY_TAG, *(this->communicator), &status);
  MPI_Get_count(&status, MPI_INT, &message_length);
  reset_buffer(message_length);
  MPI_Recv(this->MPI_message_buffer, message_length, MPI_INT, status.MPI_SOURCE, status.MPI_TAG, *(this->communicator), &status);
  Message *m = NULL;
  if (message_length > 0)
    m = new Message(this->MPI_message_buffer);
  return {status.MPI_SOURCE, status.MPI_TAG, m};
}

// given a message object, send it to destination with a tag.
// resulting message to be picked up with receive_message() function.
void MPICommsInterface::send_message(int destination, int tag, Message* m) {
  if (m==NULL) {
    send_tag(destination,tag);
    return;
  }
  int dehydrated_size = m->get_dehydrated_size();
  reset_buffer(dehydrated_size);
  m->dehydrate(this->MPI_message_buffer);
  MPI_Send(this->MPI_message_buffer, dehydrated_size, MPI_INT, destination, tag, *(this->communicator));
}

// given a message object, asynchronously send it to destination with a tag.
// resulting message to be picked up with receive_message() function.
void MPICommsInterface::isend_message(int destination, int tag, Message* m) {
  assert(m!=NULL);
  int dehydrated_size = m->get_dehydrated_size();
  int buffer_id = get_isend_buffer_id(dehydrated_size);
  m->dehydrate(this->MPI_isend_message_buffers[buffer_id]);
  //delete this->MPI_isend_requests[buffer_id];
  MPI_Isend(this->MPI_isend_message_buffers[buffer_id], dehydrated_size, MPI_INT, destination, tag, *(this->communicator), this->MPI_isend_requests[buffer_id]);
}

// recieves a Cnf from any source with any tag,
// reallocates the size of the message_buffer as appropriate and parses the incomming stream as a Cnf object which it returns
// return tuple is <message_source, message_tag, Cnf_object>
// NOTE: Cnf object must be deleted when done.
// NOTE: can recieve null message, returning CNF NULL.
Cnf* MPICommsInterface::receive_Cnf(int source, int tag) {
  MPI_Status status;
  int message_length;
  MPI_Probe(source, tag, *(this->communicator), &status);
  MPI_Get_count(&status, MPI_INT, &message_length);
  reset_buffer(message_length);
  MPI_Recv(this->MPI_message_buffer, message_length, MPI_INT, status.MPI_SOURCE, status.MPI_TAG, *(this->communicator), &status);
  Cnf *cnf = NULL;
  if (message_length > 0)
    cnf = new Cnf(this->MPI_message_buffer);
  return cnf;
}

// given a message object, send it to destination with a tag.
// resulting message to be picked up with receive_message() function.
void MPICommsInterface::send_Cnf(int destination, int tag, Cnf* cnf) {
  if (cnf==NULL) {
    send_tag(destination,tag);
    return;
  }
  int dehydrated_size = cnf->get_dehydrated_size();
  reset_buffer(dehydrated_size);
  cnf->dehydrate(this->MPI_message_buffer);
  MPI_Send(this->MPI_message_buffer, dehydrated_size, MPI_INT, destination, tag, *(this->communicator));
}


// recieves a Dag from any source with any tag,
// reallocates the size of the message_buffer as appropriate and parses the incomming stream as a Dag object which it returns
// return tuple is <message_source, message_tag, Dag_object>
// NOTE: Dag object must be deleted when done.
// NOTE: can recieve null message, returning DAG NULL.
Dag* MPICommsInterface::receive_Dag(int source, int tag) {
  MPI_Status status;
  int message_length;
  MPI_Probe(source, tag, *(this->communicator), &status);
  MPI_Get_count(&status, MPI_INT, &message_length);
  reset_buffer(message_length);
  MPI_Recv(this->MPI_message_buffer, message_length, MPI_INT, status.MPI_SOURCE, status.MPI_TAG, *(this->communicator), &status);
  Dag *dag = NULL;
  if (message_length > 0)
    dag = new Dag(this->MPI_message_buffer);
  return dag;
}

// given a message object, send it to destination with a tag.
// resulting message to be picked up with receive_message() function.
void MPICommsInterface::send_Dag(int destination, int tag, Dag* dag) {
  if (dag==NULL) {
    send_tag(destination,tag);
    return;
  }
  int dehydrated_size = dag->get_dehydrated_size();
  reset_buffer(dehydrated_size);
  dag->dehydrate(this->MPI_message_buffer);
  MPI_Send(this->MPI_message_buffer, dehydrated_size, MPI_INT, destination, tag, *(this->communicator));
}





