#ifndef PROBLEM_H
#define PROBLEM_H

#include <stdlib.h>
#include <cassert>
#include <vector>
#include <set>
#include <algorithm>
#include <map>
#include <iostream>

#include "rapidjson/document.h"
#include "rapidjson/prettywriter.h"
#include "Log.h"

using namespace std;

class Problem {
  public:
    // TODO add bounds on actions, props etc, and tell that to the successor extractor
    Problem();
    Problem(int argc, char **argv);
    //void print();

    string tmp_dir;
    bool generate_plan;
    bool MPI_active;

    bool project_last;
    bool complete_nonfinal;
    bool obligation_rescheduling;
    bool use_ooc;
    bool isolate_subproblems;
    bool interleaved_layers; // For macros, instead of just reasons at the end, put them throughout
    int max_macro_steps;

    vector<string> symbols;


    int total_per_timestep;
    int num_aux;
    vector<int> actions;
    set<int> actions_set;
    int dagster_num_layers_supported;
    int num_subproblems;

    vector<int> initial_state;
    vector<int> goal_condition;
    vector<pair<vector<int>,vector<int>>> action_literals_to_extra_positive_effects; // a vector of pairs, each pair has 2 int vectors. The first is a set of conditions to be met, the second is the propositions that become true (adl when A B form)
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
    map<int, vector<int>> action_to_effects_strips;
    map<int, vector<int>> corresponding_to_er;
    map<int, vector<int>> er_to_corresponding;

    //map<int, vector<vector<int>>> subproblem_to_only_one_strips_cliques;
    bool parse_zero_one_string(string arg);
    bool zero_one_int_to_bool(int arg);
    void read_extra_settings(string extra_settings_filename);
    void process_command_line_arguments(int argc, char **argv);
    void read_mapping();
};
#endif
