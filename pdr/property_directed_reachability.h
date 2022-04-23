#ifndef PROPERTY_DIRECTED_REACHABILITY_H
#define PROPERTY_DIRECTED_REACHABILITY_H

#include "interactive_functions.h"
#include "parser.h"
#include "queue.h"
#include "set_trie.h"
#include "timing.h"
#include <cassert>
#include <cstdlib>
#include <list>
#include <map>
#include <set>
#include <sstream>
#include <stdlib.h>
#include <string>
#include <vector>

#include <iomanip>
#include <iterator>
#include <sstream>

// the special fake SCC node used to represent the entire subproblem - useful
// when using lingeling/dagster together
#define COLLATING_SCC_NODE (-1)
#define NODE_NONEXISTENT (-2)
#define ADD_CLAUSES_FROM 123
#define PDR property_directed_reachability

// This is going to break again with the simulated parallel
#define CLAUSE_PUSHING 1

#define A 0
#define P 0
#define S 0
#define LOUD 0
#define PRINT_EVERY_COMPLETE_SUBPROBLEM 0
#define WARNINGS 0

// "MAX_SOLVER_STEPS" is the number of steps (cnf) that is loaded
#define MAX_SOLVER_STEPS 4
#define MS_DEFAULT_STEPS_USED 1
#define MULTI_STEP_REASON_CALCULATE_AT_ALL 0
#define MULTI_STEP_REASON_ACTUALLY_USE 0
#define MULTI_STEP_INTERLEAVED 0

#define PRINT_STATES 0
#define PRINT_BUFFER_SIZE 0
#define PRINT_END_RESULT 0

#define MONOLYTH_WITH_PROJECTIONS 0
#define TEST_NAL 0
#define PORTFOLIO_QUEUE 0

#if PORTFOLIO_QUEUE
#define QUEUE_TYPE PDR_Portfolio_Queue
#else
#define QUEUE_TYPE PDR_Queue
#endif

// Turning on "allow" just turne it on. Sets up the solvers, sends nogods,
// tracks layer info runtime variables say which one to use

#define VERBOSE_STATE 1

#include "parser.h"
#include "queue.h"
#include "set_trie.h"
#include "timing.h"
#include <cassert>
#include <cstdlib>
#include <list>
#include <map>
#include <set>
#include <sstream>
#include <stdlib.h>
#include <string>
#include <vector>

#include <iomanip>
#include <iterator>
#include <sstream>

class Timer {
public:
  void start() {
    assert(start_time == 0);
    start_time = clock();
  }
  void pause() {
    stored_duration += (clock() - start_time);
    start_time = 0;
  }
  void print() {
    assert(start_time == 0);
    stringstream stream;
    stream << fixed << setprecision(5)
           << ((float)(stored_duration)) / CLOCKS_PER_SEC;
    cout << stream.str();
  }
  clock_t stored_duration = 0;

private:
  clock_t start_time = 0;
};

Cnf *get_cnf(const vector<vector<int>> &clauses);
string string_float(float number);
float float_time(clock_t time);
string vector_string(vector<int> state);
bool in_pos_vector(int x, const vector<int> &vec);
vector<int>
project_state_to_propositions(const vector<int> &state,
                              const vector<int> &project_propositions);

namespace property_directed_reachability {
class Obligation {
public:
  vector<int> state;
  int layer;
  int subproblem;
  int worker;
  int id;

  // are these two equivalent?
  bool reduce;
  bool keep_states;
};

// Class for tracking which actions lead to which states
class State_Actions {
public:
  void set_final_state(const vector<int> &state, const int in_subproblem);
  void add_state(const vector<int> &succ_state, const vector<int> &prev_state,
                 const vector<int> &actions, const int state_subproblem,
                 const int succ_state_layer);
  void remove_state(const vector<int> &succ_state);
  void write_empty_plan();
  void print_write_path(const vector<int> &final_state, int subproblem);
  void print_write_path_final_state();
  // Map from states -> previous_state, actions
  map<vector<int>, tuple<vector<int>, vector<int>, int>> data;

private:
  vector<int> final_state;
  int subproblem = -1;
};

// Layer objects
class Layers {
public:
  // A direct implementation - one for each layer type
  virtual void solver_add_reason(const vector<int> &reason, int layer,
                                 int subproblem) = 0;
  virtual void make_layer_exist(int layer) = 0;

  void print_reasons_size();
  void print_reasons();
  void check();
  void add_reason(const vector<int> &reason, int layer, int subproblem);
  set<vector<int>> get_reasons_not_in_next_layer(int layer, int subproblem);
  bool same_as_previous(int nextLayer, set<int> subproblems_to_check);
  int get_first_empty_layer();
  void push_nonfinal_up_to_layer(int desired_just_empty_layer);
  set<tuple<int, vector<int>>> seen_before; // for debugging
  vector<vector<Set_Trie>> reasons; // the REASONS that are unique in this layer
};

class Dagster_Layers : public Layers {
public:
  void make_layer_exist(int layer);

private:
  // upper layer to add to, this function adds to all less also
  void solver_add_reason(const vector<int> &reason, int layer, int subproblem);
};

class Single_Layers : public Layers {
public:
  ~Single_Layers();
  void make_layer_exist(int layer);
  vector<vector<Lingeling *>> layer_to_steps_solvers;

private:
  // upper layer to add to, this function adds to all less also
  void solver_add_reason(const vector<int> &reason, const int layer,
                         const int subproblem);
};

// Functions
vector<int>
project_state_to_propositions(const vector<int> &state,
                              const vector<int> &project_propositions);
vector<int> inflate_compressed_to_full(const vector<int> &compressed_state,
                                       const vector<int> &full);
vector<int> compress_state(const vector<int> &state, const int subproblem,
                           const bool proper_state);
vector<int> uncompress_state(const vector<int> &compressed_state);
bool subset(vector<int> a, vector<int> b);

string str(const Obligation &obl);
bool state_conforms_to_only_one_cliques(vector<int> state,
                                        const int subproblem);
void BUFFER_print_state_count();
bool state_print_comp(int i, int j);

string pos_state_string(vector<int> state);
#if VERBOSE_STATE
string lit_string(int lit);
string state_string(vector<int> state);
#else
string state_string(vector<int> state);
#endif
string state_string(set<int> state);
string str(vector<vector<int>> x);
string str(set<vector<int>> x);
int tilde_lit(int lit, int amount);
vector<int> tilde_clause(vector<int> clause, int amount);
vector<int> get_clause_from_reason(const vector<int> &reason,
                                   const int subproblem);
int get_reason_scc_node(const vector<int> &reason);
vector<int> project_state_to_only_one_mutex_cliques(const vector<int> &state,
                                                    const int subproblem);

vector<int> convert_clause_for_steps(vector<int> clause, int steps);
pair<vector<vector<int>>, vector<vector<int>>>
project_to_state_actions(const vector<int> &assignment, const int subproblem,
                         const int steps_used);
vector<string> split(const string &input);
void read_mapping();
void read_extra_settings(string extra_settings_filename);
// Read in the dagster info file created by the parser
void read_problem_input();
void read_problem_input_isolate_subproblems();
void dagster_initialize_to_send_clauses(
    const set<int> &workers_to_compile_clauses_for);
vector<int> single_get_successor(const vector<int> &state, int layer,
                                 int subproblem, bool record);
bool single_has_successor(const vector<int> &state, int layer, int subproblem);
vector<int> single_get_reason_just_used(const vector<int> &state, int layer,
                                        int subproblem);
vector<int> single_get_reason(const vector<int> &state, int layer,
                              int subproblem);
void print_dagster_stats();
void dagster_start(int argc, char **argv);
void dagster_stop();
void add_reason(const vector<int> &reason, int layer, int subproblem);
void make_layer_exist(int layer);
set<vector<int>> get_reasons_not_in_next_layer(int layer, int scc_node);
bool same_as_previous(int layer, set<int> layers_to_check);
int get_first_empty_layer();
void push_nonfinal_up_to_layer(int just_empty_layer);

// TODO how to do this efficiently
extern Dagster_Layers dagster_layers;
extern Single_Layers single_layers;
extern State_Actions state_actions;

// member variables
extern int MS_steps_used;
extern vector<vector<int>>
    BUFFER_layer_to_subproblem_to_state_count; // for use in buffer only (would
                                               // be a member of buffer, but
                                               // scope and position of classes)

extern Timing timing;
extern Timer parallel_timer;
extern clock_t total_parallel_time_spent;

extern vector<int> initial_state;
extern vector<int> goal_condition;
extern vector<int> propositions;
extern set<int> propositions_set;
extern vector<int> actions;
extern set<int> actions_set;
extern int total_per_timestep;
extern vector<string> symbols;
extern string tmp_dir;
extern int num_workers;
extern vector<Lingeling *> baseLingelings;

// TODO tmp
extern vector<vector<vector<vector<int>>>>
    worker_upper_layer_dagster_clauses_to_add;

// at runtime, use dagster? if false use lingeling instead, ONLY ONE AT A TIME
extern bool runtime_dagster;
extern bool storing_actions;

extern vector<int> dagster_sat_counts;
extern vector<int> dagster_unsat_counts;
extern int dagster_call_count;
extern clock_t dagster_total_time;

// setting file settings (should be integrated properly long term)
extern bool project_last;
extern bool complete_nonfinal;
extern bool obligation_rescheduling;
extern bool use_OOC; // use only_one_clique information
extern bool isolate_subproblems;
extern bool extra_settings_read;

// In the case of isolate_subproblem, the subproblem we are dealing with in this
// instance
extern int isolate_subproblems_number;

extern vector<vector<int>> ooc_clauses_for_every_new_solver;
extern set<int> workers_to_send_to;

#if TEST_NAL
extern set<int> activation_vars;
#endif

// Dagster specific
extern int num_subproblems;
extern map<int, vector<int>> subproblem_to_propositions;
extern map<int, vector<int>> subproblem_to_actions;
extern map<int, vector<int>> subproblem_to_assumptions;
extern map<int, vector<int>> subproblem_to_clause_validating_lits;

extern map<int, vector<vector<int>>> subproblem_to_only_one_cliques;
} // namespace property_directed_reachability
#endif
