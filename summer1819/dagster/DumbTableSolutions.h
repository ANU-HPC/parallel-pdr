#ifndef D_TABLE_MASTER_H_
#define D_TABLE_MASTER_H_

#include "Dag.h"

#include <iostream>
#include <iterator>
#include <vector>
#include <deque>
#include <unordered_set>
#include "SolutionsInterface.h"
#include "TableSolutions.h"


class DumbTableSolutions : public WrappedSolutionsInterface {
 private:
  int* max_depth; // the maximum depth that the dag supports, points to the dags->max_depth
  Cnf** additional_clauses;
 protected:
  Dag *dag;                                                // a reference to the appropriate DAG
  std::vector<std::vector<std::vector<Message>>> messages; // a collection of messages indexed by from,to
  std::vector<std::unordered_set<std::vector<int>, VectorHash>> completed_combinations; // a collection of matched pairs of messages allready done
                                                                     // for each node, a set of messages (lists of literal assignments)
  bool _get_combination(int node, std::vector<int> &message_indexes, std::vector<std::vector<int>> *literal_assignments, int reverse_connection_index);

 public:
  DumbTableSolutions(Dag *dag); // creates a new master instance, passing the appropriate dag structure.
  virtual ~DumbTableSolutions();
  virtual void add_message(Message* m); // add a message to the Master's memory, stored by message's to and from fields
  virtual Message *get_new_message_combination(int depth); // for a specified depth, get a new message combination if there is one.
  virtual int** get_additional_clauses(int node);
  virtual void register_message_completion(Message* m);
};

#endif // TABLE_MASTER_H_
