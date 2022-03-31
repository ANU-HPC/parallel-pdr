#ifndef _MASTER_ORGANISER_H
#define _MASTER_ORGANISER_H

#include <vector>
#include "message.h"
#include "DisorderedArray.h"

using namespace std;


// status of a given worker, as relevent to the Master
// what work it is currently operating on, what work it will (eventually) be reassigned to, and whether or not it is asking for a reassignment
class MasterUnit {
public:
  Message* assigned;  // the message that the worker is currently processing
  Message* to_be_assigned;  // the message that the worker will be given to process when it polls for a new assignment
  bool polled; // boolean flag indicating the worker wants a response
  bool needs_refresh; // a boolean flag indicating that the message that this one is working on has updated additional clauses

  MasterUnit();
};

// class which holds basic organisations and manipulations between workers and messages
class MasterOrganiser {
public:
  DisorderedArray<Message*> message_buffer;
  MasterUnit* workers;
  int num_workers;

  MasterOrganiser(int num_workers);
  ~MasterOrganiser();

  // add to the message buffer
  void add_message(Message* m);

  // remove from the message buffer, freeing all allocation to workers
  void remove_message(Message* m);

  // get information about what messages will have the max/min number of workers on them
  // after all allocations have been completed
  std::tuple<int,Message*,int,Message*> get_min_max_count();

  // for all workers, issue allocations so that they balance between the messages
  // NOTE: this method is not very efficient, but if we are talking small numbers of workers (ie. < 1000) then meh.
  void allocate_assignments();

  // for all workers working on a message m, set their needs_refresh to be true
  void refresh_except(Message* m, int worker);

  void debug_message(char* prepend);
};

#endif

