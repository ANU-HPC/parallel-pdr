// TODO make layer exist redundancy
// TODO adding this to has_successor makes it far slower/not end
/*
    assert(!use_dagster);
    bool res1 = single_has_successor(state, layer);
    bool res2 = single_has_successor(state, layer);
    bool res3 = single_has_successor(state, layer);
    assert(res1 == res2);
    assert(res3 == res2);
*/

#include "interactive_functions.cpp"
#include "set_trie.h"
#include "timing.h"
#include "parser.h"
#include <vector>
#include <map>
#include <set>
#include <list>
#include <cassert>
#include <stdlib.h> 
#include <string>
#include <sstream>

#include <iterator>
#include <iomanip>
#include <sstream>

// the special fake SCC node used to represent the entire subproblem - useful when using lingeling/dagster together
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

#define PRINT_STATES 0
#define PRINT_BUFFER_SIZE 0
#define PRINT_END_RESULT 0

#define ALLOW_DAGSTER 1
#define ALLOW_SINGLE 1

#define MONOLYTH_WITH_PROJECTIONS 0
#define TEST_NAL 0
#define PORTFOLIO_QUEUE 0

#if PORTFOLIO_QUEUE
#define QUEUE_TYPE PDR_Portfolio_Queue
#else
#define QUEUE_TYPE PDR_Queue
#endif



// Turning on "allow" just turne it on. Sets up the solvers, sends nogods, tracks layer info
// runtime variables say which one to use


#define VERBOSE_STATE 1


#if ALLOW_DAGSTER
#else
#if ALLOW_SINGLE
#else
 THIS WILL NOT COMPILE - need to have dagster or single allowed
#endif
#endif

using namespace std;

Cnf* get_cnf(const vector<vector<int>>& clauses) {
  Cnf* cnf = new Cnf();
  for (int i=0; i<clauses.size(); i++) {
    int array_clause[clauses[i].size()+1] = {}; // TODO delete object, scope?
    for (int j=0; j<clauses[i].size(); j++) {
      array_clause[j] = clauses[i][j];
    }
    array_clause[clauses[i].size()] = 0;
    cnf->add_clause(array_clause);
  }
  return cnf;
}

string string_float(float number) {
  stringstream stream;
  stream << fixed << setprecision(2) << number;
  return stream.str();
}

float float_time(clock_t time) {
  return ((float)time)/CLOCKS_PER_SEC;
}

class Timer {
  public:
    void start() {
      assert (start_time == 0);
      start_time = clock();
    }
    void pause() {
      stored_duration += (clock() - start_time);
      start_time = 0;
    }
    void print() {
      assert (start_time == 0);
      stringstream stream;
      stream << fixed << setprecision(5) << ((float)(stored_duration))/CLOCKS_PER_SEC;
      cout << stream.str();
    }
    clock_t stored_duration = 0;
  private:
    clock_t start_time = 0;
};

string vector_string(vector<int> state) {
  // give by copy
  string ret_val = "";
  for (int i=0; i<state.size(); i++) {
    if (state[i] > 0) {
      ret_val += "  \033[38;5;10m";
      ret_val += to_string(state[i]);
    } else {
      ret_val += " \033[38;5;9m";
      ret_val += to_string(state[i]);
    }
    ret_val += "\033[0m";
  }
  return ret_val;
}

bool in_pos_vector(int x, const vector<int>& vec) {
  return binary_search(vec.begin(), vec.end(), x);
}

vector<int> project_state_to_propositions(const vector<int>& state, const vector<int>& project_propositions) {
  auto state_current = state.begin();
  const auto state_end = state.end();
  auto project_current = project_propositions.begin();
  const auto project_end = project_propositions.end();

  assert(is_abs_sorted(state));
  assert(is_sorted(project_current, project_end));

  vector<int> result;

  while (state_current != state_end && project_current != project_end) {
    if (abs(*state_current) == *project_current) {
      result.push_back(*state_current);
      state_current++;
      project_current++;
    } else if (abs(*state_current) < *project_current) {
      state_current++;
    } else {
      assert(abs(*state_current) > *project_current);
      project_current++;
    }
  }
  return result;
}

class compressed_not_matches_reason {
  vector<int> reason;

  public:
  compressed_not_matches_reason(const vector<int>& reason) :
    reason(reason)
  {}

  bool operator()(const vector<int>& compressed_state) const {
    auto compressed_state_current = compressed_state.begin()+2;
    const auto compressed_state_end = compressed_state.end();
    auto reason_current = reason.begin();
    const auto reason_end = reason.end();

    assert(compressed_state[0] == 0); // This asserts the subproblem is 0. This is not necessary, but it is included here as a note/reminder, that this matches operator is only correct if the the subproblem of the 2 things are the same. There is a case where a reason mentions a variable outside of the state, this algorithm will read it as the state saying that lit is negative, as opposed to just not relevant.

    assert(is_sorted(compressed_state_current, compressed_state_end));
    assert(is_abs_sorted(reason));

    while (compressed_state_current != compressed_state_end && reason_current != reason_end) {
      if (*compressed_state_current == *reason_current) { // matching vars AND lits
        compressed_state_current++;
        reason_current++;
      } else if (*compressed_state_current == - *reason_current) { // opposing lits
        assert(reason_current != reason.end());
        return true;
      } else if (abs(*compressed_state_current) > abs(*reason_current)) {
        if ((*reason_current)>0) return true; // reason lit was positive, but the cstate skipped it
        else reason_current++;
      } else {
        assert(abs(*compressed_state_current) < abs(*reason_current));
        compressed_state_current++;
      }
    }
    return false;
  }
};

namespace property_directed_reachability {
  string state_string(vector<int> state);
  vector<vector<int>> BUFFER_layer_to_subproblem_to_state_count; // for use in buffer only (would be a member of buffer, but scope and position of classes)

  Timing timing;
  Timer parallel_timer;
  clock_t total_parallel_time_spent = 0;

  vector<int> initial_state;
  vector<int> goal_condition;
  vector<int> propositions;
  set<int> propositions_set;
  vector<int> actions;
  set<int> actions_set;
  int total_per_timestep;
  vector<string> symbols;
  string tmp_dir;

  int num_workers = INT_MIN;
  Lingeling* baseLingeling = NULL;

  // TODO tmp
  vector<vector<vector<vector<int>>>> worker_upper_layer_dagster_clauses_to_add;

  // at runtime, use dagster? if false use lingeling instead, ONLY ONE AT A TIME
  bool runtime_dagster = true;
  bool storing_actions = true;

  vector<int> dagster_sat_counts;
  vector<int> dagster_unsat_counts;
  int dagster_call_count = 0;
  clock_t dagster_total_time = 0;

  // setting file settings (should be integrated properly long term)
  bool project_last = true;
  bool complete_nonfinal = true;
  bool obligation_rescheduling = true;
  bool use_OOC = true; // use only_one_clique information
  bool isolate_subproblems = true;
  bool extra_settings_read = false;

  // In the case of isolate_subproblem, the subproblem we are dealing with in this instance
  int isolate_subproblems_number = -1;

  vector<vector<int>> ooc_clauses_for_every_new_solver;
  set<int> workers_to_send_to;

#if TEST_NAL
  set<int> activation_vars;
#endif

  // Dagster specific
  int num_subproblems;
  map<int, vector<int>> subproblem_to_propositions;
  map<int, vector<int>> subproblem_to_actions;
  map<int, vector<int>> subproblem_to_assumptions;
  map<int, vector<int>> subproblem_to_clause_validating_lits;

  map<int, vector<vector<int>>> subproblem_to_only_one_cliques;
  //map<int, map<int, int>> subproblem_layer_to_collating_dag_node;

  vector<int> inflate_compressed_to_full(const vector<int>& compressed_state, const vector<int>& full) {
    auto full_current = full.begin();
    const auto full_end = full.end();
    auto compressed_current = compressed_state.begin()+2;
    const auto compressed_end = compressed_state.end();
  
    assert(is_abs_sorted(full));
    assert(is_sorted(compressed_current, compressed_end));
  
    vector<int> result;
  
    while (compressed_current != compressed_end) {
      if (abs(*full_current) == *compressed_current) {
        result.push_back(*full_current);
        full_current++;
        compressed_current++;
      } else {
        result.push_back(-(*full_current));
        full_current++;
      }
    }

    while (full_current != full_end) {
      result.push_back(-(*full_current));
      full_current++;
    }

    return result;
  }

  vector<int> compress_state(const vector<int>& state, const int subproblem, const bool proper_state) {
    vector<int> result;
    result.push_back(subproblem);
    if (proper_state) result.push_back(1);
    else              result.push_back(0);
    
    for (auto it=state.begin(); it!=state.end(); it++) {
      if ((*it)>0) result.push_back(*it);
    }

    assert(is_sorted(result.begin()+2, result.end()));
    return result;
  }

  vector<int> uncompress_state(const vector<int>& compressed_state) {
    const int subproblem = compressed_state[0];
    const bool proper_state = compressed_state[1];
    if (proper_state) return inflate_compressed_to_full(compressed_state, subproblem_to_propositions[subproblem]);
    else              return inflate_compressed_to_full(compressed_state, subproblem_to_actions[subproblem]);
  }

bool subset(vector<int> a, vector<int> b) { //b is a subset of a
	set<int> a_set = set<int>(a.begin(), a.end());
	set<int> B_set = set<int>(b.begin(), b.end());
	set<int> C;
	
	std::set_difference(B_set.begin(), B_set.end(), 
	                    a_set.begin(), a_set.end(),
	                    std::inserter(C, C.begin()));

  return C.size() == 0; // 0 iff no elements ONLY in b, so b is a subset
}

class PDR_Queue {
  // TODO efficiency copying? pass by reference?
  public:
    PDR_Queue(int in_num_subproblems, int* in_obligation_rescheduling_upper_layer, bool in_performing_obligation_rescheduling) {
      num_subproblems = in_num_subproblems;
      obligation_rescheduling_upper_layer = in_obligation_rescheduling_upper_layer;
      performing_obligation_rescheduling = in_performing_obligation_rescheduling;
    }

    ~PDR_Queue() {
      for (auto ita = data.begin(); ita != data.end(); ita++) {
        for (auto itb = ita->begin(); itb != ita->end(); itb++) {
          delete *itb;
        }
      }
    }

    void helper_remove_states_matching_reason_include_layer_subproblem_specific_layer(deque<vector<int>>* specific_queue, const vector<int>& reason, const int layer, const int subproblem) {
      if(specific_queue->size() == 0)  return;

      const auto first_to_remove = stable_partition(specific_queue->begin(), specific_queue->end(), compressed_not_matches_reason(reason));

      /*
      // Just for testing
      for (auto i = specific_queue->begin(); i != first_to_remove; i++) assert(!subset(uncompress_state(*i), reason));
      for (auto i = first_to_remove; i != specific_queue->end(); i++) assert(subset(uncompress_state(*i), reason));
      */

      for (auto current = first_to_remove; current != specific_queue->end(); current++) {
        const vector<int>& compressed_state = *current;

        // remove from hash
        pair<vector<int>, int> thing1 = pair<vector<int>, int>(compressed_state, layer);
        pair<pair<vector<int>, int>, int> thing2 (thing1, subproblem); //C.G. 
        hash.erase(thing2);
        
        // Add state back at at the next layer if applicable.
        if (performing_obligation_rescheduling) {
          if (layer < *obligation_rescheduling_upper_layer) {
            push(uncompress_state(compressed_state), layer+1, subproblem);
          }
        }
      }

      // remove from data specific_queue
      const int num_states_to_remove = (specific_queue->end() - first_to_remove); // ASSUMING THAT IS HOW THIS WORKS
      for (int i=0; i<num_states_to_remove; i++) specific_queue->pop_back();
      assert(first_to_remove == specific_queue->end());
      //cout << "TODO! reschedule this obligation when appropriate" << endl;
      //cout << "TODO! make sure when removing based off reason, it is doing it to all layers less than also" << endl;
    }

    void remove_states_matching_reason_layer_subproblem(const vector<int>& reason, const int max_layer, const int subproblem) {
      for (int layer=0;layer<max_layer;layer++){
        make_layer_exist(layer);
        assert(is_abs_sorted(reason));

        //data[layer][subproblem]->remove_if(compressed_matches_reason(reason));
        helper_remove_states_matching_reason_include_layer_subproblem_specific_layer(data[layer][subproblem], reason, layer, subproblem);

        // record that it was removed
        if (data[layer][subproblem]->size() == 0) {
          available_layers_subproblems[layer].erase(subproblem);
          if (available_layers_subproblems[layer].size() == 0) {
            available_layers.erase(layer);
          }
        }

        // if nonfinal subproblem do same for final
        const int final_subproblem = PDR::num_subproblems-1;
        if (subproblem != final_subproblem) {
          //data[layer][final_subproblem]->remove_if(compressed_matches_reason(reason));
          helper_remove_states_matching_reason_include_layer_subproblem_specific_layer(data[layer][final_subproblem], reason, layer, subproblem);

          // record that it was removed
          if (data[layer][final_subproblem]->size() == 0) {
            available_layers_subproblems[layer].erase(final_subproblem);
            if (available_layers_subproblems[layer].size() == 0) {
              available_layers.erase(layer);
            }
          }
        }
      }
    }

    void remove_subproblem(int subproblem) {
      debug_removed_subproblems.insert(subproblem);
      for (int layer = 0; layer < data.size(); layer++) {
        if (data[layer][subproblem]->size()) {
          assert(available_layers_subproblems[layer].find(subproblem) != available_layers_subproblems[layer].end());
          available_layers_subproblems[layer].erase(subproblem);
          if (available_layers_subproblems[layer].size() == 0) {
            available_layers.erase(layer);
          }
        }
        data[layer][subproblem]->clear();
      }
      if (active_subproblems.find(subproblem) != active_subproblems.end()) active_subproblems.erase(subproblem);
    }

    void make_layer_exist(int layer) {
      while (data.size() <= layer) {
        vector<deque<vector<int>>*> subproblems_stacks;
        for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
          deque<vector<int>>* stack = new deque<vector<int>>();
          subproblems_stacks.push_back(stack);
        }
        data.push_back(subproblems_stacks);
        available_layers_subproblems.push_back(set<int>());
      }
    }

    bool empty_for_subproblem(const int subproblem) {
      if (subproblem == PDR::num_subproblems-1) {
        if (get<0>(contemplated_monolyth).size() != 0) return false;
      }
      for (int layer=0; layer<data.size(); layer++) {
        if (data[layer][subproblem]->size()) return false;
      }
      return true;
    };

    bool empty(){
      return (available_layers.size() == 0) && (get<0>(contemplated_monolyth).size() == 0);
      //return (available_layers.size() == 0);
    }

    int get_next_layer() {
      assert(available_layers.size());
      return *(available_layers.begin());
    }

    int get_next_subproblem_from_layer(int layer) {
      assert(available_layers_subproblems[layer].size());
      return *(available_layers_subproblems[layer].begin());
    }

    tuple<vector<int>, int, int> get_next_state(){
      return get_next_state(true);
    }

    tuple<vector<int>, int, int> get_next_state(bool back){
      const int layer = get_next_layer();
      return get_next_state_layer(layer, back);
    }

    tuple<vector<int>, int, int> get_next_state_layer(int layer, bool back){
      const int subproblem = get_next_subproblem_from_layer(layer);
      return get_next_state_layer_subproblem(layer, subproblem, back);
    }

    tuple<vector<int>, int, int> get_next_state_layer_subproblem(int layer, int subproblem, bool back){
      // checks
      assert(!empty());
      assert(available_layers_subproblems[layer].size());
      assert(data[layer][subproblem]->size());

      // get state
      vector<int> state;
      if (back) {
        const vector<int>& compressed_state = *(data[layer][subproblem]->rbegin()); 

        state = uncompress_state(compressed_state);
	
        pair<vector<int>, int> thing1 = pair<vector<int>, int>(compressed_state, layer);
        pair<pair<vector<int>, int>, int> thing2 (thing1, subproblem); //C.G. 
        hash.erase(thing2);
	
        data[layer][subproblem]->pop_back();
      } else {
        const vector<int>& compressed_state = *(data[layer][subproblem]->begin()); 

        state = uncompress_state(compressed_state);
	
        pair<vector<int>, int> thing1 = pair<vector<int>, int>(compressed_state, layer);
        pair<pair<vector<int>, int>, int> thing2 (thing1, subproblem);
        hash.erase(thing2);
	
        data[layer][subproblem]->pop_front();
      }

      // record that it was removed
      if (data[layer][subproblem]->size() == 0) {
        available_layers_subproblems[layer].erase(subproblem);
        if (available_layers_subproblems[layer].size() == 0) {
          available_layers.erase(layer);
        }
      }

      return tuple<vector<int>, int, int> (state, layer, subproblem);
    }

#if MONOLYTH_WITH_PROJECTIONS
    void monolyth_succeeded() {
      // The monolyth succeeded, so drop it
      contemplated_monolyth = tuple<vector<int>, int, int>(vector<int>(), 0, 0);
    }
#else
    void a_top_projection_failed() {
      // register that a projection failed
      
      const vector<int>& state = get<0>(contemplated_monolyth);
      const int layer = get<1>(contemplated_monolyth);
      const int subproblem = get<2>(contemplated_monolyth);

      if (state.size()) {
        if (PDR::obligation_rescheduling) {
          if (layer < *obligation_rescheduling_upper_layer) {
            assert(subproblem == PDR::num_subproblems-1);
            push(state, layer+1, subproblem);
          }
        }
      }

      contemplated_monolyth = tuple<vector<int>, int, int>(vector<int>(), 0, 0);
    }
#endif

    // state subroblem layer reduce keep_state
    vector<tuple<vector<int>, int, int, bool, bool>> get_projections_of_top_or_top_itself() {
      // get the top state and return all of its projections. OR if have already done this, return the top itself
      assert(!empty());

      vector<tuple<vector<int>, int, int, bool, bool>> ret_val;

      // first check if there is a valid contemplated_monolyth
      if (get<0>(contemplated_monolyth).size()) {
        // there is so just return that
        const tuple<vector<int>, int, int>& X = contemplated_monolyth;
        ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(get<0>(X), get<1>(X), get<2>(X), true, true));
        //ret_val.push_back(contemplated_monolyth);
        contemplated_monolyth = tuple<vector<int>, int, int>(vector<int>(), 0, 0);
      } else {
        // get the next top state, which for the current setup has to be the final subproblem
        // Try find one, with the current setup have to loop through layers
        const int wanted_subproblem = PDR::num_subproblems-1;
        bool found_a_final_state = false;
        for (int layer=0; layer<data.size(); layer++) {
          if (data[layer][wanted_subproblem]->size()) {
            contemplated_monolyth = get_next_state_layer_subproblem(layer, wanted_subproblem, true);
            found_a_final_state = true;
            break;
          }
        }
        if (!found_a_final_state) {
          assert(ret_val.size() == 0);
          return ret_val;
        }
        const vector<int>& state = get<0>(contemplated_monolyth);
        const int layer = get<1>(contemplated_monolyth);
        const int subproblem = get<2>(contemplated_monolyth);
        
        assert(subproblem == PDR::num_subproblems-1);

        for (int subproblem=0; subproblem<PDR::num_subproblems-1; subproblem++) {
          const vector<int>& projected_state = project_state_to_propositions(state, PDR::subproblem_to_propositions[subproblem]);
          //const vector<int>& projected_state = state;
          ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(projected_state, layer, subproblem, true, false));
          //ret_val.push_back(tuple<vector<int>, int, int, bool>(state, layer, subproblem));
          //cout << "i: " << layer << " considering state: " << PDR::pos_state_string(projected_state) << endl;
          //cout << "adding to buffer " << subproblem  << endl;
        }

#if MONOLYTH_WITH_PROJECTIONS
        const tuple<vector<int>, int, int>& X = contemplated_monolyth;
        ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(get<0>(X), get<1>(X), get<2>(X), false, true));
#endif
      }

      return ret_val;
    }

    vector<tuple<vector<int>, int, int, bool, bool>> get_states_each_nonfinal_subproblem() {
      // Try get one from each subproblem
      //assert(!empty());

      vector<tuple<vector<int>, int, int, bool, bool>> ret_val;

      for (auto it=active_subproblems.begin(); it!=active_subproblems.end(); it++) {
        const int subproblem = *it;
        if (subproblem == PDR::num_subproblems-1) continue;
        // a layer exists with this subproblem, find it
        for (int layer=0; layer<data.size(); layer++) {
          if (data[layer][subproblem]->size()) {
            const tuple<vector<int>, int, int>& X = get_next_state_layer_subproblem(layer, subproblem, true);
            ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(get<0>(X), get<1>(X), get<2>(X), true, true));
            break;
          }
        }
      }
      return ret_val;
    }

    vector<tuple<vector<int>, int, int, bool, bool>> get_states_priority_lower(int num_states) {
      assert(!empty());
      assert(num_states);

      vector<tuple<vector<int>, int, int, bool, bool>> ret_val;
      // prioritize lower layers

      set<int> available_layers_copy = available_layers; /*Set of all the layers with something in them. */
      assert(available_layers_copy.size());
      // Note Charles had this loop split so "auto it" was on its own line. Don't know why
      for (auto it = available_layers_copy.begin(); it != available_layers_copy.end(); it++) {
        const int layer = *it;
        // This used to actually be half the remaining states, then would go back and back. By removing the "/2" it makes it greedy
        const int num_wanted_states_now = (num_states - ret_val.size());
        bool back = true;
        for (int i=0; i<num_wanted_states_now; i++) {
          if (available_layers.find(layer) != available_layers.end()) { 
          //if (clean_is_available_layer(layer, back)) { // This was removed, I believe because it was expensive
            const tuple<vector<int>, int, int>& X = get_next_state_layer(layer, back); // This has been broken into 2 lines, because there are inconsistent return types
            ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(get<0>(X), get<1>(X), get<2>(X), true, true));
          } else break;
          back = !back;
        }
        // Charles's way of doing this
        if (it == available_layers_copy.begin()) break;
      }
      while ((ret_val.size() != num_states) && (!empty())) {
        const tuple<vector<int>, int, int>& X = get_next_state();
        ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(get<0>(X), get<1>(X), get<2>(X), true, true));
      }
      return ret_val;
    }

    vector<tuple<vector<int>, int, int, bool, bool>> get_states_uniform(int num_states) {
      assert(!empty());
      assert(num_states);

      vector<tuple<vector<int>, int, int, bool, bool>> ret_val;

      // next try get from each layer
      set<int> available_layers_copy = available_layers;
      const int ideal_from_each_layer = num_states/available_layers_copy.size();
      for (auto it = available_layers_copy.begin(); it != available_layers_copy.end(); it++) {
        bool back = true;
        const int layer = *it;

        for (int wanted_state=0; wanted_state<ideal_from_each_layer; wanted_state++) {
          if (ret_val.size() == num_states) break;
          //if (clean_is_available_layer(layer, back)) {
          if (available_layers.find(layer) != available_layers.end()) { 
            const tuple<vector<int>, int, int>& X = get_next_state_layer(layer, back);
            ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(get<0>(X), get<1>(X), get<2>(X), true, true));
            back = !back;
          } else break;
        } 

        if (ret_val.size() == num_states) return ret_val;
      }

      // then fill just from the front
      while (ret_val.size() < num_states) {
        if ((!empty())) {
          const tuple<vector<int>, int, int>& X = get_next_state();
          ret_val.push_back(tuple<vector<int>, int, int, bool, bool>(get<0>(X), get<1>(X), get<2>(X), true, true));
        }
        else break;
      }
      assert(ret_val.size() <= num_states);
      return ret_val;
    }

    void push(const vector<int>& state, int layer, int subproblem){
      const vector<int>& compressed_state = compress_state(state, subproblem, true);
      pair<vector<int>, int > thing1 = pair<vector<int>, int >(compressed_state,layer); // C.G. added 'hash blocker' here
      pair< pair<vector<int>, int >, int > thing2 = pair<pair<vector<int>, int >, int> (thing1,subproblem);
      if (hash.find(thing2) != hash.end())  return;
      hash.insert(thing2);

      max_layer_ever = max(max_layer_ever, layer);
      make_layer_exist(layer);

      assert(debug_removed_subproblems.find(subproblem) == debug_removed_subproblems.end());
      assert(data.size()>layer);
      assert(data[layer].size()>subproblem);

      active_subproblems.insert(subproblem);
      available_layers.insert(layer);
      available_layers_subproblems[layer].insert(subproblem);
      data[layer][subproblem]->push_back(compressed_state);
    }

    void print_size() {
      cout << "queue size:" << endl;
      for (int layer=0; layer <= max_layer_ever; layer++) {
        cout << "layer " << layer << endl;
        for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
          cout << "  subproblem " << subproblem << ": " << data[layer][subproblem]->size() << endl;
        }
      }
    }

    int size() {
      // WARNING expensive
      int count = 0;
      for (int layer=0; layer<=max_layer_ever; layer++) {
        for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
          count += data[layer][subproblem]->size();
        }
      }
      return count;
    }

    tuple<vector<int>, int, int> contemplated_monolyth = tuple<vector<int>, int, int>(vector<int>(), 0, 0);
  private:
    int* obligation_rescheduling_upper_layer = NULL;
    bool performing_obligation_rescheduling; 
    int num_subproblems = -1;
    int max_layer_ever = -1;
    //vector<vector<Set_Trie>>* reasons;
    vector<vector<deque<vector<int>>*>> data; // subproblem to layer to deque of compressed states
    set<pair<pair<vector<int>, int>, int>> hash;
    set<int> available_layers;
    vector<set<int>> available_layers_subproblems;
    set<int> debug_removed_subproblems;
    set<int> active_subproblems;
};

class PDR_Portfolio_Queue {
  public:
    PDR_Portfolio_Queue(int in_num_subproblems, int* in_obligation_rescheduling_upper_layer, bool in_performing_obligation_rescheduling, int in_num_workers) {
      num_workers = in_num_workers;
      worker_queues.push_back(NULL);

      for (int i=0; i<num_workers; i++) {
        worker_queues.push_back(new PDR_Queue(in_num_subproblems, in_obligation_rescheduling_upper_layer, in_performing_obligation_rescheduling));
      }
    }

    ~PDR_Portfolio_Queue() {
      while (worker_queues.size()>1) { // as the first is a null pointer
        delete *worker_queues.rbegin();
        worker_queues.pop_back();
      }
      worker_queues.pop_back();
    }

    void push(const vector<int>& state, int layer, int subproblem, int worker){
      worker_queues[worker]->push(state, layer, subproblem);
      assert(!worker_queues[worker]->empty());
    }

    void remove_states_matching_reason_layer_subproblem(const vector<int>& reason, const int max_layer, const int subproblem) {
      //cout << "WARN NOT REMOVING MATCHING (and clause pushing)" << endl;
      for (int worker=1; worker<num_workers+1; worker++) {
        worker_queues[worker]->remove_states_matching_reason_layer_subproblem(reason, max_layer, subproblem);
      }
    }

    bool empty() {
      // say empty iff all empty
      for (int worker=1; worker<num_workers+1; worker++) {
        if (!worker_queues[worker]->empty()) return false;
      }
      return true;
    }

    vector<tuple<vector<int>, int, int, int, bool, bool>> pop(const set<int>& free_workers) {
      vector<tuple<vector<int>, int, int, int, bool, bool>> ret_val;
      // Get top single from each constituent

      for (auto it=free_workers.begin(); it!=free_workers.end(); it++) {
        const int worker = *it; 
        assert(worker > 0);
        if (!worker_queues[worker]->empty()) {
          //cout << "not empty " << worker << endl;

          const vector<tuple<vector<int>, int, int, bool, bool>>& queue_elements = worker_queues[worker]->get_states_priority_lower(1);
          assert(queue_elements.size() == 1);

          const tuple<vector<int>, int, int, bool, bool>& X = *queue_elements.begin();
          const vector<int>& s = get<0>(X);
          const int i = get<1>(X);
          const int subproblem = get<2>(X);
          const bool reduce = get<3>(X);
          const bool keep_state = get<4>(X);

          ret_val.push_back(tuple<vector<int>, int, int, int, bool, bool>(s, i, subproblem, worker, reduce, keep_state));

        } //else cout << "empty " << worker << endl;
      }
      //cout << "pop " << ret_val.size() << " ";
      return ret_val;
    }

    bool empty_for_subproblem(int subproblem) {
      // say empty iff all empty
      for (int worker=1; worker<num_workers+1; worker++) {
        if (!worker_queues[worker]->empty_for_subproblem(subproblem)) return false;
      }
      return true;
    }

    void remove_subproblem(int subproblem) {
      exit(3);
    }

    void a_top_projection_failed() {
      exit(4);
    }

    void print_size() {
      for (int worker=1; worker<num_workers+1; worker++) {
        cout << "queue size worker: " << worker << endl;
        worker_queues[worker]->print_size();
      }
    }

  private:
    int num_workers;
    vector<PDR_Queue*> worker_queues;
};

  bool state_conforms_to_only_one_cliques(vector<int> state, const int subproblem){
    sort(state.begin(), state.end());
    const vector<vector<int>>& cliques = subproblem_to_only_one_cliques[subproblem];
    for (auto it=cliques.begin(); it!=cliques.end(); it++) {
      vector<int> clique = *it;
      sort(clique.begin(), clique.end());
      vector<int> intersection; 
      set_intersection(state.begin(),state.end(),clique.begin(),clique.end(), std::back_inserter(intersection));
      assert(intersection.size() <= 1); // if 2 or more, then the clique is wrong
      if (intersection.size() == 0) return false;
    }
    return true;
  }

  void BUFFER_print_state_count() {
    cout << "S \\ L";
    for (int layer=0; layer < PDR::BUFFER_layer_to_subproblem_to_state_count.size(); layer++) {
      cout << "\t" << layer;
    }
    cout << endl;

    for (int subproblem=0; subproblem < PDR::num_subproblems; subproblem++) {
      cout << subproblem;
      for (int layer=0; layer < PDR::BUFFER_layer_to_subproblem_to_state_count.size(); layer++) {
        cout << "\t" << PDR::BUFFER_layer_to_subproblem_to_state_count[layer][subproblem];
      }
      cout << endl;
    }
  }

  bool state_print_comp(int i,int j) { 
#if VERBOSE_STATE
    if (abs(i) < symbols.size() && abs(j) >= symbols.size()) return true;
    else if (abs(i) >= symbols.size() && abs(j) < symbols.size()) return false;
    else if (abs(i) >= symbols.size() && abs(j) >= symbols.size()) return abs(i)<abs(j);
    return symbols[abs(i)]<symbols[abs(j)];
#else
    return abs(i)<abs(j); 
#endif
  }

#if VERBOSE_STATE
  string pos_state_string(vector<int> state) {
    // give by copy
    string ret_val = "";
    sort(state.begin(), state.end(), state_print_comp);
    for (int i=0; i<state.size(); i++) {
      if (state[i] > 0) {
        ret_val += "  \033[38;5;10m";
        if (state[i] < symbols.size())                           ret_val += symbols[state[i]];
        else if (state[i] - total_per_timestep < symbols.size()) ret_val += "*" + symbols[state[i] - total_per_timestep];
        else                                                     ret_val += to_string(state[i]);
      }
      ret_val += "\033[0m";
    }
    return ret_val;
  }
#else
  string pos_state_string(vector<int> state) {
    // give by copy
    string ret_val = "";
    sort(state.begin(), state.end(), state_print_comp);
    for (int i=0; i<state.size(); i++) {
      if (state[i] > 0) {
        ret_val += "  \033[38;5;10m";
        ret_val += to_string(state[i]);
      }
      ret_val += "\033[0m";
    }
    return ret_val;
  }
#endif

#if VERBOSE_STATE
  string state_string(vector<int> state) {
    // give by copy
    string ret_val = "";
    sort(state.begin(), state.end(), state_print_comp);
    for (int i=0; i<state.size(); i++) {
      if (state[i] > 0) {
        ret_val += "  \033[38;5;10m";
        if (state[i] < symbols.size())                           ret_val += symbols[state[i]];
        else if (state[i] - total_per_timestep < symbols.size()) ret_val += "*" + symbols[state[i] - total_per_timestep];
        else                                                     ret_val += to_string(state[i]);
      } else {
        ret_val += " \033[38;5;9m-";
        //ret_val += symbols[-state[i]];
        if (abs(state[i]) < symbols.size())                           ret_val += symbols[-state[i]];
        else if (abs(state[i]) - total_per_timestep < symbols.size()) ret_val += "*" + symbols[-state[i] - total_per_timestep];
        else                                                          ret_val += to_string(-state[i]);
      }
      ret_val += "\033[0m";
    }
    return ret_val;
  }
#else
  string state_string(vector<int> state) {
    // give by copy
    string ret_val = "";
    sort(state.begin(), state.end(), state_print_comp);
    for (int i=0; i<state.size(); i++) {
      if (state[i] > 0) {
        ret_val += "  \033[38;5;10m";
        ret_val += to_string(state[i]);
      } else {
        ret_val += " \033[38;5;9m";
        ret_val += to_string(state[i]);
      }
      ret_val += "\033[0m";
    }
    return ret_val;
  }
#endif

  string state_string(set<int> state) {return state_string(vector<int>(state.begin(), state.end()));}

  string str(vector<vector<int>> x) {
    string s = "";
    for (auto it=x.begin(); it!=x.end(); it++) {
      s += state_string(*it) + "\n"; 
    }
    return s;
  }

  string str(set<vector<int>> x) {
    string s = "";
    for (auto it=x.begin(); it!=x.end(); it++) {
      s += state_string(*it) + "\n"; 
    }
    return s;
  }

  int tilde_lit(int lit, int amount) {
    assert(lit != 0);
    if (lit > 0) return lit + amount * total_per_timestep;
    else         return lit - amount * total_per_timestep;
  }

  vector<int> get_clause_from_reason(const vector<int>& reason, const int subproblem) {
    vector<int> clause;
    for (int i=0; i<reason.size(); i++){
      clause.push_back(-PDR::tilde_lit(reason[i], 1));
    }
    for (int i=0; i<subproblem_to_clause_validating_lits[subproblem].size(); i++) {
      clause.push_back(subproblem_to_clause_validating_lits[subproblem][i]);
    }
    return clause;
  }

  int get_reason_scc_node(const vector<int>& reason);

  vector<int> project_state_to_only_one_mutex_cliques(const vector<int>& state, const int subproblem) {
    cout << "WARNING - seems to be slow" << endl;
    // assume this is a consistent state, so for each 
    // assume cliques are disjoint
    set<int> props_to_remove;
    const vector<vector<int>>& cliques = subproblem_to_only_one_cliques[subproblem];
    for (auto it=cliques.begin(); it!=cliques.end(); it++) {
      const vector<int>& clique = *it; 
      const vector<int>& projected = project_state_to_propositions(state, clique);
      vector<int> intersection;
      for(int i=0; i<projected.size(); i++) {
        if (projected[i]>0) intersection.push_back(projected[i]);
      }
      //cout << "state:" << state_string(state) << endl;
      //cout << "clique:" << state_string(clique) << endl;
      assert(intersection.size() <= 1);
      if (intersection.size() == 1) {
        const int prop_to_remove = intersection[0];
        props_to_remove.insert(prop_to_remove);
      }
    }

    vector<int> projected_state;
    for (auto it=state.begin(); it!=state.end(); it++) {
      if (props_to_remove.find(*it) == props_to_remove.end()) {
        projected_state.push_back(*it);
      }
    }
    return projected_state;
  }

  // Class for tracking which actions lead to which states
  class State_Actions {
    public:
      void set_final_state(const vector<int>& state, const int in_subproblem) {
        final_state = state;
        subproblem = in_subproblem;
        assert(subproblem == PDR::num_subproblems-1); // should be the last one
      }

      //void add_state(const vector<int>& succ_state, const vector<int>& prev_state, const vector<int>& actions, int succ_state_layer) {
      void add_state(const vector<int>& succ_state, const vector<int>& prev_state, const vector<int>& actions, const int state_subproblem, const int succ_state_layer) {
        // TODO consider loops and minimal length paths?
        // Only add if not seen before
        const vector<int>& compressed_prev_state = PDR::compress_state(prev_state, state_subproblem, true);
        const vector<int>& compressed_succ_state = PDR::compress_state(succ_state, state_subproblem, true);
        const vector<int>& compressed_actions    = PDR::compress_state(actions, state_subproblem, false);

        assert(succ_state.size() == prev_state.size());
        if(data.find(compressed_succ_state) == data.end()) {
          data[compressed_succ_state] = tuple<vector<int>, vector<int>, int> (compressed_prev_state, compressed_actions, succ_state_layer);
        } else {
          const auto a = data.find(compressed_succ_state);
          const auto b = a->second;
          const int existing_layer = get<2>(b);
          if (existing_layer > succ_state_layer) {
            // This one is closer, so add
            data[compressed_succ_state] = tuple<vector<int>, vector<int>, int> (compressed_prev_state, compressed_actions, succ_state_layer);
          } else {
            if (WARNINGS) cout << "ALREADY REGISTERED FOR STATE" << state_string(succ_state) << endl; // TODO investigate the order here
          }
        }
      }

      void remove_state(const vector<int>& succ_state) {
        cout << "PROBLEMATIC!" << endl;
        data.erase(succ_state);
      }
      
      void write_empty_plan() {
        ofstream plan_file;
        if (PDR::isolate_subproblems) plan_file.open(tmp_dir + "/partial_plan" + to_string(PDR::isolate_subproblems_number));
        else                          plan_file.open(tmp_dir + "/plan");
        plan_file.close();
      }

      void print_write_path(const vector<int>& final_state, int subproblem) {
        if (PRINT_END_RESULT) cout << "WRITING PLAN" << endl;
        ofstream plan_file;
        if (PDR::isolate_subproblems) plan_file.open(tmp_dir + "/partial_plan" + to_string(PDR::isolate_subproblems_number));
        else                          plan_file.open(tmp_dir + "/plan");

        set<vector<int>> seen_compressed_states; // just to check for loops

        vector<int> compressed_succ_state;
        vector<int> compressed_prev_state = compress_state(final_state, subproblem, true);
        vector<int> compressed_actions_executed;
        vector<vector<int>> backwards_plan;
        assert(subproblem == num_subproblems-1); // assume the plan we care about is the last/special one
        const vector<int> compressed_projected_initial_state = compress_state(project_state_to_propositions(initial_state, subproblem_to_propositions[subproblem]), subproblem, true);
        do {
          assert(seen_compressed_states.find(compressed_prev_state) == seen_compressed_states.end());
          seen_compressed_states.insert(compressed_prev_state);

          compressed_succ_state = compressed_prev_state;

          assert(data.find(compressed_succ_state) != data.end()); // Assert the map access will work

          const tuple<vector<int>, vector<int>, int> X = data[compressed_succ_state];
          compressed_prev_state = get<0>(X);
          compressed_actions_executed = get<1>(X);
          const int succ_state_layer = get<2>(X);
          backwards_plan.push_back(uncompress_state(compressed_actions_executed));
        } while (compressed_prev_state != compressed_projected_initial_state); // if the previous state is not the initial state go again

        vector<int> actions_executed;
        if (PRINT_END_RESULT) cout << endl;
        int planstep = 0;
        for(int backstep=backwards_plan.size()-1; backstep>=0; backstep--) {
          actions_executed = backwards_plan[backstep];
          for(int i=0; i<actions_executed.size(); i++) {
            if (actions_executed[i]>0) {
              string symbol = symbols[actions_executed[i]];
              for (int j=0; j<= symbol.size(); j++) {
                if (symbol[j] == '(' || symbol[j] == ',') symbol[j] = ' ';
              }
              if (PRINT_END_RESULT) cout      << planstep << " : (" << symbol << endl;
              plan_file << planstep << " : (" << symbol << "\n";
              planstep++;
            }
          }
        }
        plan_file.close();
        if (PRINT_END_RESULT) cout << "FINISHED WRITING PLAN" << endl;
      }

      void print_write_path_final_state() {
        if ((final_state.size() == 0) && subproblem == -1) write_empty_plan();
        else                                               print_write_path(final_state, subproblem);
      }

      // Map from states -> previous_state, actions
      map<vector<int>, tuple<vector<int>, vector<int>, int > > data;
    private:
      vector<int> final_state;
      int subproblem = -1;
  };

  State_Actions state_actions;

  // Layer objects
  class Layers {
    public:
      // A direct implementation - one for each layer type
      virtual void solver_add_reason(const vector<int>& reason, int layer, int subproblem)=0; 
      virtual void make_layer_exist(int layer)=0;

      void print_reasons_size() {
        cout << "Layer reasons sizes:" << endl;
        for (int layer=0; layer<reasons.size(); layer++) {
          cout << "Layer: " << layer;
          if (num_subproblems != 1) cout << endl;
          for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
            int reason_size_sum = 0;
            const set<vector<int>>& all = reasons[layer][subproblem].get_all();
            for (auto it = all.begin(); it != all.end(); it++) {
              reason_size_sum += it->size();
            }
            cout << "  Subproblem: " << subproblem << " [" << reasons[layer][subproblem].size() << "] avg size: " << string_float(reason_size_sum/((all.size() + 0.0000001))) << endl;
          }
        }
      }

      void print_reasons() {
        cout << "Layer reasons:" << endl;
        for (int layer=0; layer<reasons.size(); layer++) {
          cout << "Layer: " << layer << endl;
          for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
            cout << "  Subproblem: " << subproblem << " [" << reasons[layer][subproblem].size() << "]" << endl;
            const set<vector<int>>& all = reasons[layer][subproblem].get_all();
            for (auto it = all.begin(); it != all.end(); it++) {
              cout << "    " << state_string(*it) << endl;
            }
          }
        }
      }

      void check() {
        //print_reasons();
        cout << "CHECKING LAYERS" << endl;
        // some checks on the consistency of the reasons
        // each clause should only be in one layer
        vector<vector<set<vector<int>>>> layer_subproblem_reasons = vector<vector<set<vector<int>>>>(reasons.size());
        assert(layer_subproblem_reasons.size() == reasons.size());
        for (int layer=0; layer<reasons.size(); layer++) {
          layer_subproblem_reasons[layer] = vector<set<vector<int>>>(num_subproblems);
          for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
            layer_subproblem_reasons[layer][subproblem] = reasons[layer][subproblem].get_all();
          }
        }

        for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
          for (int layer=0; layer<reasons.size(); layer++) {
            set<vector<int>> X = layer_subproblem_reasons[layer][subproblem];
            for (auto it=X.begin(); it!=X.end(); it++) {
              vector<int> reason = *it;
              for (int check_layer=layer+1; check_layer<reasons.size(); check_layer++) {
                // see if this reason has been repeated
                cout << "check layer " << check_layer << endl;
                cout << "layer subprob size " << layer_subproblem_reasons.size() << endl;
                cout << "reasons.size()" << reasons.size() << endl;
                assert(layer_subproblem_reasons.size() > check_layer);
                assert(layer_subproblem_reasons[check_layer].size() > subproblem);
                for (auto itb=layer_subproblem_reasons[check_layer][subproblem].begin(); itb!=layer_subproblem_reasons[check_layer][subproblem].end(); itb++) {
                  vector<int> comparison_reason = *itb;
                  cout << "checking layers " << layer << " -> " << check_layer << " : " << state_string(reason) << endl;
                  assert(reason != comparison_reason);
                }
              }
            }
          }
        }
        cout << "END CHECKING LAYERS" << endl;
      }

      void add_reason(const vector<int>& reason, int layer, int subproblem){
        // TODO don't check layer 0
        // check all reason vars are propositions

        for (int i=0; i<reason.size(); i++){
          assert(propositions_set.find(abs(reason[i])) != propositions_set.end());
        }

        assert(layer<reasons.size());

        // check if weaker than a clause in the current layer - then drop the clause (should be rare?..)
        if(LOUD && layer == 0) cout << "layer 0, this should only be for goal lits!" << endl;
        if(LOUD) cout << "add_reason layer " << layer << " , reason: " << state_string(reason) << endl;
        // TODO check for subsumption both ways, along the way

        // check if stronger than a clause in the current layer  AND all previous layers. if so, remove ALL the weaker ones

        // Can cheaply check if it is a weaker clause - and avoid adding. Hard to check if a stronger clause
        // So if it is a stronger clause, just add as if new

        // If a lower layer has this clause, remove it from that and add it here

        if (reason.size() == 1 && layer == 0) {
          //cout << "needed?" << endl;
          if(LOUD) cout << "special for goal lits, adding directly" << endl;
          reasons[layer][subproblem].insert(reason);
          solver_add_reason(reason, layer, subproblem);
          return;
        }

        if(LOUD) cout << "check if adding clause stronger" << endl;

        for (int check_layer = 0; check_layer < layer; check_layer++) {
          if (reasons[check_layer][subproblem].contains_remove(reason)) {
            reasons[layer][subproblem].insert(reason);
            solver_add_reason(reason, layer, subproblem);
            return;
          }
        }

        if(LOUD) cout << "check if adding clause weaker" << endl;
        // TODO inneficient - investigate

        // if this, or a stronger reason is already registered at this or a higher layer, don't add
        for (int check_layer = layer; check_layer < reasons.size(); check_layer++) {
          if (reasons[check_layer][subproblem].contains_subset(reason)) return;
        }

        if(LOUD) cout << "new clause so adding it directly" << endl;

        // If a new clause add it here
        reasons[layer][subproblem].insert(reason);
        solver_add_reason(reason, layer, subproblem);
      }

      set<vector<int>> get_reasons_not_in_next_layer(int layer, int subproblem) {
        return reasons[layer][subproblem].get_all();
      }

      bool same_as_previous(int nextLayer, set<int> subproblems_to_check) {
        const int layer = nextLayer - 1; // the layer to test if there is nothing here that is not in the next layer
        assert(layer >= 0);
        assert(layer < reasons.size());

        /*
        for (auto it=subproblems_to_check.begin(); it!=subproblems_to_check.end(); it++) {
          cout << "reasons, layer, subproblem size(): " << layer << " " << *it << " : " << reasons[layer][*it].size() << endl;
        }
        */

        if (subproblems_to_check.find(PDR::num_subproblems-1) != subproblems_to_check.end()) {
          // has the final subproblem, a bit hacky, special case when only this one
          assert(subproblems_to_check.size() == 1);
          
          // as is the final, need ALL to be empty to declare the same
          for (int subproblem=0; subproblem<PDR::num_subproblems; subproblem++) {
            if (reasons[layer][subproblem].size()) return false;
          }
          return true;
        } else {
          // if any of the ones to check are empty, then that subproblem is unsat, so the whole problem is unsat 
          for (auto it=subproblems_to_check.begin(); it!=subproblems_to_check.end(); it++) {
            cout << "checking (layer, subproblem) (" << layer << "," << *it << ")" << endl;
            if (reasons[layer][*it].size() == 0) return true;
          }
          return false;
        }

        /*
        for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
          if (completed_subproblems.find(subproblem) == completed_subproblems.end()) {
            if (reasons[layer][subproblem].size()) return false;
          }
        }
        return true;
        */
      }

      int get_first_empty_layer() {
        // TODO inconsistent use of iterators
        for (int layer = 0; layer < reasons.size(); layer++) {
          bool empty_layer = true;
          for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
            if (reasons[layer][subproblem].size()) {
              empty_layer = false;
              break;
            }
          }
          if (empty_layer) return layer;
        }
        // none of the layers so far are empty
        return reasons.size(); // the index of the next layer
      }

      void push_nonfinal_up_to_layer(int desired_just_empty_layer) {
        cout << "push_nonfinal_up_to_layer" << endl;
        // make sure THIS layer is empty, but the one directly under is not (unless it is a completely empty subproblem)
        // uses manual enumerate then push (as opposed to some more direct efficient method)
        map<int, int> subproblem_to_first_empty_layer;
        int max_empty_layer = -1; // DEBUg to make sure input matches

        for (int subproblem=0; subproblem<num_subproblems-1; subproblem++) {
          cout << "subproblem " << subproblem << endl;
          // find the first empty layer
          int empty_layer = INT_MIN;
          for (int layer = 0; layer < reasons.size(); layer++) {
            if (reasons[layer][subproblem].size()) empty_layer = INT_MIN;
            else {
              if (empty_layer == INT_MIN) empty_layer = layer;
            }
          }
          if (empty_layer == INT_MIN) empty_layer = reasons.size();
          max_empty_layer = max(max_empty_layer, empty_layer);

          // with that first empty layer, work out the difference for how much to push up
          const int difference = desired_just_empty_layer - empty_layer;
          if (difference) {
            // move up everythong by that distance, starting from the top
            cout << "desired empty layer: " << desired_just_empty_layer << endl;
            cout << "empty layer: " << empty_layer << endl;
            for (int layer=empty_layer; layer>=0; layer--) {
              const int destination_layer = layer + difference;
              cout << "pushing " << layer << " to " << destination_layer << endl;
              const set<vector<int>>& all_reasons = reasons[layer][subproblem].get_all();
              for (auto it=all_reasons.begin(); it!=all_reasons.end(); it++) {
                const vector<int>& reason = *it;
                add_reason(reason, destination_layer, subproblem);
              }
            }
          }
        }
        assert(max_empty_layer == desired_just_empty_layer);
      }

      vector<vector<Set_Trie>> reasons; // the REASONS that are unique in this layer
    //protected:
  };

  class Dagster_Layers : public Layers {
    public:
      void make_layer_exist(int layer) {
        while (reasons.size() < layer + 1) {
          vector<Set_Trie> new_layer;
          for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
            new_layer.push_back(Set_Trie());
          }
          reasons.push_back(new_layer);
        }
      }

    private:
      // upper layer to add to, this function adds to all less also
      void solver_add_reason(const vector<int>& reason, int layer, int subproblem) { // TODO rename
        if(LOUD) cout << "dagster layer solver_add_reason layer, subproblem: " << layer << " " << subproblem << endl;

        // see if this should be added to the actual solver
        if (project_state_to_propositions(reason, subproblem_to_propositions[subproblem]).size() < reason.size()) {
          if (reason.size() == 1 && layer==0) {
            cout << "SPECIAL EXEMPTION FOR GOAL LITS" << endl;
            if(LOUD) cout << "NOT ACTUALLY ADDING REASON TO SINGLE SOLVER (AS IS A GOAL PROP AT THE WRONG SUBPROBLEM - will add when relevant): " << state_string(reason) << endl;
            return;
          } else {
            if(LOUD) cout << "NOT ACTUALLY ADDING REASON AS DOESN'T PROJECT TO PROPOSITIONS USED, TO SINGLE SOLVER: " << state_string(reason) << endl;
            return;

            assert(0); // TODO what?...
            cout << "giving special excemption to the last one TODO review this whole system" << endl;
            //if (subproblem+1 != num_subproblems) assert(0); // this is baed on the subproblem we happen to be in - problematic for adding a permament clause
          }
          // projection lost some lits, so projected space is small, so drop clauses
        }

        const vector<int>& clause = get_clause_from_reason(reason, subproblem);
        for (int worker=1; worker<num_workers+1; worker++) {
          while (worker_upper_layer_dagster_clauses_to_add[worker].size()<=layer) {
            worker_upper_layer_dagster_clauses_to_add[worker].push_back(vector<vector<int>>()); // just make sure it is full
          }
          worker_upper_layer_dagster_clauses_to_add[worker][layer].push_back(clause);
        }
      }
  };

  class Single_Layers : public Layers {
    public:
      Single_Layers() {
      }

      ~Single_Layers() {
        for(int i=0; i < solvers.size(); i++) delete solvers[i];
      }

      void make_layer_exist(int layer) {
        if (baseLingeling == NULL) {
          baseLingeling = new Lingeling((tmp_dir + "/tmp_regular.cnf").c_str());
          if (use_OOC) {
            for (auto it=ooc_clauses_for_every_new_solver.begin(); it!=ooc_clauses_for_every_new_solver.end(); it++) baseLingeling->add_clause(*it);
          }
          const vector<int> blank = vector<int>();

          PDR::parallel_timer.stored_duration = 0;
          PDR::parallel_timer.start();
          baseLingeling->solve(blank);
          PDR::parallel_timer.pause();
          PDR::total_parallel_time_spent += PDR::parallel_timer.stored_duration;
        }

        while (reasons.size() < layer + 1) {
          vector<Set_Trie> new_layer;
          for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
            new_layer.push_back(Set_Trie());
          }
          reasons.push_back(new_layer);
          Lingeling* new_solver = new Lingeling(baseLingeling);
          //const vector<int> blank = vector<int>();
          //new_solver->solve(blank);
          solvers.push_back(new_solver);

#if TEST_NAL
          Lingeling* NAL_new_solver = new Lingeling(baseLingeling);
          NAL_solvers.push_back(NAL_new_solver);
#endif
        }
      }

      vector<Lingeling*> solvers;
#if TEST_NAL
      vector<Lingeling*> NAL_solvers;
#endif

    private:
      // upper layer to add to, this function adds to all less also
      void solver_add_reason(const vector<int>& reason, const int layer, const int subproblem){
        if(LOUD) cout << "single layer solver_add_reason" << endl;

        // see if this should be added to the actual solver
        if (project_state_to_propositions(reason, subproblem_to_propositions[subproblem]).size() < reason.size()) {
          if (reason.size() == 1 && layer==0) {
            cout << "SPECIAL EXEMPTION FOR GOAL LITS" << endl;
            if(LOUD) cout << "NOT ACTUALLY ADDING REASON TO SINGLE SOLVER (AS IS A GOAL PROP AT THE WRONG SUBPROBLEM - will add when relevant): " << state_string(reason) << endl;
            return;
          } else {
            if(LOUD) cout << "NOT ACTUALLY ADDING REASON AS DOESN'T PROJECT TO PROPOSITIONS USED, TO SINGLE SOLVER: " << state_string(reason) << endl;
            return;

            assert(0); // TODO what?...
            cout << "giving special excemption to the last one TODO review this whole system" << endl;
            //if (subproblem+1 != num_subproblems) assert(0); // this is baed on the subproblem we happen to be in - problematic for adding a permament clause
          }
          // projection lost some lits, so projected space is small, so drop clauses
        }

        const vector<int>& clause = get_clause_from_reason(reason, subproblem);

#if TEST_NAL
        // NAL clause
        vector<int> NAL_clause;
        for (auto it=clause.begin(); it!=clause.end(); it++) {
          if (activation_vars.find(abs(*it)) == activation_vars.end()) NAL_clause.push_back(*it);
        }
        assert(clause.size() > NAL_clause.size());
#endif

        for (int i=0; i<layer+1; i++) {
          if(LOUD) cout << "ACTUALLY ADDING CLAUSE TO SOLVER LAYER " << i << " : " << state_string(clause) << endl;
          if(LOUD) cout << "solver" << i << " add clause" << state_string(clause) << endl;
          solvers[i]->add_clause(clause);
#if TEST_NAL
          NAL_solvers[i]->add_clause(NAL_clause);
#endif
        }
      }
  };

  // TODO how to do this efficiently
  Dagster_Layers dagster_layers;
  Single_Layers single_layers;

  pair<vector<int>, vector<int>> project_to_state_actions(const vector<int>& assignment, const int subproblem) {
    // TODO make sure projecting is just for the sat solver giving more than it needs to - it shouldn't be doing work on the not excess variables
    const vector<int>& subproblem_propositions = subproblem_to_propositions[subproblem];
    const vector<int>& subproblem_actions = subproblem_to_actions[subproblem];

    //cout << state_string(assignment) << endl;
    //cout << total_per_timestep << endl;
    //assert(assignment.size() == total_per_timestep*2);
    assert(is_abs_sorted(assignment));

    // TODO this can be made more efficient, only include the needed, special functions etc...
    vector<int> assignment_state_projected;
    assert(assignment.size()>=total_per_timestep*2);
    for (int i=PDR::total_per_timestep+subproblem_actions.size(); i<total_per_timestep*2; i++) assignment_state_projected.push_back(tilde_lit(assignment[i],-1));

    const vector<int>& succ_state = project_state_to_propositions(assignment_state_projected, subproblem_propositions);
    const vector<int>& actions_executed = project_state_to_propositions(assignment, subproblem_actions);

    assert(is_abs_sorted(succ_state));
    assert (actions_executed.size() == subproblem_actions.size());
    assert (succ_state.size() == subproblem_propositions.size());

    for (auto it=actions_executed.begin(); it!=actions_executed.end(); it++) {
      assert (in_pos_vector(abs(*it), subproblem_actions)); 
    }

    return pair<vector<int>, vector<int>>(succ_state, actions_executed);
  }

  vector<string> split(const string& input){
    vector<string> tokens;
    string buffer;
    stringstream ss(input);
    while (ss >> buffer) tokens.push_back(buffer);
    return tokens;
  }

  void read_mapping(){
    string line;
    ifstream mapping_file(tmp_dir + "/tmp_mapping.txt");
    if (mapping_file.is_open())
    {
      symbols.push_back("NONE");
      while (getline(mapping_file, line)) {
        vector<string> type_symbol_variable = split(line);
        string symbol = type_symbol_variable[1];
        int variable = stoi(type_symbol_variable[2]);
        assert(variable == symbols.size());
        symbols.push_back(symbol);
      }
      mapping_file.close();
    }
  }
    
  void read_extra_settings(string extra_settings_filename) {
    PDR::extra_settings_read = true;
    // read extra settings - the is mainly for testing, so new feastures can be quickly added and removed
    const int total_expected = 6;
    set<string> ignore_keys;
    ignore_keys.insert("activation_literals");

    string line;
    ifstream extra_settings_file(extra_settings_filename);
    assert(extra_settings_file.is_open());
    int seen = 0;
    while (getline(extra_settings_file, line)) {
      seen++;
      vector<string> key_val = split(line);
      assert(key_val.size() == 2);
      const string key = key_val[0];
      const string val = key_val[1];
      const int val_int = stoi(val);
      if (ignore_keys.find(key) != ignore_keys.end()) continue;
      else if (key == "project_last") {
        if (val_int == 1)      project_last = true;
        else if (val_int == 0) project_last = false;
        else assert(0);
      } else if (key == "complete_nonfinal") {
        if (val_int == 1)      complete_nonfinal = true;
        else if (val_int == 0) complete_nonfinal = false;
        else assert(0);
      } else if (key == "obligation_rescheduling") {
        if (val_int == 1)      obligation_rescheduling = true;
        else if (val_int == 0) obligation_rescheduling = false;
        else assert(0);
      } else if (key == "use_ooc") {
        if (val_int == 1)      use_OOC = true;
        else if (val_int == 0) use_OOC = false;
        else assert(0);
      } else if (key == "isolate_subproblems") {
        if (val_int == 1)      isolate_subproblems = true;
        else if (val_int == 0) isolate_subproblems = false;
        else assert(0);
      } else {
        cout << "ERROR setting: " << key << endl;
        assert(0);
      }
    }
    extra_settings_file.close();
    if (complete_nonfinal && project_last) {
      assert(0); // Can't handle projecting AND complete nonfinal - will try do them together, and not do it well
    }
    assert(seen == total_expected);
  }

  // Read in the dagster info file created by the parser
  void read_problem_input(){
    Parser parser;
    parser.parse(tmp_dir);
    //parser.print();

    total_per_timestep                         = parser.total_per_timestep;
    actions                                    = parser.actions;
    actions_set                                = parser.actions_set;
    num_subproblems                            = parser.num_subproblems;
    initial_state                              = parser.initial_state;
    goal_condition                             = parser.goal_condition;
    subproblem_to_propositions                 = parser.subproblem_to_propositions;
    subproblem_to_actions                      = parser.subproblem_to_actions;
    subproblem_to_clause_validating_lits       = parser.subproblem_to_clause_validating_lits;
    subproblem_to_assumptions                  = parser.subproblem_to_assumptions;
    subproblem_to_only_one_cliques             = parser.subproblem_to_only_one_cliques;

    for (int i=0; i<initial_state.size(); i++) {
      int var = abs(initial_state[i]);
      propositions.push_back(var);
      propositions_set.insert(var);
    }

    assert(subproblem_to_propositions.size() == num_subproblems);

    // process subproblem_only_one_cliques
    for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
      set<int> props_mentioned; // just a check
      for (int clique=0; clique<subproblem_to_only_one_cliques[subproblem].size(); clique++) {
        vector<int> clause_zero = subproblem_to_only_one_cliques[subproblem][clique];
        assert(is_abs_sorted(clause_zero));
        vector<int> clause_one;
        for (auto it=clause_zero.begin(); it!=clause_zero.end(); it++) {
          assert(props_mentioned.find(*it) == props_mentioned.end());
          props_mentioned.insert(*it);
          clause_one.push_back(tilde_lit(*it, 1));
        }

        for (int i=0; i<subproblem_to_clause_validating_lits[subproblem].size(); i++) {
          clause_zero.push_back(subproblem_to_clause_validating_lits[subproblem][i]);
        }

        for (int i=0; i<subproblem_to_clause_validating_lits[subproblem].size(); i++) {
          clause_one.push_back(subproblem_to_clause_validating_lits[subproblem][i]);
        }

        // for use_ooc
        ooc_clauses_for_every_new_solver.push_back(clause_zero);
        ooc_clauses_for_every_new_solver.push_back(clause_one);
      }
    }

#if TEST_NAL
    for (int subproblem=0; subproblem<PDR::num_subproblems; subproblem++) {
      activation_vars.insert(abs(PDR::subproblem_to_clause_validating_lits[subproblem][0]));
    }
#endif
  }

  void read_problem_input_isolate_subproblems(){
    Parser parser;
    parser.parse(tmp_dir);
    //parser.print();

    total_per_timestep                         = parser.total_per_timestep;
    actions                                    = parser.actions;
    actions_set                                = parser.actions_set;

    // Changed from the parser
    num_subproblems                            = 1;
    subproblem_to_propositions[0]              = parser.subproblem_to_propositions[PDR::isolate_subproblems_number];
    subproblem_to_actions[0]                   = parser.subproblem_to_actions[PDR::isolate_subproblems_number];
    subproblem_to_clause_validating_lits[0]    = parser.subproblem_to_clause_validating_lits[PDR::isolate_subproblems_number];
    subproblem_to_assumptions[0]               = parser.subproblem_to_assumptions[PDR::isolate_subproblems_number];
    subproblem_to_only_one_cliques[0]          = parser.subproblem_to_only_one_cliques[PDR::isolate_subproblems_number];
    goal_condition                             = parser.subproblem_to_isolate_goal[isolate_subproblems_number];
    initial_state                              = project_state_to_propositions(parser.initial_state, subproblem_to_propositions[0]);

    for (int i=0; i<initial_state.size(); i++) {
      int var = abs(initial_state[i]);
      propositions.push_back(var);
      propositions_set.insert(var);
    }
    assert(parser.subproblem_to_propositions.size() == parser.num_subproblems);
    assert(initial_state.size() == propositions_set.size()); 
    if (use_OOC) exit(1); // not set up for it

#if TEST_NAL
    exit(1); // not set up for it
#endif
  }

  void dagster_initialize_to_send_clauses(const set<int>& workers_to_compile_clauses_for) {
    // sends off the clauses 
    for (auto it=workers_to_compile_clauses_for.begin(); it!=workers_to_compile_clauses_for.end(); it++) {
      const int worker = *it;
      assert(worker);
      for (int layer=0; layer<worker_upper_layer_dagster_clauses_to_add[worker].size(); layer++) {
        const vector<vector<int>>& clauses = worker_upper_layer_dagster_clauses_to_add[worker][layer];
        if (clauses.size()) {
          if(A)cout << "preparing an extra clauses message for worker " << worker << " with clauses sizes: ";
          for (auto it=clauses.begin(); it!=clauses.end(); it++) {
            vector<int> clause = *it; 
            if(A)cout << clause.size() << " ";
          }
          if(A)cout << endl;

          Message* add_clauses_message = new Message(layer, ADD_CLAUSES_FROM);
          add_clauses_message->additional_clauses = get_cnf(clauses);
          add_clauses_worker(add_clauses_message, worker);
          worker_upper_layer_dagster_clauses_to_add[worker][layer].clear();
        }
      }
    }
  }

  // TODO neatness rename the layer for state layer, and succ state layer for clarity
  vector<int> single_get_successor(const vector<int>& state, int layer, int subproblem, bool record) {
    // TODO giving memo result in the function means unsat cores will be wrong for subsequent reason call
    //const tuple<vector<int>, int> state_layer_pair (state, layer);
    if(LOUD) single_layers.print_reasons();
    if(LOUD) cout << "state: " << state_string(state) << endl;
    //if(LOUD) cout << "allowed actions: " << state_string(subproblem_to_actions[subproblem]) << endl;
    //if(LOUD) cout << "allowed propositions: " << state_string(subproblem_to_propositions[subproblem]) << endl;
    //if(LOUD) cout << "assumptions: " << state_string(subproblem_to_assumptions[subproblem]) << endl;

    assert(ALLOW_SINGLE);
    if(LOUD) cout << "single_get_successor for layer " << layer << endl;
    assert(single_layers.solvers.size()>layer-1);
    timing.lingeling_start(subproblem);
    //cout << "solver" << layer-1 << " all assumptions " << state_string(state) << " " << state_string(subproblem_to_assumptions[subproblem]) << endl;
    bool success1;
#if TEST_NAL
    bool NAL_success1;
#endif
    if (PDR::use_OOC) {
      const vector<int>& projected_state = project_state_to_only_one_mutex_cliques(state, subproblem);
      parallel_timer.start();
      success1 = single_layers.solvers[layer-1]->solve_unmentioned_assumptions(projected_state, subproblem_to_assumptions[subproblem]);
#if TEST_NAL
      NAL_success1 = single_layers.NAL_solvers[layer-1]->solve_unmentioned_assumptions(projected_state, subproblem_to_assumptions[subproblem]);
#endif
      parallel_timer.pause();
    } else {
      parallel_timer.start();
      success1 = single_layers.solvers[layer-1]->solve_unmentioned_assumptions(state, subproblem_to_assumptions[subproblem]);
#if TEST_NAL
      NAL_success1 = single_layers.NAL_solvers[layer-1]->solve_unmentioned_assumptions(state, subproblem_to_assumptions[subproblem]);
#endif
      parallel_timer.pause();
    }
    
#if TEST_NAL
    assert(success1 == NAL_success1);
#endif
    if (success1) {
      timing.lingeling_stop(true);
      vector<int> assignments = single_layers.solvers[layer-1]->get_model();
      vector<int> succ_state;
      vector<int> actions_executed;
      tie(succ_state, actions_executed) = project_to_state_actions(assignments, subproblem);
      if(LOUD) cout << "single found a successor state, used actions: " << state_string(actions_executed) << endl;
      if (PDR::storing_actions && record && subproblem == PDR::num_subproblems-1) state_actions.add_state(succ_state, state, actions_executed, subproblem, layer+1);
      return succ_state;
    } else {
      timing.lingeling_stop(false);
      const tuple<vector<int>, int> state_layer_pair (state, layer);
      assert(is_abs_sorted(state));
      return vector<int>();
    }
  }

  bool single_has_successor(const vector<int>& state, int layer, int subproblem){
    assert(ALLOW_SINGLE);
    if(LOUD) cout << "single_has_successor for layer " << layer << " subproblem: " << subproblem << endl;
    assert(single_layers.solvers.size()>layer-1);

    // check to make sure this is being used as thought
    if (PDR::use_OOC) assert(state.size() == project_state_to_only_one_mutex_cliques(state, subproblem).size());

    parallel_timer.start();
    timing.lingeling_start(subproblem);
    bool return_value1 = single_layers.solvers[layer-1]->solve_unmentioned_assumptions(state, subproblem_to_assumptions[subproblem]);
#if TEST_NAL
    bool NAL_return_value1 = single_layers.NAL_solvers[layer-1]->solve_unmentioned_assumptions(state, subproblem_to_assumptions[subproblem]);
    assert(return_value1 == NAL_return_value1);
#endif
    //bool return_value2 = single_layers.solvers[layer-1]->solve(state);
    //assert (return_value1 == return_value2);
    timing.lingeling_stop(return_value1);
    parallel_timer.pause();
    return return_value1;
  }

  vector<int> single_get_reason_just_used(const vector<int>& state, int layer, int subproblem) {
    return single_layers.solvers[layer-1]->used_assumptions();
  }

  vector<int> single_get_reason(const vector<int>& state, int layer, int subproblem) {
    // TODO does not use state, could be confusing
    assert(ALLOW_SINGLE);

    vector<int> running_reason = single_layers.solvers[layer-1]->used_assumptions();
    if (S) cout << "in layer " << layer << endl;
    if (S) cout << "subproblem " << subproblem << endl;
    if (S) cout << "In reduce, starting candidate [ " << running_reason.size() << " / " << subproblem_to_propositions[subproblem].size() << " ] " << state_string(running_reason) << endl;
    //return running_reason;

    vector<int> propositions_to_exclude = propositions;

    for (int i=0; i<propositions_to_exclude.size(); i++) {
      int proposition_to_exclude = propositions_to_exclude[i];
      vector<int> possible_reason;
      for (int j=0; j<running_reason.size(); j++) {
        if (abs(running_reason[j]) != proposition_to_exclude) possible_reason.push_back(running_reason[j]);
      }
      // proposition to exclude has not already been excluded
      if (running_reason != possible_reason) {
        assert(running_reason.size() == possible_reason.size()+1);
        // have a new reason candidate, if a valid reason use as the new reason
        if (!single_has_successor(possible_reason, layer, subproblem)) {
          running_reason = single_layers.solvers[layer-1]->used_assumptions();
          if (S) cout << "In reduce, mid-way candidate [ " << running_reason.size() << " / " << subproblem_to_propositions[subproblem].size() << " ] " << state_string(running_reason) << endl;
        }
      }
    }
    return running_reason;
  }

  void print_dagster_stats() {
    for (int subproblem=0; subproblem<PDR::num_subproblems; subproblem++) {
      cout << "dagster_sat_count " << subproblem << " : " << dagster_sat_counts[subproblem] << endl;
    }
    for (int subproblem=0; subproblem<PDR::num_subproblems; subproblem++) {
      cout << "dagster_unsat_count " << subproblem << " : " << dagster_unsat_counts[subproblem] << endl;
    }
    cout << "dagster_call_count: " << PDR::dagster_call_count << endl;
    cout << "dagster_total_time: " << string_float(float_time(dagster_total_time)) << endl;

    cout << "simulated_parallel_total_time: " << string_float(float_time(total_parallel_time_spent)) << endl;
  }

  void dagster_start(int argc, char **argv) {
    assert(ALLOW_DAGSTER);
    cout << "dagster initializing" << endl;
    // for mpi
    // Default: BREADTH_FIRST_NODE_ALLOCATIONS = false;

    command_line_arguments.master_sub_mode = 1;
    command_line_arguments.sat_solution_interrupt = 1;
    command_line_arguments.ENUMERATE_SOLUTIONS = false;
    command_line_arguments.mode = 3;
    global_init(argc, argv, PDR::tmp_dir, subproblem_to_propositions, subproblem_to_assumptions);
    Cnf* cnf = new Cnf((PDR::tmp_dir + "/../blank/tmp_decomposed.cnf").c_str());
    Dag* dag = new Dag((PDR::tmp_dir + "/../blank/tmp_decomposed.dag").c_str());
    load_CNF_DAG(cnf, dag);
    delete cnf;
    delete dag;
    cout << "dagster finished initializing" << endl;
  }

  void dagster_stop() {
    assert(ALLOW_DAGSTER);
    shutdown();
  }

  void add_reason(const vector<int>& reason, int layer, int subproblem) { 
    if (PDR::runtime_dagster) return dagster_layers.add_reason(reason, layer, subproblem);
    else                      return single_layers.add_reason(reason, layer, subproblem);
  }

  void make_layer_exist(int layer) { 
    if (PDR::runtime_dagster) dagster_layers.make_layer_exist(layer);
    else                      single_layers.make_layer_exist(layer);
  }

  set<vector<int>> get_reasons_not_in_next_layer(int layer, int scc_node) { 
    if (PDR::runtime_dagster) return dagster_layers.get_reasons_not_in_next_layer(layer, scc_node);
    else                      return single_layers.get_reasons_not_in_next_layer(layer, scc_node);
  }

  bool same_as_previous(int layer, set<int> layers_to_check) { 
    if (PDR::runtime_dagster) return dagster_layers.same_as_previous(layer, layers_to_check);
    else                      return single_layers.same_as_previous(layer, layers_to_check);
  }

  int get_first_empty_layer() { 
    if (PDR::runtime_dagster) return dagster_layers.get_first_empty_layer();
    else                      return single_layers.get_first_empty_layer();
  }

  void push_nonfinal_up_to_layer(int just_empty_layer) { 
    if (PDR::runtime_dagster) return dagster_layers.push_nonfinal_up_to_layer(just_empty_layer);
    else                      return single_layers.push_nonfinal_up_to_layer(just_empty_layer);
  }
}

bool parallel_pdr();

void add_all_layer_zero();

int main(int argc, char **argv) {
  // not set up to turn these flags off, which solver to be used is set at runtime
  assert(ALLOW_SINGLE);
  assert(ALLOW_DAGSTER);

  // parse command line arguments
  const string report_string = string(argv[1]);
  const string parallel_string = string(argv[2]);
  cout << report_string << endl;
  if (report_string == "0") PDR::storing_actions = false;
  else if (report_string == "1") PDR::storing_actions = true;
  else assert(0);
  if (parallel_string == "0") PDR::runtime_dagster = false;
  else if (parallel_string == "1") PDR::runtime_dagster = true;
  else assert(0);
  PDR::tmp_dir = string(argv[3]);
  PDR::read_extra_settings(string(argv[4]));
  cout << "PORTFOLIO_QUEUE " << PORTFOLIO_QUEUE << endl;
  cout << "obligation rescheduling " << PDR::obligation_rescheduling << endl;

#if PORTFOLIO_QUEUE
  if (!PDR::runtime_dagster) {
    cout << "ERROR using portfolio queue in single mode" << endl;
    exit(1);
  }
#endif
  
  // Load symbols
  PDR::read_mapping(); // TODO not if not storing actions

  // Load in helper information - some information is dagster specific
  if (PDR::isolate_subproblems) {
    assert(argc == 6);
    PDR::isolate_subproblems_number = stoi(string(argv[5]));
    assert (PDR::isolate_subproblems_number >= 0);
    PDR::read_problem_input_isolate_subproblems();
  } else {
    assert(argc == 5);
    PDR::read_problem_input();
  }

  for (int subproblem=0; subproblem<PDR::num_subproblems; subproblem++){
    PDR::dagster_sat_counts.push_back(0);
    PDR::dagster_unsat_counts.push_back(0);
  }

  if (PDR::runtime_dagster) PDR::dagster_start(argc, argv);

  PDR::num_workers = world_size-1;
  for (int worker=0; worker<PDR::num_workers+1; worker++) { // as workers start at 1
    PDR::worker_upper_layer_dagster_clauses_to_add.push_back(vector<vector<vector<int>>>());
    //PDR::workers_to_send_to.insert(worker);
  }

  if (PDR::runtime_dagster) setup_dagster();

  cout << "Read in problem" << endl;
  
  add_all_layer_zero();

  const bool plan_exists = parallel_pdr();
  
  if (PDR::storing_actions && plan_exists) PDR::state_actions.print_write_path_final_state();

  //if (PDR::runtime_dagster) PDR::dagster_layers.print_reasons();
  //else                      PDR::single_layers.print_reasons();

  if (PRINT_END_RESULT) {
    if (PDR::runtime_dagster) PDR::dagster_layers.print_reasons();
    else                      PDR::single_layers.print_reasons();
    PDR::BUFFER_print_state_count();
  }
  //PDR::timing.print();
  //PDR::print_dagster_stats();

  cout << "trying to stop workers" << endl;
  if (PDR::runtime_dagster) PDR::dagster_stop();

  cout << "exiting main" << endl;
  return 0;
}

void add_all_layer_zero() {
  // adds relevant layer 0 goal condiitons for each subproblem
  PDR::make_layer_exist(0);

  for (int subproblem = 0; subproblem < PDR::num_subproblems; subproblem++) {
    for(int i=0; i<PDR::goal_condition.size(); i++){
      if (LOUD) cout << "processing goal condition " << PDR::goal_condition[i] << endl;
      if (in_pos_vector(abs(PDR::goal_condition[i]), PDR::subproblem_to_propositions[subproblem])) {
        //cout << " goal condition " << PDR::goal_condition[i] << endl;
        const vector<int>& goal_unit_reason{-PDR::goal_condition[i]}; // NOTE the negative as a "reason"
        PDR::add_reason(goal_unit_reason, 0, subproblem);
      }
    }
  }
}

class Parallel_Buffer {
  public:
  // takes in a collection of subproblem, layer, states. gives back a collection of successor state, and nogoods
  void add(const vector<int> state, int layer, int subproblem, int worker, bool reduce, bool keep_states) {
    if (PRINT_STATES) cout << "adding state to buffer (layer, subproblem, reduce, keep_states): (" << layer << ", " << subproblem << ", " << reduce << ", " << keep_states << ") " << PDR::state_string(state) << endl;
    if (reduce) { // as a proxy for "real" states, not just pushing clauses - so do some accounting
      while (PDR::BUFFER_layer_to_subproblem_to_state_count.size() <= layer) {
        PDR::BUFFER_layer_to_subproblem_to_state_count.push_back(vector<int>(PDR::num_subproblems));
      }
      PDR::BUFFER_layer_to_subproblem_to_state_count[layer][subproblem]++;
    }
    to_process.push_back(tuple<vector<int>, int, int, int, bool, bool>(state, layer, subproblem, worker, reduce, keep_states));
    if(A)cout << "about to add state to buffer:" << endl;
    if(A)cout << PDR::pos_state_string(state) << endl;
    if(A)cout << "after adding that state, to_process size: " << to_process.size() << endl;
  }

  bool results_ready() {
    return successor_states.size() + unprogressable_states.size();
  }

  int input_to_process() {
    return to_process.size();
  }

  int get_free_id() {
    // returns an ID of a obligation already processed OR if there are none free, create a new one
    if (free_ids.size()) {
      const int ret_val = free_ids[free_ids.size()-1];
      free_ids.pop_back();
      return ret_val;
    } else {
      next_new_id++;
      return next_new_id-1;
    }
  }

  void dagster_compute(bool use_sync_solve) {
    // if sync solve, will solve every obligation to completion, then return, else will send them off, and check previous ones
    if(A)if (to_process.size()) cout << "start of dagster compute, actually has something: to_process size" << to_process.size() << endl;
    assert((to_process.size() <= PDR::workers_to_send_to.size()) || use_sync_solve);
    PDR::dagster_call_count++;
    // should call external functions, but the format is too interlinked, there would need to be a lot more accounting to make it work so it is being done here
    if (use_sync_solve) {
      set<int> all_workers;
      for (int worker=1; worker<PDR::num_workers+1; worker++) all_workers.insert(worker);
      PDR::dagster_initialize_to_send_clauses(all_workers);
    }
    else PDR::dagster_initialize_to_send_clauses(PDR::workers_to_send_to);

    // Just a check, to make sure every worker to send to worker has a corresponding single job
    set<int> workers_to_send_to_not_checked_off = PDR::workers_to_send_to;
    //cout << "workers to send to " << PDR::workers_to_send_to << endl;

    if (LOUD) cout << "to_process size:" << to_process.size() << endl;
    //vector<bool> id_to_keep_states = vector<bool>(to_process.size());
    for (int to_process_index=0; to_process_index<to_process.size(); to_process_index++) {
      const tuple<vector<int>, int, int, int, bool, bool>& current_process = to_process[to_process_index];
      const int id = get_free_id();
      const vector<int>& state = get<0>(current_process);
      const int layer = get<1>(current_process);
      const int subproblem = get<2>(current_process);
      const int worker = get<3>(current_process);
      //cout << "procesisng job for worker: " << worker << endl;
      const bool reduce = get<4>(current_process);
      const bool keep_states = get<5>(current_process);
      id_to_extra_info[id] = current_process;
      id_to_keep_states[id] = keep_states;
      //cout << "processing state: " << layer << " : " << PDR::pos_state_string(state) << endl;

      assert(layer > 0); // at 0 we have a goal state

      if (LOUD) cout << "STARTING: processing state, layer: " << layer << " : " << PDR::state_string(state) << endl;

      Message *m = new Message(layer-1, subproblem);
      m->id = id;
      m->reduce = (reduce) ? 1 : 0;
      for(int j=0; j<state.size(); j++) m->assignments.push_back(state[j]); // TODO efficiency

      // Just a check
      if (worker != -1) {
        assert(workers_to_send_to_not_checked_off.find(worker) != workers_to_send_to_not_checked_off.end());
        workers_to_send_to_not_checked_off.erase(worker);
      }



      // Send the message off
#if PORTFOLIO_QUEUE
      if (use_sync_solve) {
        assert(worker == -1);
        initial_message(m); // Adds this message to a buffer
      } else {
        assert(worker != -1);
        initial_message(m, worker); // Adds this message to a buffer
      }
#else
      assert(worker == -1);
      initial_message(m); // Adds this message to a buffer
#endif 
    }

    // Just a check
    //cout << workers_to_send_to_not_checked_off << endl;
#if PORTFOLIO_QUEUE
    assert(workers_to_send_to_not_checked_off.size() == 0);
#endif

    //PDR::timing.dagster_start(0);
    clock_t start_time = clock();
    // TODO busy waiting around this
    if(A)cout << "start solve, sync solve: " << use_sync_solve << endl;
    assert(to_process.size() + number_being_processed); // assert waiting on results, or about to send more queries

    tuple<vector<tuple<Message*, int>>, vector<tuple<Message*, int>>> solve_results;
    if (use_sync_solve) solve_results = sync_solve();
    else                solve_results = async_solve(PDR::workers_to_send_to);
    PDR::dagster_total_time += (clock() - start_time);
    PDR::workers_to_send_to = set<int>(); // TODO just for error checking, should not be used unchanged from now
    //PDR::timing.dagster_stop(true);
    if(A)cout << "end solve" << endl;

    const vector<tuple<Message*, int>>& assignments_messages = get<0>(solve_results);
    const vector<tuple<Message*, int>>& used_assumptions_messages = get<1>(solve_results);

    number_being_processed += to_process.size() - (assignments_messages.size() + used_assumptions_messages.size());
    assert(number_being_processed >= 0);
    if(A)cout << number_being_processed << " + " << get_free_workers().size() << " == " << PDR::num_workers << endl;
    if(A)assert(number_being_processed + get_free_workers().size() == PDR::num_workers);

    //assert(assignments_messages.size() + used_assumptions_messages.size() == to_process.size());

    // process succesor states
    for (auto it=assignments_messages.begin(); it!=assignments_messages.end(); it++) {
      //cout << "processing succ state" << endl;
      const tuple<Message*,int>& message_and_worker = *it;
      const Message* message = get<0>(message_and_worker);
      const int worker = get<1>(message_and_worker);
      assert(message!=NULL);

      const vector<int>& assignment = message->assignments;
      const int id = message->id;
      const vector<int>& original_state = get<0>(id_to_extra_info[id]); 
      const int original_state_layer = get<1>(id_to_extra_info[id]);
      const int subproblem = get<2>(id_to_extra_info[id]);
      const int reduce = message->reduce;
      const bool keep_states = id_to_keep_states[id];
      free_ids.push_back(id);
      PDR::dagster_sat_counts[subproblem]+=1;

#if PORTFOLIO_QUEUE
      const int worker_meant_to_be_sent_to = get<3>(id_to_extra_info[id]);
      if (!use_sync_solve) assert(worker == worker_meant_to_be_sent_to);
#endif

      vector<int> succ_state;
      vector<int> actions_executed;
      tie(succ_state, actions_executed) = PDR::project_to_state_actions(assignment, subproblem);

      if (PDR::storing_actions && keep_states && subproblem == PDR::num_subproblems-1) PDR::state_actions.add_state(succ_state, original_state, actions_executed, subproblem, original_state_layer);

      //cout << "pushing back succ state l:" << original_state_layer << " s: " << subproblem << endl;
      if(A)cout << "original_state " << PDR::pos_state_string(original_state) << endl;
      if(A)cout << "succ_state (layer, subproblem, reduce, keep_states): (" << original_state_layer-1 << ", " << subproblem << ", " << reduce << ", " << keep_states << ") " << PDR::pos_state_string(succ_state) << endl;
      if (PRINT_STATES) cout << "succ_state (layer, subproblem, reduce, keep_states): (" << original_state_layer-1 << ", " << subproblem << ", " << reduce << ", " << keep_states << ") " << PDR::state_string(succ_state) << endl;
      successor_states.push_back(tuple<vector<int>, int, int, int, vector<int>, int, bool>(original_state, original_state_layer, subproblem, worker, succ_state, reduce, keep_states));
      delete message;

      //queue.push(succ_state, original_state_layer-1, subproblem);
      //queue.push(original_state, original_state_layer, subproblem);
    }

    for (auto it=used_assumptions_messages.begin(); it!=used_assumptions_messages.end(); it++) {
      const tuple<Message*,int>& message_and_worker = *it;
      const Message* message = get<0>(message_and_worker);
      const int worker = get<1>(message_and_worker);
      assert(message!=NULL);

      const vector<int>& used_assumptions = message->assignments;
      const int id = message->id;
      const vector<int>& original_state = get<0>(id_to_extra_info[id]); 
      const int original_state_layer = get<1>(id_to_extra_info[id]);
      const int subproblem = get<2>(id_to_extra_info[id]);
      const int reduce = message->reduce;
      const bool keep_states = id_to_keep_states[id];
      free_ids.push_back(id);

#if PORTFOLIO_QUEUE
      const int worker_meant_to_be_sent_to = get<3>(id_to_extra_info[id]);
      if (!use_sync_solve) assert(worker == worker_meant_to_be_sent_to);
#endif

      if (PRINT_STATES) cout << "reason (layer, subproblem, reduce, keep_states): (" << original_state_layer << ", " << subproblem << ", " << reduce << ", " << keep_states << ") " << PDR::state_string(used_assumptions) << endl;
      unprogressable_states.push_back(tuple<vector<int>, int, int, int, vector<int>, int, bool>(original_state, original_state_layer, subproblem, worker, used_assumptions, reduce, keep_states));
      delete message;
      PDR::dagster_unsat_counts[subproblem]+=1;
    }
    to_process.clear();
  }

  void single_compute() {
    assert(!PDR::runtime_dagster);
    clock_t max_time_spent = 0;
    PDR::parallel_timer.stored_duration = 0;

    while (to_process.size()) {
      const tuple<vector<int>, int, int, int, bool, bool> current_process = *(to_process.end()-1);
      to_process.pop_back();
      const vector<int>& state = get<0>(current_process);
      const int layer = get<1>(current_process);
      const int subproblem = get<2>(current_process);
      const int worker = get<3>(current_process);
      const int reduce = get<4>(current_process);
      const bool keep_states = get<5>(current_process);
      const bool record = keep_states;
      assert(worker == -1); // if doing single 

      const vector<int> succ_state = PDR::single_get_successor(state, layer, subproblem, record);

      if (succ_state.size()) {
        if (P) cout << "succ_state (size) (reduce) (layer, subproblem) (only pos): (" << succ_state.size() << ") (" << reduce << ") (" << layer-1 << "," << subproblem << ") " << PDR::state_string(succ_state) << endl;
        successor_states.push_back(tuple<vector<int>, int, int, int, vector<int>, int, bool>(state, layer, subproblem, worker, succ_state, reduce, keep_states));
      } else {
        vector<int> reason;
        if (reduce) reason = PDR::single_get_reason(state, layer, subproblem);
        else        reason = PDR::single_get_reason_just_used(state, layer, subproblem);
        if (P) cout << "reason (" << layer << "," << subproblem << ") " << PDR::state_string(reason) << endl;

        //cout << "generated reason (subproblem: " << subproblem << ") : " << state.size() << " -> " << reason.size() << " : " << PDR::state_string(reason) << endl;

        const tuple<vector<int>, int, int, int, vector<int>, int, bool> unprogressable_state = tuple<vector<int>, int, int, int, vector<int>, int, bool>(state, layer, subproblem, worker, reason, reduce, keep_states);
        unprogressable_states.push_back(unprogressable_state);
      }

      max_time_spent = max(max_time_spent, PDR::parallel_timer.stored_duration);
      PDR::parallel_timer.stored_duration = 0;

    }
    PDR::total_parallel_time_spent += max_time_spent;
  }

  int waiting_on_results() {
    return number_being_processed;
  }

  vector<tuple<vector<int>, int, int, int, vector<int>, int, bool>> successor_states;
  vector<tuple<vector<int>, int, int, int, vector<int>, int, bool>> unprogressable_states;
  private:

  int number_being_processed = 0; // The number of states currently being processed in parallel
  int next_new_id = 0;
  vector<int> free_ids; // ids once assigned, now are free to use
  map<int,bool> id_to_keep_states;
  map<int,tuple<vector<int>, int, int, int, bool, bool>> id_to_extra_info;
  vector<tuple<vector<int>, int, int, int, bool, bool>> to_process;
};

bool push_check_unsat(Parallel_Buffer* buffer_ptr, PDR::QUEUE_TYPE* queue_ptr, const int layer_just_completed, const set<int>& subproblems_to_push, const set<int>& subproblems_to_check);

bool handle_nogoods_from_buffer_unsat(Parallel_Buffer* buffer_ptr, PDR::QUEUE_TYPE* queue_ptr, const int* layers, const set<int>* completed_subproblems_ptr);

bool handle_successor_states_from_buffer_sat(Parallel_Buffer* buffer_ptr, PDR::QUEUE_TYPE* queue_ptr, const int layer, set<int>* completed_subproblems_ptr, set<int>* newly_completed_subproblems_ptr);

bool populate_buffer_from_queue(Parallel_Buffer* buffer_ptr, PDR::QUEUE_TYPE* queue_ptr, const bool final_subproblem);

bool parallel_pdr() {
  assert(PDR::extra_settings_read);
  vector<vector<int>> subproblem_to_projected_initial_state;
  set<int> completed_subproblems;

  // Do manual check to see if initial state is allowed in the goal
  bool all_trivial = true;
  for (int subproblem = 0; subproblem < PDR::num_subproblems; subproblem++) {
    const vector<int>& projected_initial_state = project_state_to_propositions(PDR::initial_state, PDR::subproblem_to_propositions[subproblem]);

    set<int> initial_and_goal;
    for (int i=0; i<PDR::initial_state.size(); i++) initial_and_goal.insert(PDR::initial_state[i]);
    for (int i=0; i<PDR::goal_condition.size(); i++) {
      // if this is a goal whose VARIABLE is considered here, then add the LITERAL
      if (in_pos_vector(abs(PDR::goal_condition[i]), PDR::subproblem_to_propositions[subproblem])) initial_and_goal.insert(PDR::goal_condition[i]);
    }
    // if this conjunction contains literals that are in the goal state and not in the initial state, then there is work to be done
    if (initial_and_goal.size() != PDR::initial_state.size()) {
      // there are lits in the goal that are not in the initial state - there is work to be done
      subproblem_to_projected_initial_state.push_back(projected_initial_state);
      all_trivial = false;
    } else {
      if(LOUD) cout << "dropping initial state for subproblem " << subproblem << endl;
      subproblem_to_projected_initial_state.push_back(vector<int>());
      completed_subproblems.insert(subproblem);
    }
  }
  assert(subproblem_to_projected_initial_state.size() == PDR::num_subproblems);
  if (all_trivial) {
    cout << "FOUND A PLAN (trivially) for all subproblems" << endl;
    return true;
  }

  // first do lower subproblems, then do the final subproblem

  // set up objects
  int layers[PDR::num_subproblems];
  for (int subproblem=0; subproblem<PDR::num_subproblems; subproblem++) layers[subproblem] = 0;
  PDR::make_layer_exist(0);
#if PORTFOLIO_QUEUE
  PDR::PDR_Portfolio_Queue queue = PDR::QUEUE_TYPE(PDR::num_subproblems, layers + PDR::num_subproblems-1, PDR::obligation_rescheduling, PDR::num_workers);
#else
  PDR::PDR_Queue queue = PDR::QUEUE_TYPE(PDR::num_subproblems, layers + PDR::num_subproblems-1, PDR::obligation_rescheduling);
#endif
  Parallel_Buffer buffer;

  set<int> new_completed_subproblems;
  bool first_monolythic = true;

  if (!PDR::complete_nonfinal) {
    for (int subproblem=0; subproblem<PDR::num_subproblems-1; subproblem++) completed_subproblems.insert(subproblem);
  }

  // main loop
  while (true) {
    //if (!queue.empty()) queue.print_size();
    if (LOUD) cout << "starting main loop again" << endl;
    // First process all results from last compute session (if this is the first time running this is empty)
    if (handle_successor_states_from_buffer_sat(&buffer, &queue, layers[PDR::num_subproblems-1], &completed_subproblems, &new_completed_subproblems)) return true;
    if (handle_nogoods_from_buffer_unsat(&buffer, &queue, layers, &completed_subproblems)) return false;

    // complete_nonfinal: For problems newly completed, push them
    for (auto it=new_completed_subproblems.begin(); it!=new_completed_subproblems.end(); it++) {
      const int subproblem = *it;
      set<int> subproblems_to_push;
      set<int> subproblems_to_check;
      subproblems_to_push.insert(subproblem);
      subproblems_to_check.insert(subproblem); // TODO eventually not useful
      //cout << "WARNING: STOPPING CHECKING, PUSHING" << endl;
      const bool should_exit = push_check_unsat(&buffer, &queue, layers[subproblem]-1, subproblems_to_push, subproblems_to_check); // -1 as it doesn't have the final unsat at the starting layer
      assert(!should_exit);
    }
    new_completed_subproblems.clear();
    assert(new_completed_subproblems.size() == 0);

    // subproblems independant
    if (PDR::complete_nonfinal) {
      // Check if need to add to queue, first for nonfinal subproblems
      if (PDR::complete_nonfinal) {
        for (int subproblem=0; subproblem<PDR::num_subproblems-1; subproblem++) {
          if (completed_subproblems.find(subproblem) == completed_subproblems.end()) {
            // subproblem not completed
            if (queue.empty_for_subproblem(subproblem) && buffer.waiting_on_results() == 0) {
              cout << "TODO should be checking PER subproblem in this case" << endl;
              // completed it for this layer, so push and check
              set<int> subproblems_to_push;
              set<int> subproblems_to_check;
              subproblems_to_push.insert(subproblem);
              subproblems_to_check.insert(subproblem);
              //cout << "WARNING: STOPPING CHECKING, PUSHING" << endl;
              if (push_check_unsat(&buffer, &queue, layers[subproblem], subproblems_to_push, subproblems_to_check)) return false;
              layers[subproblem]++;
              PDR::make_layer_exist(layers[subproblem]+1);

              // Then add some more
              const vector<int>& projected_initial_state = subproblem_to_projected_initial_state[subproblem];
              if (projected_initial_state.size()) {
                assert(projected_initial_state.size() == PDR::subproblem_to_propositions[subproblem].size());
#if PORTFOLIO_QUEUE
      // THE PUSHING WITH PORTFOLIOS IS NOT SET UP FOR THIS
                exit(1);
#else
                queue.push(projected_initial_state, layers[subproblem], subproblem);
#endif
              }
            }
          }
        }
      }
    }

    // level subproblems together
    /*
    if (completed_subproblems.size() != PDR::num_subproblems-1) {
      if (queue.empty()) {
        set<int> subproblems_to_push;
        set<int> subproblems_to_check;

        int cl = -1;
        for (int subproblem = 0; subproblem < PDR::num_subproblems-1; subproblem++) {
          subproblems_to_push.insert(subproblem);
          if (completed_subproblems.find(subproblem) == completed_subproblems.end()) {
            cl = layers[subproblem];
            subproblems_to_check.insert(subproblem);
          }
        }

        assert(cl != -1);
        if (push_check_unsat(&buffer, &queue, cl, subproblems_to_push, subproblems_to_check)) return false;

        for (int subproblem = 0; subproblem < PDR::num_subproblems-1; subproblem++) {
          layers[subproblem]++;
          PDR::make_layer_exist(layers[subproblem]+1);
        }


        for (int subproblem = 0; subproblem < PDR::num_subproblems-1; subproblem++) {
          if (completed_subproblems.find(subproblem) == completed_subproblems.end()) {
            const vector<int>& projected_initial_state = subproblem_to_projected_initial_state[subproblem];
            if (projected_initial_state.size()) {
              assert(projected_initial_state.size() == PDR::subproblem_to_propositions[subproblem].size());
              queue.push(projected_initial_state, layers[subproblem], subproblem);
            }
          }
        }
      }
    }
    */

    
    // Reminder - when opting: completed_nonfinal=0 the object completed_subproblems has all subproblems
    // monolythic case
    // first make sure all nonfinal subproblems completed
    if (completed_subproblems.size() == PDR::num_subproblems-1) {
      if (queue.empty_for_subproblem(PDR::num_subproblems-1) && buffer.waiting_on_results() == 0) {
        // IF we are completing nonfinal, and they exist, and this it the first time we are considering monolythic, then push up
        if (PDR::complete_nonfinal) {
          if (PDR::num_subproblems>1) {
            if (first_monolythic) {
              //assert(0);
              // push up clauses
              layers[PDR::num_subproblems-1] = PDR::get_first_empty_layer();
              if (PDR::num_subproblems>1) {
                cout << "ABOUT TO LINE UP" << endl;
                PDR::push_nonfinal_up_to_layer(layers[PDR::num_subproblems-1]); // if there were other subproblems
              }
            }
          }
        }

        const int subproblem = PDR::num_subproblems-1;

        //cout << "TODO review checking all these subproblems which are not REALLLY relevant?" << endl;
        if (!first_monolythic) {
          // completed it for this layer, so push and check
          set<int> subproblems_to_push;
          set<int> subproblems_to_check;
          subproblems_to_push.insert(subproblem);
          subproblems_to_check.insert(subproblem);
          //cout << "WARNING: STOPPING CHECKING, PUSHING" << endl;
          if (push_check_unsat(&buffer, &queue, layers[subproblem], subproblems_to_push, subproblems_to_check)) return false;
        }
        layers[subproblem]++;
        PDR::make_layer_exist(layers[subproblem]+1);

        // Then add some more
        const vector<int>& projected_initial_state = subproblem_to_projected_initial_state[subproblem];
        if (projected_initial_state.size()) {
          assert(projected_initial_state.size() == PDR::subproblem_to_propositions[subproblem].size());
#if PORTFOLIO_QUEUE
          for (int worker = 1; worker<PDR::num_workers+1; worker++) queue.push(projected_initial_state, layers[subproblem], subproblem, worker);
#else
          queue.push(projected_initial_state, layers[subproblem], subproblem);
#endif
        }
        first_monolythic = false;
      }
    }

    // Now queues have content
    //assert(!queue.empty());
    
    const bool final_subproblem = (completed_subproblems.size() == PDR::num_subproblems-1);

    // Populate and process it
    //if (populate_buffer_from_queue(&buffer, &queue, final_subproblem)) {
    populate_buffer_from_queue(&buffer, &queue, final_subproblem);
    if (PRINT_BUFFER_SIZE) cout << "to process: " << buffer.input_to_process() << endl;
    if (PDR::runtime_dagster) buffer.dagster_compute(false);
    else                      buffer.single_compute();
  } // end main loop
  // shouldn't get here
  assert(0);
  return false;
}

bool handle_successor_states_from_buffer_sat(Parallel_Buffer* buffer_ptr, PDR::QUEUE_TYPE* queue_ptr, const int layer, set<int>* completed_subproblems_ptr, set<int>* newly_completed_subproblems_ptr) {
  // TODO BEWARE strange return types, true means stop, in this case for SAT

  //vector<tuple<vector<int>, int, int, vector<int>>> successor_states_with_info = buffer.get_successor_states();
  vector<tuple<vector<int>, int, int, int, vector<int>, int, bool>>& successor_states_with_info = buffer_ptr->successor_states;//get_successor_states();
  //cout << "num succ states " << successor_states_with_info.size() << endl;
  //cout << "handling sat count: " << successor_states_with_info.size() << endl;
  while(successor_states_with_info.size()) {
    tuple<vector<int>, int, int, int, vector<int>, int, bool>& successor_state_with_info = *(successor_states_with_info.end()-1);
    vector<int>& original_state = get<0>(successor_state_with_info);
    const int i = get<1>(successor_state_with_info);
    const int subproblem = get<2>(successor_state_with_info);
    const int worker = get<3>(successor_state_with_info);
    vector<int>& succ_state = get<4>(successor_state_with_info);
    const int reduce = get<5>(successor_state_with_info);
    const bool keep_states = get<6>(successor_state_with_info);
    if (PRINT_BUFFER_SIZE) cout << "sat: layer subproblem reduce keep_states: " << i << " " << subproblem << " " << reduce << " " << keep_states << endl;

    if (keep_states) {
#if MONOLYTH_WITH_PROJECTIONS
      if ((subproblem == PDR::num_subproblems-1) && (reduce == 0)) {
        // as a proxy for the monolythic case
        assert(original_state == get<0>(queue_ptr->contemplated_monolyth));
        queue_ptr->monolyth_succeeded();
      }
#endif 
    } else {
      successor_states_with_info.pop_back();
      continue;
    }

    if (P) cout << "found and am processing succ state (layer, subproblem) (only pos): (" << i-1 << "," << subproblem << ") " << PDR::pos_state_string(succ_state) << endl;
    //if (completed_subproblems.find(subproblem) != completed_subproblems.end()) cout << "subproblem is in completed_subproblems: " << subproblem << endl;

    if (completed_subproblems_ptr->find(subproblem) == completed_subproblems_ptr->end()) {
#if PORTFOLIO_QUEUE
      queue_ptr->push(original_state, i, subproblem, worker);
#else
      queue_ptr->push(original_state, i, subproblem);
#endif
      /*
         if (1) { 
         if (subproblem == PDR::num_subproblems-1) queue.push(original_state, i, subproblem);
         */

      // test if goal state
      if (i-1 == 0) {
        // Goal state
        if (subproblem == PDR::num_subproblems-1) {
          // Goal state for monolythic problem
          cout << "FOUND A PLAN" << endl;
          if (PRINT_END_RESULT) queue_ptr->print_size();
          if (PDR::storing_actions) PDR::state_actions.set_final_state(succ_state, subproblem);
          else cout << "WAS NOT STORING ACTIONS" << endl;
          return true;
        } else {
          // solved a subproblem
          completed_subproblems_ptr->insert(subproblem);
          queue_ptr->remove_subproblem(subproblem);

          // new subproblem solver
          newly_completed_subproblems_ptr->insert(subproblem);
        }
#if PORTFOLIO_QUEUE
      } else {
        queue_ptr->push(succ_state, i-1, subproblem, worker); // not final, and a subproblem we are still tracking
      }
#else
      } else queue_ptr->push(succ_state, i-1, subproblem); // not final, and a subproblem we are still tracking
#endif
      /*
         } else {
         if (subproblem == PDR::num_subproblems-1) queue.push(succ_state, i-1, PDR::num_subproblems-1); // not final, and a subproblem we are still tracking
         else                                      queue.push(succ_state, i, PDR::num_subproblems-1); // not final, and a subproblem we are still tracking
         }
         */

    }
    successor_states_with_info.pop_back();
  }
  return false;
}


bool handle_nogoods_from_buffer_unsat(Parallel_Buffer* buffer_ptr, PDR::QUEUE_TYPE* queue_ptr, const int* layers, const set<int>* completed_subproblems_ptr) {
  // TODO BEWARE strange return types, true means stop, in this case for UNSAT

  // nogoods
  //vector<tuple<vector<int>, int, int, vector<int>>> unprogressable_states_with_info = buffer.get_unprogressable_states();
  vector<tuple<vector<int>, int, int, int, vector<int>, int, bool>>& unprogressable_states_with_info = buffer_ptr->unprogressable_states;
  //cout << "handling unsat count: " << unprogressable_states_with_info.size() << endl;
  //cout << "num nogoods " << unprogressable_states_with_info.size() << endl;
  while (unprogressable_states_with_info.size()) {
    tuple<vector<int>, int, int, int, vector<int>, int, bool>& unprogressable_state_with_info = *(unprogressable_states_with_info.end()-1);
    vector<int>& original_state = get<0>(unprogressable_state_with_info);
    const int i = get<1>(unprogressable_state_with_info);
    const int subproblem = get<2>(unprogressable_state_with_info);
    const int worker = get<3>(unprogressable_state_with_info);
    vector<int>& unprogressable_state = get<4>(unprogressable_state_with_info);
    const int reduce = get<5>(unprogressable_state_with_info);
    const bool keep_states = get<6>(unprogressable_state_with_info);
    if (PRINT_BUFFER_SIZE) cout << "unsat: layer subproblem reduce keep_states: " << i << " " << subproblem << " " << reduce << " " << keep_states << endl;

    // To do the scheme where you only run a problem after all its subproblems are sat
    //cout << "found nogood subproblem " << subproblem << PDR::state_string(unprogressable_state) << endl;
    //todoprojecting
#if MONOLYTH_WITH_PROJECTIONS
#else
    if (PDR::project_last) {
      if (subproblem != PDR::num_subproblems-1) {
        queue_ptr->a_top_projection_failed();
      }
    }
#endif

    //cout << "found nogood " << PDR::state_string(unprogressable_state) << endl;
    if (unprogressable_state.size() == 0) {
      // Reason size 0, so problem is unsolvable just from the invariants
      cout << "NO PLAN EXISTS (from invariants)" << endl;
      system(("../kill_matching_pdr.sh " + PDR::tmp_dir).c_str());
      return true;
    } else { 
      queue_ptr->remove_states_matching_reason_layer_subproblem(unprogressable_state, i, subproblem);
      PDR::add_reason(unprogressable_state, i, subproblem);
    }
    //#if OBLIGATION_RESCHEDULING
    if (PDR::obligation_rescheduling) {
      if (keep_states) {
        if (i < layers[subproblem]) {
#if PORTFOLIO_QUEUE
          if (completed_subproblems_ptr->find(subproblem) == completed_subproblems_ptr->end()) {
            queue_ptr->push(original_state, i+1, subproblem, worker);
          }
#else
          if (completed_subproblems_ptr->find(subproblem) == completed_subproblems_ptr->end()) queue_ptr->push(original_state, i+1, subproblem);
#endif
        }
      }
    }
    //#endif
    unprogressable_states_with_info.pop_back();
  }
  return false;
}

#if PORTFOLIO_QUEUE
bool populate_buffer_from_queue(Parallel_Buffer* buffer_ptr, PDR::PDR_Portfolio_Queue* queue_ptr, const bool final_subproblem) {
  //cout << "final_subproblem? " << final_subproblem << endl;
  set<int> free_workers = get_free_workers();
  assert(PDR::runtime_dagster);

  if (!queue_ptr->empty()) {
    if (free_workers.size() == 0) return false;
    //cout << free_workers << endl;
    vector<tuple<vector<int>, int, int, int, bool, bool>> considered_states = queue_ptr->pop(free_workers);
    assert(considered_states.size() <= free_workers.size());

    const bool ret_val = considered_states.size() != 0;
    const int num_states_to_add = considered_states.size();
    PDR::workers_to_send_to = set<int>();
    while (considered_states.size()) {
      //const tuple<vector<int>, int, int> considered_state_with_info = *it;
      //tuple<vector<int>, int, int>& considered_state_with_info = considered_states[j];
      tuple<vector<int>, int, int, int, bool, bool> considered_state_with_info = *(considered_states.end()-1);

      vector<int>& s = get<0>(considered_state_with_info);
      const int i = get<1>(considered_state_with_info);
      const int subproblem = get<2>(considered_state_with_info);
      const int worker = get<3>(considered_state_with_info);
      const bool reduce = get<4>(considered_state_with_info);
      const bool keep_state = get<5>(considered_state_with_info);

      if(LOUD) cout << "i: " << i << " considering state: " << PDR::state_string(s) << endl;
      if (P) cout << "(" << i << "," << subproblem << ") ";

      assert(PDR::workers_to_send_to.find(worker) == PDR::workers_to_send_to.end());
      PDR::workers_to_send_to.insert(worker);

      //NEW
      buffer_ptr->add(s, i, subproblem, worker, reduce, keep_state);
      
      considered_states.pop_back();
    }
    assert(PDR::workers_to_send_to.size() == num_states_to_add);
    return ret_val;
  }
  return false;
} 
#else
bool populate_buffer_from_queue(Parallel_Buffer* buffer_ptr, PDR::PDR_Queue* queue_ptr, const bool final_subproblem) {
  //cout << "final_subproblem? " << final_subproblem << endl;
  if (!queue_ptr->empty()) {
    // Get new states from the queue
    set<int> free_workers; // Only used with dagster - otherwise just set to 0

    if (PDR::runtime_dagster) {
      free_workers = get_free_workers();
      if (free_workers.size() == 0) return false;
    } else {
      free_workers.insert(-1);
    }

    //cout << "about to get some off queue: " << endl;
    //cout << "num completed subproblems: " << completed_subproblems.size() << endl;

    // May be empty
    //vector<tuple<vector<int>, int, int>> considered_states = queue.get_states_priority_lower(num_states);
    // NEW
    vector<tuple<vector<int>, int, int, bool, bool>> considered_states;
    if (PDR::project_last) {
      considered_states = queue_ptr->get_projections_of_top_or_top_itself();
    } else if (PDR::complete_nonfinal) {
      if (final_subproblem) considered_states = queue_ptr->get_states_priority_lower(free_workers.size());
      else                  considered_states = queue_ptr->get_states_each_nonfinal_subproblem();
    } else {
      considered_states = queue_ptr->get_states_priority_lower(free_workers.size());
    }

    if (PDR::runtime_dagster) {
      if (considered_states.size() == free_workers.size()) {
        // If got all the states wanted
        PDR::workers_to_send_to = free_workers;
      } else {
        PDR::workers_to_send_to = set<int>();
        for (auto it=free_workers.begin(); it!=free_workers.end(); it++) {
          const int worker = *it;
          PDR::workers_to_send_to.insert(worker);
          if (PDR::workers_to_send_to.size() == considered_states.size()) break;
        }
      }
    }
    
    //cout << "requested states: " << PDR::num_workers << endl;
    //cout << "got back: " << considered_states.size() << endl;
    //cout << "here are the subproblems of the considered states:"<<endl;

    if (P) {
      cout << "About to process a new set of states, BEFORE we do that, the layer info: " << endl;
      if (PDR::runtime_dagster) PDR::dagster_layers.print_reasons();
      else                      PDR::single_layers.print_reasons();
    }

    if (P) cout << "(layer, subproblem) distribution: ";
    set<int> diff_layers;

    if(A)cout << "num considered states:" << considered_states.size() << endl;
    const bool ret_val = considered_states.size() != 0;

    //set<int> workers_to_assign = free_workers;

    while (considered_states.size()) {
      //const tuple<vector<int>, int, int> considered_state_with_info = *it;
      //tuple<vector<int>, int, int>& considered_state_with_info = considered_states[j];
      tuple<vector<int>, int, int, bool, bool> considered_state_with_info = *(considered_states.end()-1);

      vector<int>& s = get<0>(considered_state_with_info);
      const int i = get<1>(considered_state_with_info);
      const int subproblem = get<2>(considered_state_with_info);
      const bool reduce = get<3>(considered_state_with_info);
      const bool keep_state = get<4>(considered_state_with_info);
      diff_layers.insert(i);

      if(LOUD) cout << "i: " << i << " considering state: " << PDR::state_string(s) << endl;
      if (P) cout << "(" << i << "," << subproblem << ") ";

      //const int worker = *workers_to_assign.begin();
      //workers_to_assign.erase(worker);

      const int worker = -1; // as can be assigned anywhere
      
      //NEW
      buffer_ptr->add(s, i, subproblem, worker, reduce, keep_state);
      
      considered_states.pop_back();
    }
    if (P) cout << endl;
    if (P) cout << "diff layers: " << diff_layers.size() << endl;
    return ret_val;
  }
  return false;
} 
#endif


bool push_check_unsat(Parallel_Buffer* buffer_ptr, PDR::QUEUE_TYPE* queue_ptr, const int layer_just_completed, const set<int>& subproblems_to_push, const set<int>& subproblems_to_check) {
  //PDR::single_layers.print_reasons();
  cout << "start push check_unsat subproblems to check:" << subproblems_to_check << ", layer for that: " << layer_just_completed << endl;
  // TODO BEWARE strange return types, true means stop, in this case for UNSAT

  // push clauses, and check if UNSAT
  // False: Unsat (to keep inline with parallel_pdr return value

  //cout << "completed_subproblems:" << completed_subproblems << endl;
  //cout << "checking subproblems:" << subproblems_to_check << endl;
  //PDR::single_layers.print_reasons();
  // <= because considering THIS layer too

  if (LOUD) cout << "start pushing" << endl;
  for (int i=1; i <= layer_just_completed+1; i++) {
#if CLAUSE_PUSHING

    bool buffer_to_process = false;
    for (auto it=subproblems_to_push.begin(); it!=subproblems_to_push.end(); it++) {
      const int subproblem = *it; 
      const set<vector<int>>& unique_reasons = PDR::get_reasons_not_in_next_layer(i-1, subproblem);
      for (auto it = unique_reasons.begin(); it != unique_reasons.end(); it++) {
        const vector<int>& reason = *it;
        buffer_ptr->add(reason, i, subproblem, -1, false, false);
        buffer_to_process = true;
      }
    }

    if (buffer_to_process) {
      if (PDR::runtime_dagster) buffer_ptr->dagster_compute(true);
      else                      buffer_ptr->single_compute();

      // nogoods
      //vector<tuple<vector<int>, int, int, vector<int>>> unprogressable_states_with_info = buffer.get_unprogressable_states();
      vector<tuple<vector<int>, int, int, int, vector<int>, int, bool>>& unprogressable_states_with_info = buffer_ptr->unprogressable_states;
      //cout << "num nogoods " << unprogressable_states_with_info.size() << endl;
      while (unprogressable_states_with_info.size()) {
        tuple<vector<int>, int, int, int, vector<int>, int, bool>& unprogressable_state_with_info = *(unprogressable_states_with_info.end()-1);
        vector<int>& original_state = get<0>(unprogressable_state_with_info);
        const int i = get<1>(unprogressable_state_with_info);
        const int subproblem = get<2>(unprogressable_state_with_info);
        // Deliberately don't retrieve worker, not important here // const int worker = get<3>(unprogressable_state_with_info);
        vector<int>& unprogressable_state = get<4>(unprogressable_state_with_info);
        const int reduce = get<5>(unprogressable_state_with_info);
        const bool keep_states = get<6>(unprogressable_state_with_info);
        assert(!keep_states);
        assert(reduce==0);
        //cout << "found nogood " << PDR::state_string(unprogressable_state) << endl;
        queue_ptr->remove_states_matching_reason_layer_subproblem(unprogressable_state, i, subproblem);
        PDR::add_reason(unprogressable_state, i, subproblem);
        //PDR::single_layers.check();
        unprogressable_states_with_info.pop_back();
      }

      buffer_ptr->successor_states.clear();
    }
#endif
    if (PDR::same_as_previous(i, subproblems_to_check)) {
      cout << "NO PLAN EXISTS" << endl;
      system(("../kill_matching_pdr.sh " + PDR::tmp_dir).c_str());
      //#if LAST_PROJECT_TO_SUBPROBLEMS
      if (PDR::project_last) {
        //cout << "WARNING STOPPING EXIT CRITERIA" << endl;
        return true;
        //#else
      } else {
        return true;
        //#endif
      }
    }
  }
  return false;
}
