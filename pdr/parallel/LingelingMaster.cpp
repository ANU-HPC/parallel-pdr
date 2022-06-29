#include "LingelingMaster.h"
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
#include <set>
#include "arguments.h"
#include "mpi_global.h"
#include <cassert>

using namespace std;

void LingelingMaster::async_send(const set<int>& workers_to_send_to) {
  // Just sends off work
  //cout << "free workers size " << this->free_workers.size() << endl;
  //cout << "workers to send to size" << workers_to_send_to.size() << endl;
  //cout << "messages to send " << messages_to_process.size() << endl;
  Message* message;
  for (auto it=workers_to_send_to.begin(); it!=workers_to_send_to.end(); it++) {
    const int worker = *it;
    while(add_clauses_messages_to_process[worker].size()) {
      message = *(add_clauses_messages_to_process[worker].end()-1);
      add_clauses_messages_to_process[worker].pop_back();
      // TODO investigate why can't: delete message;
      comms->send_message(worker, MPI_TAG_NEW_CLAUSES, message); // as need to be sent first
      delete message;
    }
  }

  //assert(messages_to_process.size() == 0); // Only set up to support messages for specific workers
  if (messages_to_process.size()) {
    // Regular messages
    assert(workers_to_send_to.size() == messages_to_process.size());
    for (auto it=workers_to_send_to.begin(); it!=workers_to_send_to.end(); it++) {
      const int worker = *it;
      message = *(messages_to_process.end()-1);
      messages_to_process.pop_back();
      comms->send_message(worker, MPI_TAG_NEW_ASSIGNMENT, message);
      assert(this->free_workers.find(worker) != this->free_workers.end());
      this->free_workers.erase(worker);
      delete message;
    }
  } else {
    for (auto it=workers_to_send_to.begin(); it!=workers_to_send_to.end(); it++) {
      const int worker = *it;

      assert(worker_with_unprocessed_message.find(worker) != worker_with_unprocessed_message.end());
      worker_with_unprocessed_message.erase(worker);

      message = worker_to_message_to_process[worker];
      comms->send_message(worker, MPI_TAG_NEW_ASSIGNMENT, message);
      assert(this->free_workers.find(worker) != this->free_workers.end());
      this->free_workers.erase(worker);
      delete message;
    }
    assert(worker_with_unprocessed_message.size() == 0);
  }
}

tuple<vector<tuple<Message*, int>>, vector<tuple<Message*, int>>> LingelingMaster::async_recieve() {
  //cout << "Start async_recieve" << endl;
  // Just recieve work completed
  vector<tuple<Message*, int>> solutions;
  vector<tuple<Message*, int>> used_assumptions;

  int source_worker;
  int message_tag;
  Message* m;

  while (comms->message_waiting()) {
    auto [source_worker,message_tag, m] = comms->receive_message(); // cout << "Just MPI recieved back a message with ID:" << m->id << endl;
    if (message_tag == MPI_TAG_REQUEST_FOR_ASSIGNMENT) {
      // just a check
      assert(this->free_workers.find(source_worker) == this->free_workers.end());
      this->free_workers.insert(source_worker);

      used_assumptions.push_back(tuple<Message*, int>(m,source_worker));
    } else if (message_tag == MPI_TAG_SOLUTION) {
      // just a check
      assert(this->free_workers.find(source_worker) == this->free_workers.end());
      this->free_workers.insert(source_worker);

      solutions.push_back(tuple<Message*, int>(m,source_worker));
    } else if (message_tag == MPI_TAG_DONE_ADDING) {/* PASS */delete m;} 
    else {
      LOG(ERROR) << "LingelingMASTER: Lingelingmaster received a message with unknown tag: " << message_tag;
      delete m;
      assert(0);
    }
  }
  return tuple<vector<tuple<Message*, int>>, vector<tuple<Message*, int>>>(solutions, used_assumptions);
}

tuple<vector<Message*>, vector<Message*>> LingelingMaster::loop() {
  assert(0);
}

tuple<vector<tuple<Message*, int>>, vector<tuple<Message*, int>>> LingelingMaster::sync_loop() {
  VLOG(4) << "LingelingMASTER: Start function named loop";
  vector<tuple<Message*, int>> solutions;
  vector<tuple<Message*, int>> used_assumptions;
  vector<int> workers_unassigned(free_workers.begin(), free_workers.end());
  vector<int> workers_retired;
  const int num_workers = comms->world_size-1;
  
  int add_clause_messages_to_process_total = 0;
  for (int worker=1; worker<num_workers+1; worker++) add_clause_messages_to_process_total += add_clauses_messages_to_process[worker].size();

  int source_worker;
  int message_tag;
  Message* m;

  // Once has an assert there is work to be done. Changed as now allow no actual work.

  VLOG(4) << "LingelingMASTER: processing add clause messages " << add_clause_messages_to_process_total;
  VLOG(4) << "LingelingMASTER: processing normal messages " << messages_to_process.size();

  while ((workers_unassigned.size() != num_workers) || (messages_to_process.size()) || add_clause_messages_to_process_total) {
    assert(workers_unassigned.size() <= num_workers); // always <=. and not equal as some should be working TODO comment doesn't make sense
    VLOG(4) << "LingelingMASTER: Start process messages loop, with workers_unassigned: " << workers_unassigned << endl;
    // while workers are still working, or there are messages to process
    // first send off any new work to be done
    while (workers_unassigned.size() && (messages_to_process.size() || add_clause_messages_to_process_total)) {
      // work and workers available
      const int worker = *(workers_unassigned.end()-1);
      workers_unassigned.pop_back();
      Message* message;

      VLOG(4) << "LingelingMASTER: about to send a new message";
      if (add_clauses_messages_to_process[worker].size()) {
        assert(add_clause_messages_to_process_total);
        message = *(add_clauses_messages_to_process[worker].end()-1);
        add_clauses_messages_to_process[worker].pop_back();
        comms->send_message(worker, MPI_TAG_NEW_CLAUSES, message);
        workers_unassigned.push_back(worker); // Assume it will be ready for the next message soon, historically has a specific tag to say they were ready
        // TODO investigate why can't: delete message;
        delete message;
        add_clause_messages_to_process_total--;
      } else if (messages_to_process.size()) {
        message = *(messages_to_process.end()-1);
        messages_to_process.pop_back();
        comms->send_message(worker, MPI_TAG_NEW_ASSIGNMENT, message);
        delete message;
      } else {
        // nothing for this worker to do
        workers_retired.push_back(worker);
      }
    }

    // TODO inneficient, will push and pop a lot
    while (workers_retired.size()) {
      const int worker = *(workers_retired.end()-1);
      workers_retired.pop_back();
      workers_unassigned.push_back(worker);
    }

    
    // 2 cases:
    // all workers working, some or no messages left to be sent
    // some workers working, no messages left to be sent
    VLOG(4) << "workers unassigned when about to recieive back messages: " << workers_unassigned << endl;
    //  process incoming messages

    //if (workers_unassigned.size() == num_workers) continue; // TODO if this recieve_message is causing a deadlock, try uncommenting this line
    auto [source_worker,message_tag, m] = comms->receive_message();
    if (message_tag == MPI_TAG_REQUEST_FOR_ASSIGNMENT) used_assumptions.push_back(tuple<Message*,int>(m,source_worker));
    else if (message_tag == MPI_TAG_SOLUTION) solutions.push_back(tuple<Message*,int>(m,source_worker));
    else if (message_tag == MPI_TAG_DONE_ADDING) {/* PASS */delete m;} 
    else {
      LOG(ERROR) << "LingelingMASTER: Lingelingmaster received a message with unknown tag: " << message_tag;
      delete m;
      assert(0);
    }
    
    workers_unassigned.push_back(source_worker);
  }

  // TODO review why are these here in the first place?
  while (add_clauses_messages_to_process[0].size()) {
    delete *(add_clauses_messages_to_process[0].end()-1);
    add_clauses_messages_to_process[0].pop_back();
  }
  
  for (auto it=add_clauses_messages_to_process.begin(); it!=add_clauses_messages_to_process.end(); it++) {
    assert(it->size() == 0);
  }

  VLOG(4) << "LingelingMASTER: End function named loop";

  free_workers = set<int>(workers_unassigned.begin(), workers_unassigned.end());
  assert(free_workers.size() == num_workers);
  // all workers are finished and there is no more messages to process
  return tuple<vector<tuple<Message*, int>>, vector<tuple<Message*, int>>>(solutions, used_assumptions);
}

void LingelingMaster::send_exit() {
  // kill all remaining workers
  for (int i = 1; i < comms->world_size; i++) {
    VLOG(2) << "LingelingMASTER: sending kill signal to worker " << i;
    comms->send_tag(i, MPI_TAG_KILL);
  }
}

void LingelingMaster::isend_exit() {
  // kill all remaining workers
  for (int i = 1; i < comms->world_size; i++) {
    VLOG(2) << "LingelingMASTER: sending kill signal to worker " << i;
    comms->isend_tag(i, MPI_TAG_KILL);
  }
}

