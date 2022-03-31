#ifndef TABLE_MASTER_H_
#define TABLE_MASTER_H_

#include "Dag.h"

#include <iostream>
#include <iterator>
#include <vector>
#include <deque>
#include <unordered_set>
#include "SolutionsInterface.h"

/** A hash function for a std::vector<int> */
struct VectorHash {
  size_t operator()(const std::vector<int> &v) const {
    std::hash<int> hasher;
    size_t seed = 0;
    for (int i : v) {
      seed ^= hasher(i) + 0x9e3779b9 + (seed << 6) + (seed >> 2);
    }
    return seed;
  }
};

class TableSolutions : public WrappedSolutionsInterface {
 private:
  int* max_depth; // the maximum depth that the dag supports, points to the dags->max_depth
  Cnf** additional_clauses;
 protected:
  Dag *dag;                                                // a reference to the appropriate DAG
  std::vector<std::vector<std::vector<Message>>> messages; // a collection of messages indexed by from,to
  std::vector<std::unordered_set<std::vector<int>, VectorHash>> completed_combinations; // a collection of matched pairs of messages allready done
                                                                     // for each node, a set of messages (lists of literal assignments)
  bool _get_combination(int node, std::vector<int> message_indexes, std::vector<std::vector<int>> *literal_assignments, int reverse_connection_index);

 public:
  TableSolutions(Dag *dag); // creates a new master instance, passing the appropriate dag structure.
  virtual ~TableSolutions();
  virtual void add_message(Message* m); // add a message to the Master's memory, stored by message's to and from fields
  virtual Message *get_new_message_combination(int depth); // for a specified depth, get a new message combination if there is one.
  virtual int** get_additional_clauses(int node);
  virtual void register_message_completion(Message* m);
};

#endif // TABLE_MASTER_H_
