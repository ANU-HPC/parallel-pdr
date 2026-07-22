#include "Master.h"
#include "Cnf.h"
#include "message.h"
#include "utilities.h"
#include <algorithm>
#include <argp.h>
#include <cstdio>
#include <cstdlib>
#include <glog/logging.h>
#include <iostream>
#include <mpi.h>
#include <stack>
#include "arguments.h"
#include "mpi_global.h"
#include "DisorderedArray.h"
#include "MasterOrganiser.h"

using namespace std;


MasterUnit::MasterUnit() {
  assigned = NULL;
  to_be_assigned = NULL;
  polled = true;
  needs_refresh = false;
}


MasterOrganiser::MasterOrganiser(int num_workers) : message_buffer() {
  this->num_workers = num_workers;
  workers = new MasterUnit[num_workers];
}
MasterOrganiser::~MasterOrganiser() {
  delete[] workers;
}

// add to the message buffer
void MasterOrganiser::add_message(Message* m) {
  message_buffer.add(m);
}

// remove from the message buffer, freeing all allocation to workers
void MasterOrganiser::remove_message(Message* m) {
  for (int i=0; i<num_workers; i++) {
    if (workers[i].assigned == m)
      workers[i].assigned = NULL;
    if (workers[i].to_be_assigned == m)
      workers[i].to_be_assigned = NULL;
  }
  message_buffer.remove(m);
}

// get information about what messages will have the max/min number of workers on them
// after all allocations have been completed
std::tuple<int,Message*,int,Message*> MasterOrganiser::get_min_max_count() {
  int min_count = num_workers+1;
  Message* min_message = NULL;
  int max_count = 0;
  Message* max_message = NULL;
  for (int i=0; i<message_buffer.length; i++) {
    int count = 0;
    for (int j=0; j<num_workers; j++)
      // if the worker is going to be assigned to the message, or otherwise if it is working on the message and not going to be reassigned elsewhere
      if ( (workers[j].to_be_assigned == message_buffer[i]) || 
           ((workers[j].to_be_assigned == NULL) && (workers[j].assigned == message_buffer[i])) )
        count++;
    if (count < min_count) {
      min_count = count;
      min_message = message_buffer[i];
    }
    if (count > max_count) {
      max_count = count;
      max_message = message_buffer[i];
    }
  }
  return {min_count,min_message,max_count,max_message};
}

// for all workers, issue allocations so that they balance between the messages
// NOTE: this method is not very efficient, but if we are talking small numbers of workers (ie. < 1000) then meh.
void MasterOrganiser::allocate_assignments() {
  // dish out work to idle workers
  for (int i=0; i<num_workers; i++)
    if ((workers[i].assigned == NULL) && (workers[i].to_be_assigned == NULL)) {
      auto [min_count,min_message,max_count,max_message] = get_min_max_count();
      workers[i].to_be_assigned = min_message;
    }
  // reallocate to_be_assigned to balance
  while (true) {
    auto [min_count,min_message,max_count,max_message] = get_min_max_count();
    if (max_count - min_count >= 2) { // if after the assignments are done, there are messages with difference of more than one worker on it
      int i;
      for (i=0; i<num_workers; i++) { // try to take one from the to_be_assigned and re-assign it
        if (workers[i].to_be_assigned == max_message) {
          workers[i].to_be_assigned = min_message;
          break;
        }
      }
      if (i==num_workers) { // otherwise truly deallocate a worker
        for (i=0; i<num_workers; i++) {
          if ((workers[i].assigned == max_message) &&
              (workers[i].to_be_assigned == NULL)) {
            workers[i].to_be_assigned = min_message;
            break;
          }
        }
      }
    } else
      break;
  }
}

// for all workers working on a message m, set their needs_refresh to be true
void MasterOrganiser::refresh_except(Message* m, int worker) {
  for (int i=0; i<num_workers; i++)
    if (i!=worker)
      if (workers[i].assigned != NULL)
        if (workers[i].assigned->to == m->to)
          workers[i].needs_refresh = true;
}


void MasterOrganiser::debug_message(char* prepend) {
  printf("%s\n",prepend);
  printf("   assigned:\n");
  for (int i=0; i<message_buffer.length; i++) {
    printf("   %i : ",message_buffer[i]->to);
    for (int j=0; j<num_workers; j++)
      if (workers[j].assigned == message_buffer[i])
        printf("%i ",j+1);
    printf("\n");
  }
  printf("   to_be_assigned:\n");
  for (int i=0; i<message_buffer.length; i++) {
    printf("     : ");
    for (int j=0; j<num_workers; j++)
      if (workers[j].to_be_assigned == message_buffer[i])
        printf("%i ",j+1);
    printf("\n");
  }
  printf("   polled: ");
  for (int j=0; j<num_workers; j++)
    if (workers[j].polled)
      printf("%i ",j+1);
  printf("\n");
  printf("   needs_refresh: ");
  for (int j=0; j<num_workers; j++)
    if (workers[j].needs_refresh)
      printf("%i ",j+1);
  printf("\n");
}





