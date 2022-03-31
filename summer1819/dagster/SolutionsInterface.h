#ifndef MASTER_INTERFACE_H_
#define MASTER_INTERFACE_H_

#include "exceptions.h"
#include "message.h"
#include "Dag.h"
#include <algorithm>
#include <vector>

class SolutionsInterface {
  public:
  virtual int input_message(Message* m)=0;
  virtual Message *output_message(bool BREADTH_FIRST_NODE_ALLOCATIONS)=0;
  virtual int** get_additional_clauses(int node)=0;
};



class WrappedSolutionsInterface : public SolutionsInterface {
  private:
    Dag* dag;
    std::vector<int> incoming_message_count;
    std::vector<int> outgoing_message_count;
  protected:
  WrappedSolutionsInterface(Dag *dag) {
    incoming_message_count.resize(dag->no_nodes);
    outgoing_message_count.resize(dag->no_nodes);
    this->dag = dag;
  }; // creates a new master instance, passing the appropriate dag structure.
  public:
  virtual ~WrappedSolutionsInterface() {}
  virtual void register_message_completion(Message* m)=0;
  void register_completion(Message* m) {  // registers for when each node completes an assignment - not for forward passing on.
    // need to make sure only the necessary varuiables are being added
    // only add the variable if it is on the arc in the dag
    // look for i in amalgamated_forward_connection_literals
    // if i is not there, continue

    // if the node has no forward connections, it is the final
    // node and should record the assignments to the important variables
    // - the reporting variables in the dag
    if (dag->forward_connections[m->from].size() == 0) {
      for (int i=m->assignments.size()-1; i>= 0; i--) {
        if (!dag->reporting.find(abs(m->assignments[i]))) {
          m->assignments.erase(m->assignments.begin()+i);
        }
      }
    } else {
      for (int i=m->assignments.size()-1; i>= 0; i--) {
        if (!dag->amalgamated_forward_connection_literals[m->from].find( abs(m->assignments[i]) ) ) {
          m->assignments.erase(m->assignments.begin()+i);
        }
      }
    }
    register_message_completion(m);
  }
  virtual void add_message(Message* m)=0; // add a message to the Master's memory, stored by message's to and from fields
  int input_message(Message* m) {
    if (m==NULL)
      throw BadParameterException("WrappedSolutionsInterface input_message called with NULL message");
    register_completion(m);
    Message temp_m;
    for (int j = 0; j < dag->forward_connections[m->from].size(); j++) { // otherwise send to all of the forward connections
      temp_m.set(m);
      temp_m.to = dag->forward_connections[m->from][j];
      temp_m.purge_variables(dag->forward_connection_literals[temp_m.from][temp_m.to]);
      outgoing_message_count[temp_m.from]++; 
      add_message(&temp_m);
    }
    return dag->forward_connections[m->from].size();
  }
  virtual void print_stats(bool file, bool full) {};
  virtual Message *get_new_message_combination(int depth)=0; // for a specified depth, get a new message combination if there is one.
  Message *output_message(bool BREADTH_FIRST_NODE_ALLOCATIONS) {
    int depth = (BREADTH_FIRST_NODE_ALLOCATIONS ? 0 : dag->max_depth);
    while (BREADTH_FIRST_NODE_ALLOCATIONS ? depth <= dag->max_depth : depth >= 0) { // progressively increase the depth looking for maximum work for our workers
      Message *mess = get_new_message_combination(depth);                // generate an assignment
      if (mess == NULL) {
        depth += (BREADTH_FIRST_NODE_ALLOCATIONS ? 1 : -1);
      } else {  // for each new assignment found add it to the buffer, and create vectors for workers to be assigned to work on the message
        incoming_message_count[mess->to]++;
        return mess;
      }
    }
    return NULL;
  }
  virtual int** get_additional_clauses(int node)=0; // get negated BDD representation of everything we have seen before (or otherwise NULL if not defined)
  int get_incoming_message_count(int node) {
    return incoming_message_count[node];
  }
  int get_outgoing_message_count(int node) {
    return outgoing_message_count[node];
  }
};


#endif // MASTER_INTERFACE_H_

