#ifndef PARSER_H
#define PARSER_H

#include <stdlib.h>
#include <cassert>
#include <vector>
#include <set>
#include <algorithm>
#include <map>
#include <iostream>

using namespace std;

class Parser {
  public:
    int parse(string);
    //void print();

    int total_per_timestep;
    vector<int> actions;
    set<int> actions_set;
    int dagster_num_layers_supported;
    int num_subproblems;

    vector<int> initial_state;
    vector<int> goal_condition;
    map<int, vector<int>> dag_node_to_nogood_propositions;
    map<int, map<int, int>> subproblem_layer_to_root_dag_node;
    map<int, map<int, map<int, int>>> subproblem_layer_base_scc_node_to_dag_node;
    map<int, int> collating_dag_node_to_subproblem;
    map<int, int> collating_dag_node_to_layer;
    map<int, int> dag_node_to_base_scc_node;
    map<int, vector<int>> base_scc_node_to_propositions;
    map<int, vector<int>> subproblem_to_propositions;
    map<int, vector<int>> subproblem_to_isolate_goal;
    map<int, vector<int>> subproblem_to_actions;
    map<int, vector<int>> subproblem_to_assumptions;
    map<int, vector<int>> subproblem_to_clause_validating_lits;
    map<int, vector<int>> action_to_preconditions;
    map<int, vector<int>> action_to_effects;
    map<int, vector<vector<int>>> subproblem_to_only_one_cliques;
};
#endif
