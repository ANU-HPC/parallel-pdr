#ifndef _DAG
#define _DAG

#include "Cnf.h"

#include "mpi_global.h"
#include "RangeSet.h"

#include <vector>
#include <set>

#define MAX_DAG_DEPTH 10000

class Dag {
public:
  int no_nodes;
  //number of nodes on the dag
  std::vector<int> node_status;
  //number of nodes on the dag
  std::vector<int> subgraph_index;
  // the status of each of the nodes (0= normal node, 1=base node)
  std::vector<std::vector<int>> forward_connections;
  // the forward connections between the nodes
  std::vector<std::vector<RangeSet>> forward_connection_literals;
  // the literals of the interfaces of forward connections between the nodes
  std::vector<RangeSet> amalgamated_forward_connection_literals;
  // the literals of the interfaces of forward connections from the nodes
  std::vector<std::vector<int>> reverse_connections;
  // the reverse connections between the nodes
  std::vector<RangeSet> clause_indices_for_each_node;
  // for each node, the list of lengths of its clauses
  int max_depth;
  // the greatest depth in the DAG
  std::vector<int> depth_for_each_node;
  // for each node, the depth which the node is at
  RangeSet reporting; // vector of the important variables in the problem

  void check_consistency();
  void assign_depths_and_status();
  void clear();

  Dag(const char *fname);
  Dag(int* dehydrated_data);
  Dag();
  ~Dag();

  int dehydrate(int *output_data);
  int get_dehydrated_size();
  void print();
  void generate_from_minimal();

};

#endif
