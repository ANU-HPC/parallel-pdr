// TODO make layer exist redundancy
// TODO adding this to has_successor makes it far slower/not end
// TODO check out all obligation clas susages, copy?
// TODO neaten tilde clause, prepare for steps
/*
    assert(!use_dagster);
    bool res1 = single_has_successor(state, layer);
    bool res2 = single_has_successor(state, layer);
    bool res3 = single_has_successor(state, layer);
    assert(res1 == res2);
    assert(res3 == res2);
*/

#include "set_trie.h"
#include "timing.h"
#include "queue.h"
#include "property_directed_reachability.h"
#include "parser.h"
#include <vector>
#include <map>
#include <set>
#include <list>
#include <cassert>
#include <stdlib.h> 
#include <string>
#include <sstream>
#include <cstdlib>

#include <iterator>
#include <iomanip>
#include <sstream>

using namespace std;

bool parallel_pdr();

void add_all_layer_zero();

int main(int argc, char **argv) {
  PDR::time_starting_main = clock();

  // parse command line arguments
  const string report_string = string(argv[1]);
  const string parallel_string = string(argv[2]);
  if (report_string == "0") PDR::storing_actions = false;
  else if (report_string == "1") PDR::storing_actions = true;
  else assert(0);
  if (parallel_string == "0") PDR::runtime_dagster = false;
  else if (parallel_string == "1") PDR::runtime_dagster = true;
  else assert(0);
  PDR::tmp_dir = string(argv[3]);
  PDR::read_extra_settings(string(argv[4]));

  if (MS_ONLY_MAX_SOLVER_STEP) PDR::MS_steps_used = PDR::max_macro_steps;
  else                         PDR::MS_steps_used = MS_DEFAULT_STEPS_USED;

#if PORTFOLIO_QUEUE
  if (!PDR::runtime_dagster) {
    cout << "ERROR using portfolio queue in single mode" << endl;
    exit(1);
  }
#endif
  
#if USE_ER
#if !USE_FD_PARSER
    cerr << "ERROR using ER without FD parser" << endl;
    exit(1);
#endif
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

  if (PDR::runtime_dagster) {
    PDR::dagster_start(argc, argv);

    const bool dagster_options_valid =
      (MULTI_STEP_REASON_CALCULATE_AT_ALL == 0) &&
      (MULTI_STEP_REASON_ACTUALLY_USE == 0) &&
      (MULTI_STEP_INTERLEAVED == 0) &&
      (MS_ONLY_MAX_SOLVER_STEP == 1);
    if (!dagster_options_valid) {
      cerr << "ERROR: entering dagster mode with disallowed macro options" << endl;
      exit(1);
    }
  }

  PDR::num_workers = world_size-1;
  for (int worker=0; worker<PDR::num_workers+1; worker++) { // as workers start at 1
    PDR::worker_upper_layer_dagster_clauses_to_add.push_back(vector<vector<vector<int>>>());
    //PDR::workers_to_send_to.insert(worker);
  }

  if (PDR::runtime_dagster) setup_dagster();

  cout << "Read in problem" << endl;
  
  add_all_layer_zero();

  // Set up queue (still not the real one actually being used)
  //PDR::queue = QUEUE_TYPE();

  // Actual PDR process
  QUEUE_TYPE tmp = PDR::queue;
  const bool plan_exists = parallel_pdr();
  PDR::queue = tmp;
  
  if (PDR::storing_actions && plan_exists) PDR::state_actions.print_write_path_final_state();

  //if (PDR::runtime_dagster) PDR::dagster_layers.print_reasons();
  //else                      PDR::single_layers.print_reasons();

  if (PRINT_END_RESULT) {
    if (PDR::runtime_dagster) PDR::dagster_layers.print_reasons();
    else                      PDR::single_layers.print_reasons();
    PDR::BUFFER_print_state_count();
  }
  PDR::timing.print();
  PDR::print_dagster_stats();

  cout << "trying to stop workers" << endl;
  if (PDR::runtime_dagster) PDR::dagster_stop();

  if (!plan_exists && PDR::isolate_subproblems) {
    cout << "trying to stop other isolate_subproblem processes" << endl;
    system(("../isolate_subproblems/kill_matching_pdr.sh " + PDR::tmp_dir).c_str());
  }

  clock_t time_now = clock();
  cout << "total time in main: " << string_float(float_time(time_now-PDR::time_starting_main)) << endl;

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

int sum_over_vector(const vector<int>& x) {
  int sum = 0;
  for (auto it=x.begin(); it!=x.end(); it++) {
    sum += *it;
  }
  return sum;
}

class Parallel_Buffer {
  public:
  // takes in a collection of subproblem, layer, states. gives back a collection of successor state, and nogoods
  //void add(const vector<int> state, int layer, int subproblem, int worker, bool reduce, bool keep_states) {
  void add(const PDR::Obligation obl) {
    if (PRINT_STATES) cout << "adding obligation to buffer " << str(obl) << endl;
    if (obl.reduce) { // as a proxy for "real" states, not just pushing clauses - so do some accounting
      while (PDR::BUFFER_layer_to_subproblem_to_state_count.size() <= obl.layer) {
        PDR::BUFFER_layer_to_subproblem_to_state_count.push_back(vector<int>(PDR::num_subproblems));
      }
      PDR::BUFFER_layer_to_subproblem_to_state_count[obl.layer][obl.subproblem]++;
    }
    to_process.push_back(obl);
    //if(A)cout << "about to add state to buffer:" << endl;
    //if(A)cout << PDR::pos_state_string(state) << endl;
    //if(A)cout << "after adding that state, to_process size: " << to_process.size() << endl;
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
    // Periodic printing updates
    const int obligations_so_far = (sum_over_vector(PDR::dagster_sat_counts) + sum_over_vector(PDR::dagster_unsat_counts));
    if ((obligations_so_far>0) && ((obligations_so_far%20000)==0) && (PDR::last_stats_print_obligations_so_far != obligations_so_far)) {
      PDR::last_stats_print_obligations_so_far = obligations_so_far;
      clock_t time_now = clock();
      cout << "20,000 obligations, printing out stats:" << endl;
      cout << "time since starting main: " << string_float(float_time(time_now-PDR::time_starting_main)) << endl;
      PDR::print_dagster_stats();
      PDR::timing.print();
    }

    // dagster only set up for static constant number of steps
    assert(MS_ONLY_MAX_SOLVER_STEP);

    // if sync solve, will solve every obligation to completion, then return, else will send them off, and check previous ones
    if(A)if (to_process.size()) cout << "start of dagster compute, actually has something: to_process size" << to_process.size() << endl;
    assert((to_process.size() <= PDR::workers_to_send_to.size()) || use_sync_solve);
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
    
    for (auto it=to_process.begin(); it!=to_process.end(); it++) {
      PDR::Obligation& obl = *it; 
      obl.id = get_free_id();
      id_to_extra_info[obl.id] = obl;

      assert(obl.layer > 0); // at 0 we have a goal state

      if (LOUD) cout << "STARTING: processing : " << str(obl) << endl;

      Message *m = new Message(obl.layer-1, obl.subproblem);
      m->id = obl.id;
      m->reduce = (obl.reduce) ? 1 : 0;
      for(int j=0; j<obl.state.size(); j++) m->assignments.push_back(obl.state[j]); // TODO efficiency

      // Just a check
      if (obl.worker != -1) {
        assert(workers_to_send_to_not_checked_off.find(obl.worker) != workers_to_send_to_not_checked_off.end());
        workers_to_send_to_not_checked_off.erase(obl.worker);
      }

      // Send the message off
#if PORTFOLIO_QUEUE
      if (use_sync_solve) {
        assert(obl.worker == -1);
        initial_message(m); // Adds this message to a buffer
      } else {
        assert(obl.worker != -1);
        initial_message(m, obl.worker); // Adds this message to a buffer
      }
#else
      assert(obl.worker == -1);
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
      PDR::Obligation original_obl = id_to_extra_info[id];
      assert(message->reduce == original_obl.reduce); // unknown but in original, keep for now
      /*
      const vector<int>& original_state = get<0>(id_to_extra_info[id]); 
      const int original_state_layer = get<1>(id_to_extra_info[id]);
      const int subproblem = get<2>(id_to_extra_info[id]);
      const int reduce = message->reduce;
      const bool keep_states = id_to_keep_states[id];
      */
      free_ids.push_back(id);
      original_obl.id = -1;
      PDR::dagster_sat_counts[original_obl.subproblem]+=1;

#if PORTFOLIO_QUEUE
      if (!use_sync_solve) assert(worker == original_obl.worker);
#endif

      const pair<vector<vector<int>>, vector<vector<int>>> x = PDR::project_to_state_actions(assignment, original_obl.subproblem, PDR::MS_steps_used);
      const vector<vector<int>>& succ_state_sequence = get<0>(x);
      const vector<vector<int>>& actions_executed_sequence = get<1>(x);
      // BROKEN BY PARTIAL STATES if (original_obl.keep_states && original_obl.subproblem == PDR::num_subproblems-1) assert(succ_state_sequence[0] == original_obl.state); // broken on subproblems?
      for (int timestep = 0; timestep < PDR::MS_steps_used; timestep++) {
        if(LOUD) cout << "single found a successor state, used actions: " << PDR::state_string(actions_executed_sequence[timestep]) << endl;
        if (PDR::storing_actions && original_obl.keep_states && original_obl.subproblem == PDR::num_subproblems-1) {
          if (timestep == 0) PDR::state_actions.add_state(succ_state_sequence[timestep+1], original_obl.state, actions_executed_sequence[timestep], original_obl.subproblem, original_obl.layer+1);
          else               PDR::state_actions.add_state(succ_state_sequence[timestep+1], succ_state_sequence[timestep], actions_executed_sequence[timestep], original_obl.subproblem, original_obl.layer+1);
        }
      }

      PDR::Obligation succ_obl = original_obl;
      succ_obl.layer = original_obl.layer - 1;
      succ_obl.state = succ_state_sequence[PDR::MS_steps_used];

      //cout << "pushing back succ state l:" << original_state_layer << " s: " << subproblem << endl;
      if (PRINT_STATES) cout << "succ_state " << str(succ_obl) << endl;
      successor_states.push_back(tuple<PDR::Obligation, PDR::Obligation>(original_obl, succ_obl));
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

      PDR::Obligation original_obl = id_to_extra_info[id];
      assert(message->reduce == original_obl.reduce); // unknown but in original, keep for now

      /*
      const vector<int>& original_state = get<0>(id_to_extra_info[id]); 
      const int original_state_layer = get<1>(id_to_extra_info[id]);
      const int subproblem = get<2>(id_to_extra_info[id]);
      const int reduce = message->reduce;
      const bool keep_states = id_to_keep_states[id];
      */
      free_ids.push_back(original_obl.id);
      original_obl.id = -1;
      PDR::Obligation reason_obl = original_obl;
      reason_obl.state = used_assumptions;

#if PORTFOLIO_QUEUE
      if (!use_sync_solve) assert(worker == original_obl.worker);
#endif

      unprogressable_states.push_back(tuple<PDR::Obligation, PDR::Obligation>(original_obl, reason_obl));
      delete message;
      PDR::dagster_unsat_counts[original_obl.subproblem]+=1;
    }
    to_process.clear();
  }

  void single_compute() {
    assert(!PDR::runtime_dagster);
    clock_t max_time_spent = 0;
    PDR::parallel_timer.stored_duration = 0;

    while (to_process.size()) {
      const PDR::Obligation original_obl = *(to_process.end()-1);
      to_process.pop_back();
      /*
      const vector<int>& state = get<0>(current_process);
      const int layer = get<1>(current_process);
      const int subproblem = get<2>(current_process);
      const int worker = get<3>(current_process);
      const int reduce = get<4>(current_process);
      const bool keep_states = get<5>(current_process);
      */
      assert(original_obl.reduce == original_obl.keep_states);
      assert(original_obl.worker == -1); // if doing single 

      const vector<int> succ_state = PDR::single_get_successor(original_obl.state, original_obl.layer, original_obl.subproblem, original_obl.reduce);
      if (succ_state.size()) {
        PDR::Obligation succ_obl = original_obl;
        succ_obl.state = succ_state;
#if MULTI_STEP_INTERLEAVED
        succ_obl.layer = succ_obl.layer-PDR::MS_steps_used;
#else
        succ_obl.layer = succ_obl.layer-1;
#endif
        assert(succ_obl.layer >= 0);
        successor_states.push_back(tuple<PDR::Obligation, PDR::Obligation>(original_obl, succ_obl));
      } else {
        vector<int> reason;
        if (original_obl.reduce) reason = PDR::single_get_reason(original_obl.state, original_obl.layer, original_obl.subproblem);
        else                     reason = PDR::single_get_reason_just_used(original_obl.state, original_obl.layer, original_obl.subproblem);

#if MULTI_STEP_REASON_CALCULATE_AT_ALL
#if MS_ONLY_MAX_SOLVER_STEP 
        1DELIBERATE_ERROR // deliberate compiler error - can't calculate special reason when only handling the default number of steps
#endif
        // Try create another reason using more steps
        vector<int> reason2;
        assert(PDR::max_macro_steps == 4); // For the next line randomness
        PDR::MS_steps_used = min(original_obl.layer, 2 + (rand() % 3));
        vector<int> multi_step_succ = PDR::single_get_successor(original_obl.state, original_obl.layer, original_obl.subproblem, original_obl.reduce);
#if MULTI_STEP_INTERLEAVED
        assert(multi_step_succ.size() == 0); // if interleaved, more constrained so this has to be unsat
#endif
        if (multi_step_succ.size() == 0) {
          if (original_obl.reduce) reason2 = PDR::single_get_reason(original_obl.state, original_obl.layer, original_obl.subproblem);
          else                     reason2 = PDR::single_get_reason_just_used(original_obl.state, original_obl.layer, original_obl.subproblem);

          if (PDR::subset(reason, reason2)) {
            assert (reason2.size() <= reason.size());
            if (reason2.size() == reason.size()) assert(reason == reason2);

#if MULTI_STEP_REASON_ACTUALLY_USE
            // Do (or don't) then use this subset reason
            cout << "subset reason replacement" << endl;
            reason = reason2;
#endif
          }
        }
#endif
        if (P) cout << "reason (" << original_obl.layer << "," << original_obl.subproblem << ") " << PDR::state_string(reason) << endl;

        //cout << "generated reason (subproblem: " << subproblem << ") : " << state.size() << " -> " << reason.size() << " : " << PDR::state_string(reason) << endl;

        PDR::Obligation reason_obl = original_obl;
        reason_obl.state = reason;
        unprogressable_states.push_back(tuple<PDR::Obligation, PDR::Obligation>(original_obl, reason_obl));
      }

      max_time_spent = max(max_time_spent, PDR::parallel_timer.stored_duration);
      PDR::parallel_timer.stored_duration = 0;

    }
    PDR::total_parallel_time_spent += max_time_spent;
  }

  int waiting_on_results() {
    return number_being_processed;
  }

  vector<tuple<PDR::Obligation, PDR::Obligation>> successor_states;
  vector<tuple<PDR::Obligation, PDR::Obligation>> unprogressable_states;
  private:

  int number_being_processed = 0; // The number of states currently being processed in parallel
  int next_new_id = 0;
  vector<int> free_ids; // ids once assigned, now are free to use
  map<int,bool> id_to_keep_states;
  map<int,PDR::Obligation> id_to_extra_info;
  vector<PDR::Obligation> to_process;
};

bool push_check_unsat(Parallel_Buffer* buffer_ptr, const int layer_just_completed, const set<int>& subproblems_to_push, const set<int>& subproblems_to_check);

bool handle_nogoods_from_buffer_unsat(Parallel_Buffer* buffer_ptr, const int* layers, const set<int>* completed_subproblems_ptr);

bool handle_successor_states_from_buffer_sat(Parallel_Buffer* buffer_ptr, const int layer, set<int>* completed_subproblems_ptr, set<int>* newly_completed_subproblems_ptr);

bool populate_buffer_from_queue(Parallel_Buffer* buffer_ptr, const bool final_subproblem);



bool parallel_pdr() {
  assert(PDR::extra_settings_read);
  vector<vector<int>> subproblem_to_projected_initial_state;
  set<int> completed_subproblems;

  // Do manual check to see if initial state is allowed in the goal
  bool all_trivial = true;
  for (int subproblem = 0; subproblem < PDR::num_subproblems; subproblem++) {
    const vector<int>& projected_initial_state = PDR::project_state_to_propositions(PDR::initial_state, PDR::subproblem_to_propositions[subproblem]);
    assert(projected_initial_state.size() == PDR::initial_state.size());

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
    return false;
  }

  // first do lower subproblems, then do the final subproblem

  // set up objects
  int layers[PDR::num_subproblems];
  for (int subproblem=0; subproblem<PDR::num_subproblems; subproblem++) layers[subproblem] = 0;
  PDR::make_layer_exist(0);

  // Have to do this in 2 steps, unknown why
  QUEUE_TYPE to_be_put_in_PDR_queue = QUEUE_TYPE(layers + PDR::num_subproblems-1);
  PDR::queue = to_be_put_in_PDR_queue;

  // UNKNOWN why have to do above not below
  //PDR::queue = QUEUE_TYPE(layers + PDR::num_subproblems-1);


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
    if (handle_successor_states_from_buffer_sat(&buffer, layers[PDR::num_subproblems-1], &completed_subproblems, &new_completed_subproblems)) return true;
    if (handle_nogoods_from_buffer_unsat(&buffer, layers, &completed_subproblems)) return false;

    // complete_nonfinal: For problems newly completed, push them
    for (auto it=new_completed_subproblems.begin(); it!=new_completed_subproblems.end(); it++) {
      const int subproblem = *it;
      set<int> subproblems_to_push;
      set<int> subproblems_to_check;
      subproblems_to_push.insert(subproblem);
      subproblems_to_check.insert(subproblem); // TODO eventually not useful
      //cout << "WARNING: STOPPING CHECKING, PUSHING" << endl;
      const bool should_exit = push_check_unsat(&buffer, layers[subproblem]-1, subproblems_to_push, subproblems_to_check); // -1 as it doesn't have the final unsat at the starting layer
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
            if (PDR::queue.empty_for_subproblem(subproblem) && buffer.waiting_on_results() == 0) {
              cout << "TODO should be checking PER subproblem in this case" << endl;
              // completed it for this layer, so push and check
              set<int> subproblems_to_push;
              set<int> subproblems_to_check;
              subproblems_to_push.insert(subproblem);
              subproblems_to_check.insert(subproblem);
              //cout << "WARNING: STOPPING CHECKING, PUSHING" << endl;
              if (push_check_unsat(&buffer, layers[subproblem], subproblems_to_push, subproblems_to_check)) return false;
              layers[subproblem]++;
              PDR::make_layer_exist(layers[subproblem]+1);

              // Then add some more
              const vector<int>& projected_initial_state = subproblem_to_projected_initial_state[subproblem];
              if (projected_initial_state.size()) {
                assert(projected_initial_state.size() == PDR::initial_state.size()); // Review if revisiting subproblems
#if PORTFOLIO_QUEUE
      // THE PUSHING WITH PORTFOLIOS IS NOT SET UP FOR THIS
                exit(1);
#else
                PDR::queue.push(projected_initial_state, layers[subproblem], subproblem);
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
      if (PDR::queue.empty_for_subproblem(PDR::num_subproblems-1) && buffer.waiting_on_results() == 0) {
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
          if (push_check_unsat(&buffer, layers[subproblem], subproblems_to_push, subproblems_to_check)) return false;
        }
        layers[subproblem]++;
        PDR::make_layer_exist(layers[subproblem]+1);

        // Then add some more
        const vector<int>& projected_initial_state = subproblem_to_projected_initial_state[subproblem];
        if (projected_initial_state.size()) {
          assert(projected_initial_state.size() == PDR::initial_state.size()); // review if revisiting subproblems
#if PORTFOLIO_QUEUE
          for (int worker = 1; worker<PDR::num_workers+1; worker++) PDR::queue.push(projected_initial_state, layers[subproblem], subproblem, worker);
#else
          PDR::queue.push(projected_initial_state, layers[subproblem], subproblem);
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
    populate_buffer_from_queue(&buffer, final_subproblem);
    if (PRINT_BUFFER_SIZE) cout << "to process: " << buffer.input_to_process() << endl;
    if (PDR::runtime_dagster) buffer.dagster_compute(false);
    else                      buffer.single_compute();
  } // end main loop
  // shouldn't get here
  assert(0);
  return false;
}

float mean(vector<int> x) {
    long int sum = 0;

    for (auto it=x.begin(); it!=x.end(); it++) {
        sum += *it; 
    }
    return float(sum)/float(x.size());
}

bool handle_successor_states_from_buffer_sat(Parallel_Buffer* buffer_ptr, const int layer, set<int>* completed_subproblems_ptr, set<int>* newly_completed_subproblems_ptr) {
  // TODO BEWARE strange return types, true means stop, in this case for SAT

  //vector<tuple<vector<int>, int, int, vector<int>>> successor_states_with_info = buffer.get_successor_states();
  vector<tuple<PDR::Obligation, PDR::Obligation>>& successor_states_with_info = buffer_ptr->successor_states;//get_successor_states();
  //cout << "num succ states " << successor_states_with_info.size() << endl;
  //cout << "handling sat count: " << successor_states_with_info.size() << endl;
  while(successor_states_with_info.size()) {
    tuple<PDR::Obligation, PDR::Obligation>& successor_state_with_info = *(successor_states_with_info.end()-1);
    PDR::Obligation original_obl = get<0>(successor_state_with_info);
    PDR::Obligation succ_obl = get<1>(successor_state_with_info);

    vector<int>& original_state = original_obl.state;
    const int i = original_obl.layer;
    const int subproblem = original_obl.subproblem;
    const int worker = original_obl.worker;
    vector<int>& succ_state = succ_obl.state;
    const int reduce = original_obl.reduce;
    const bool keep_states = original_obl.keep_states;
    if (PRINT_BUFFER_SIZE) cout << "sat: layer subproblem reduce keep_states: " << i << " " << subproblem << " " << reduce << " " << keep_states << endl;

    if (keep_states) {
#if MONOLYTH_WITH_PROJECTIONS
      if ((subproblem == PDR::num_subproblems-1) && (reduce == 0)) {
        // as a proxy for the monolythic case
        assert(original_state == get<0>(PDR::queue.contemplated_monolyth));
        PDR::queue.monolyth_succeeded();
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
      PDR::queue.push(original_state, i, subproblem, worker);
#else
      PDR::queue.push(original_state, i, subproblem);
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
          cout << "num reasons found " << PDR::reason_num_sat_calls.size() << endl;
          cout << "average sat calls per reason (main finding) " << mean(PDR::reason_num_sat_calls) << endl;

          if (PRINT_END_RESULT) PDR::queue.print_size();
          if (PDR::storing_actions) PDR::state_actions.set_final_state(succ_state, subproblem);
          else cout << "WAS NOT STORING ACTIONS" << endl;
          return true;
        } else {
          // solved a subproblem
          completed_subproblems_ptr->insert(subproblem);
          PDR::queue.remove_subproblem(subproblem);

          // new subproblem solver
          newly_completed_subproblems_ptr->insert(subproblem);
        }
#if PORTFOLIO_QUEUE
      } else {
        PDR::queue.push(succ_state, i-1, subproblem, worker); // not final, and a subproblem we are still tracking
      }
#else
      } else PDR::queue.push(succ_state, i-1, subproblem); // not final, and a subproblem we are still tracking
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


bool handle_nogoods_from_buffer_unsat(Parallel_Buffer* buffer_ptr, const int* layers, const set<int>* completed_subproblems_ptr) {
  // TODO BEWARE strange return types, true means stop, in this case for UNSAT

  // nogoods
  //vector<tuple<vector<int>, int, int, vector<int>>> unprogressable_states_with_info = buffer.get_unprogressable_states();
  vector<tuple<PDR::Obligation, PDR::Obligation>>& unprogressable_states_with_info = buffer_ptr->unprogressable_states;
  //cout << "handling unsat count: " << unprogressable_states_with_info.size() << endl;
  //cout << "num nogoods " << unprogressable_states_with_info.size() << endl;
  while (unprogressable_states_with_info.size()) {
    tuple<PDR::Obligation, PDR::Obligation>& unprogressable_state_with_info = *(unprogressable_states_with_info.end()-1);
    PDR::Obligation original_obl = get<0>(unprogressable_state_with_info);
    PDR::Obligation reason_obl = get<1>(unprogressable_state_with_info);

    vector<int>& original_state = original_obl.state;
    const int i = original_obl.layer;
    const int subproblem = original_obl.subproblem;
    const int worker = original_obl.worker;
    vector<int>& unprogressable_state = reason_obl.state;
    const int reduce = original_obl.reduce;
    const bool keep_states = original_obl.reduce;

    // To do the scheme where you only run a problem after all its subproblems are sat
    //cout << "found nogood subproblem " << subproblem << PDR::state_string(unprogressable_state) << endl;
    //todoprojecting
#if MONOLYTH_WITH_PROJECTIONS
#else
    if (PDR::project_last) {
      if (subproblem != PDR::num_subproblems-1) {
        PDR::queue.a_top_projection_failed();
      }
    }
#endif

    //cout << "found nogood " << PDR::state_string(unprogressable_state) << endl;
    if (unprogressable_state.size() == 0) {
      // Reason size 0, so problem is unsolvable just from the invariants
      cout << "NO PLAN EXISTS (from invariants)" << endl;
      return true;
    } else { 
      PDR::queue.remove_states_matching_reason_layer_subproblem(unprogressable_state, i, subproblem);
      PDR::add_reason(unprogressable_state, i, subproblem);
    }
    //#if OBLIGATION_RESCHEDULING
    if (PDR::obligation_rescheduling) {
      if (keep_states) {
        if (i < layers[subproblem]) {
#if PORTFOLIO_QUEUE
          if (completed_subproblems_ptr->find(subproblem) == completed_subproblems_ptr->end()) {
            PDR::queue.push(original_state, i+1, subproblem, worker);
          }
#else
          if (completed_subproblems_ptr->find(subproblem) == completed_subproblems_ptr->end()) PDR::queue.push(original_state, i+1, subproblem);
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
bool populate_buffer_from_queue(Parallel_Buffer* buffer_ptr, const bool final_subproblem) {
  //cout << "final_subproblem? " << final_subproblem << endl;
  set<int> free_workers = get_free_workers();
  assert(PDR::runtime_dagster);

  if (!(PDR::queue.empty())) {
    if (free_workers.size() == 0) return false;
    //cout << free_workers << endl;
    vector<tuple<vector<int>, int, int, int, bool, bool>> considered_states = PDR::queue.pop(free_workers);
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
      PDR::Obligation obl;
      obl.state = s;
      obl.layer = i;
      obl.subproblem = subproblem;
      obl.worker = worker;
      obl.reduce = reduce;
      obl.keep_states = keep_state;
      buffer_ptr->add(obl);
      
      considered_states.pop_back();
    }
    assert(PDR::workers_to_send_to.size() == num_states_to_add);
    return ret_val;
  }
  return false;
} 
#else
bool populate_buffer_from_queue(Parallel_Buffer* buffer_ptr, const bool final_subproblem) {
  //cout << "final_subproblem? " << final_subproblem << endl;
  if (!(PDR::queue.empty())) {
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
    vector<tuple<vector<int>, int, int, bool, bool>> considered_states = PDR::queue.pop(free_workers.size());

    assert(!PDR::project_last && !PDR::complete_nonfinal); // As the options for these have been removed (below)
    /*
    if (PDR::project_last) {
      considered_states = queue_ptr->get_projections_of_top_or_top_itself();
    } else if (PDR::complete_nonfinal) {
      if (final_subproblem) considered_states = queue_ptr->get_states_priority_lower(free_workers.size());
      else                  considered_states = queue_ptr->get_states_each_nonfinal_subproblem();
    } else {
      considered_states = queue_ptr->get_states_priority_lower(free_workers.size());
    }
    */

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
      PDR::Obligation obl;
      obl.state = s;
      obl.layer = i;
      obl.subproblem = subproblem;
      obl.worker = worker;
      obl.reduce = reduce;
      obl.keep_states = keep_state;
      buffer_ptr->add(obl);
      
      considered_states.pop_back();
    }
    if (P) cout << endl;
    if (P) cout << "diff layers: " << diff_layers.size() << endl;
    return ret_val;
  }
  return false;
} 
#endif


bool push_check_unsat(Parallel_Buffer* buffer_ptr, const int layer_just_completed, const set<int>& subproblems_to_push, const set<int>& subproblems_to_check) {
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

        PDR::Obligation obl;
        obl.state = reason;
        obl.layer = i;
        obl.subproblem = subproblem;
        obl.worker = -1;
        obl.reduce = false;
        obl.keep_states = false;
        buffer_ptr->add(obl);
        buffer_to_process = true;
      }
    }

    if (buffer_to_process) {
      if (PDR::runtime_dagster) buffer_ptr->dagster_compute(true);
      else                      buffer_ptr->single_compute();

      // nogoods
      //vector<tuple<vector<int>, int, int, vector<int>>> unprogressable_states_with_info = buffer.get_unprogressable_states();
      vector<tuple<PDR::Obligation, PDR::Obligation>>& unprogressable_states_with_info = buffer_ptr->unprogressable_states;
      //cout << "num nogoods " << unprogressable_states_with_info.size() << endl;
      while (unprogressable_states_with_info.size()) {
        tuple<PDR::Obligation, PDR::Obligation>& unprogressable_state_with_info = *(unprogressable_states_with_info.end()-1);
        PDR::Obligation original_obl = get<0>(unprogressable_state_with_info);
        PDR::Obligation reason_obl = get<1>(unprogressable_state_with_info);

        assert(original_obl.reduce == 0);
        assert(!original_obl.keep_states);

        //vector<int>& original_state = get<0>(unprogressable_state_with_info);
        //const int i = get<1>(unprogressable_state_with_info);
        //const int subproblem = get<2>(unprogressable_state_with_info);
        // Deliberately don't retrieve worker, not important here // const int worker = get<3>(unprogressable_state_with_info);
        //vector<int>& unprogressable_state = get<4>(unprogressable_state_with_info);
        //const int reduce = get<5>(unprogressable_state_with_info);
        //const bool keep_states = get<6>(unprogressable_state_with_info);

        //cout << "found nogood " << PDR::state_string(unprogressable_state) << endl;
        PDR::queue.remove_states_matching_reason_layer_subproblem(original_obl.state, original_obl.layer, original_obl.subproblem);
        PDR::add_reason(original_obl.state, original_obl.layer, original_obl.subproblem);
        //PDR::single_layers.check();
        unprogressable_states_with_info.pop_back();
      }

      buffer_ptr->successor_states.clear();
    }
#endif
#if MULTI_STEP_INTERLEAVED
    cout << "WARNING multi step convergance testing" << endl;
    bool many_same = false;
    if (i >= PDR::max_macro_steps) {
      many_same = true;
      for (int check_back=0; check_back<PDR::max_macro_steps; check_back++) {
        many_same = many_same && PDR::same_as_previous(i + check_back, subproblems_to_check);
      }
    }
    if (many_same) { 
#else
    if (PDR::same_as_previous(i, subproblems_to_check)) {
#endif
      cout << i << endl;
      cout << "NO PLAN EXISTS" << endl;
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
