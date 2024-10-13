#include "Strategies.h"

void Strategies::manage_per_inbox_check_periodic_stats(int reasons_size, int successes_size) {
  // stats on how busy the orchestrator is
  get_results_iteration++;
  reasons_count += reasons_size;
  successes_count += successes_size;
  const int interval = 10000;

  if (successes_count%interval == 0) {
    LOG << "periodic controller update: to get the last " << interval << " successes, it took " << get_results_iteration-successes_count_iteration_checkpoint << " check cycles " << endl;
    successes_count_iteration_checkpoint = get_results_iteration;
    successes_count++;
  }

  if (reasons_count%interval == 0) {
    LOG << "periodic controller update: to get the last " << interval << " reasons, it took " << get_results_iteration-reasons_count_iteration_checkpoint << " check cycles " << endl;
    reasons_count_iteration_checkpoint = get_results_iteration;
    reasons_count++;
  }

  const int results = reasons_size + successes_size;
  if (results == 1) {
    one_worker_results++;
    if (one_worker_results == interval) {
      LOG << "periodic controller update: in getting the last " << interval << " return values from the worker with only one result, on " << more_than_one_worker_results << " occasions there was more than one result" << endl;
      one_worker_results = 0;
      more_than_one_worker_results = 0;
    }
  } else if (results > 1) {
    more_than_one_worker_results++;
  }
}

void Strategies::print_elapsed_time() {
  // first consider printing the elapsed time, so stdout shows how much time has elapsed
  if (Global::problem.evaluation_mode) {
    uint64_t epoch_time = chrono::duration_cast<chrono::seconds>(chrono::system_clock::now().time_since_epoch()).count();
    uint64_t elapsed_time = epoch_time - Global::problem.start_epoch_time;
    if (elapsed_time > already_displayed_elapsed_time) {
      already_displayed_elapsed_time = elapsed_time;
      cout << "TOTAL_RUNNING_TIME(s): " << elapsed_time << endl;
    }
  }
}

bool Strategies::whole_reachability_graph_scc_refresh() {
  LOG << "START Full scc refresh" << endl;
  unordered_set<int> goal_reaching_states = goal_reachability_manager.scc_find_newly_goal_reaching_states(successes_since_last_scc_refresh, vector<int>(), false);
  for (auto it=goal_reaching_states.begin(); it!=goal_reaching_states.end(); it++) {
    queue.register_goal_reaching_state(Compressed_State::state_id_to_state(*it));
    if (*it == 0) {
      LOG << "found a plan in a full SCC refresh" << endl;
      if (!Global::problem.evaluation_mode) worker_interface.finalize();
      goal_reachability_manager.print();
      return true;
    }
  }
  successes_since_last_scc_refresh.clear();
  LOG << "STOP Full scc refresh" << endl;
  return false;
}

bool Strategies::keep_processing() {

  
  //while (!queue.fully_empty() || !worker_interface.all_workers_idle() || (full_scc_refresh_loop_count != 1)) {

  //LOG << "queue.fully_empty() " << queue.fully_empty() << endl;
  //LOG << "worker_interface.all_workers_idle() " << worker_interface.all_workers_idle() << endl;

  if (!queue.fully_empty()) return true;
  if (!worker_interface.all_workers_idle()) return true;

  if (CHEAP_NON_SCC_CHECK_RATE == 1) return false; // everything is up to code, checking every time, so if there is nothing to do then there is truelly nothing to do

  if (whole_reachability_graph_scc_refresh_loop_count==0) return false;

  return true;

  LOG << "ERROR" << endl;
  exit(1);
  return false;

  // now, keep going in the loop if there is a possibility of a deadlock (is not doing a proper scc check every time)
  //!queue.fully_empty() || !worker_interface.all_workers_idle() || ((full_scc_refresh_loop_count != 1) && (CHEAP_NON_SCC_CHECK_RATE != 1))
}



bool Strategies::run_default() {
  LOG << "NOTE: state action graph getting repeated aditions" << endl;
  LOG << "using random heuristic" << endl;
  Global::active_heuristics = set<int>({Heuristics::NONE, Heuristics::RANDOM});

  // is very expensive to pass through
  queue.inform_of_global_reachability_graph(goal_reachability_manager.get_global_graph());
  goal_reachability_manager.inform_of_layer_graph(queue.get_layer_graph());

  // tmp unpackers
  tuple<int, Success> worker_success;
  tuple<int, Reason_From_Worker> worker_reason;

  // add the goal to the reasons object
  for (auto it=Global::problem.goal_condition.begin(); it!=Global::problem.goal_condition.end(); it++) {
    vector<int> bad_state = vector<int>({-*it});
    Contextless_Reason reason = Contextless_Reason(bad_state, 0, 0);
    layers.add_reason(reason);
  }

  // Create the initial state to create initial obligations
  Compressed_State initial_state = Compressed_State(Global::problem.initial_state, 0, true);
  Compressed_State::set_initial_state(initial_state);

  // check if trivially satisfied
  if (initial_state.is_goal()) {
    LOG << "trivially SAT" << endl;
    if (!Global::problem.evaluation_mode) worker_interface.finalize();
    goal_reachability_manager.print();
    return true;
  }

  LOG << "initial state: " << initial_state.to_string() << endl;

  for(int k=1;; k++) {
    LOG << "starting layer k: " << k << endl;

    worker_interface.reset_nondeterministic_solvers_for_new_k(k, false);

    // add the goal to the reasons object
    layers.clear();
    for (auto it=Global::problem.goal_condition.begin(); it!=Global::problem.goal_condition.end(); it++) {
      vector<int> bad_state = vector<int>({-*it});
      Contextless_Reason reason = Contextless_Reason(bad_state, 0, 0);
      layers.add_reason(reason);
    }

    queue.reset_seen_goal_reaching();

    // Put the initial state in the queue
    Obligation initial_obligation = Obligation(initial_state, 1, 0, true, vector<int>());
    queue.push_initial(initial_obligation, k);

    LG(ST) << "pushing initial obligation to the queue: " << initial_obligation.to_string() << endl;

    // Process it
    while (keep_processing()) {
      //LOG << "INT start main loop" << endl;
      if (Global::problem.evaluation_mode) print_elapsed_time();
      // add some more work
      bool taken_off_queue = false;
      const set<int> workers = worker_interface.workers_wanting_work_snapshot();
      for (auto it=workers.begin(); it!=workers.end(); it++) {
        const int worker = *it;
        if (queue.available_work()) {
          // special requirement, if the queue does not have something available, don't bother here

          if (Utils::worker_to_steps(worker)>queue.lowest_layer_with_content()) continue;
          const Obligation& obligation = queue.pop(Heuristics::RANDOM);
          //LOG << "to process: " << obligation.to_string() << endl;
          LG(ST) << "gotten off the queue to process: " << obligation.to_string() << endl;
          worker_interface.handle_obligation(obligation, false, worker);
          taken_off_queue = true;
        }
      }

      // get the results from the worker_interface
      worker_interface.process_inbox();
      vector<tuple<int, Success>>* worker_successes = worker_interface.get_returned_successes_buffer();
      vector<tuple<int, Reason_From_Worker>>* worker_reasons = worker_interface.get_returned_reasons_buffer();

      // if doing something, then get closer to doing a full SCC refresh, don't update the counter if just busy waiting
      if (taken_off_queue  | (worker_successes->size()!=0) | (worker_reasons->size()!=0)) whole_reachability_graph_scc_refresh_loop_count++;

      if ((!taken_off_queue) & worker_interface.all_workers_idle()) {
        // stuck in a deadlock because there is nothing to do, so trigger a full SCC refresh
        LOG << "trigger full refresh" << endl;
        whole_reachability_graph_scc_refresh_loop_count = WHOLE_REACHABILITY_GRAPH_SCC_REFRESH_RATE;
      }

      if (Global::problem.nondeterministic & whole_reachability_graph_scc_refresh_loop_count == WHOLE_REACHABILITY_GRAPH_SCC_REFRESH_RATE) {
        if (whole_reachability_graph_scc_refresh()) {
          if (!Global::problem.evaluation_mode) worker_interface.finalize();
          return true;
        }
        whole_reachability_graph_scc_refresh_loop_count = 0;
      }

      // some periodic stats reporting
      manage_per_inbox_check_periodic_stats(worker_successes->size(), worker_reasons->size());

      // handle successes
      for (auto ita=worker_successes->begin(); ita!=worker_successes->end(); ita++) {
        worker_success = *ita;
        const Success& success = get<1>(worker_success);

        LG(ST) << "got back success: " << success.to_string() << endl;

        assert(success.original_obligation().reduce_reason_add_successor_to_queue());

        if (!Global::problem.nondeterministic) deterministic_plan_builder.register_success(success);

        // for nondeterminism
        set<int> new_goal_reaching_states;
        vector<int> outcome_state_ids;

        const vector<Obligation>& successor_obligations = success.successor_obligations();
        for (auto itb=successor_obligations.begin(); itb!=successor_obligations.end(); itb++) {
          const Obligation& successor_obligation = *itb;
          assert(successor_obligation.reduce_reason_add_successor_to_queue());

          // what to do if an obligation is at layer 0, depends on if deterministic or not
          if (successor_obligation.layer() == 0) {
            if (Global::problem.nondeterministic) {
              outcome_state_ids.push_back(successor_obligation.compressed_state().id());

              if (!goal_reachability_manager.goal_reaching_state(successor_obligation.compressed_state().id())) {
                const unordered_set<int> extra = goal_reachability_manager.register_pure_goal_return_new_goal_states(successor_obligation.compressed_state());

                // add these extras to the newly found goal states
                new_goal_reaching_states.insert(extra.begin(), extra.end());

                // and the goal state itself
                new_goal_reaching_states.insert(successor_obligation.compressed_state().id()); 
              }
            } else {
              deterministic_plan_builder.write_plan(success);
              if (!Global::problem.evaluation_mode) worker_interface.finalize();
              return true;
            }
          }
        }

        if (Global::problem.nondeterministic && success.actions().size() != 0) { // only for "real" successes
          successes_since_last_scc_refresh.push_back(success);

          // register the arc
          assert(success.actions().size()==1); // only one action should have been executed
          assert(success.actions()[0].get_actions().size()==1); // only one action should have been executed

          const unordered_set<int> extra = goal_reachability_manager.register_success_return_new_goal_states(success);

          new_goal_reaching_states.insert(extra.begin(), extra.end());

          // we now have a set of states which are newly goal reaching, if one is the initial state we have a solution
          // otherwise remove them all from the queue
          if (new_goal_reaching_states.find(Compressed_State::initial_state_id()) != new_goal_reaching_states.end()) {
            // a plan exists!
            if (!Global::problem.evaluation_mode) worker_interface.finalize();
            LOG << "A NONDETERMINISTIC PLAN EXISTS" << endl;
            goal_reachability_manager.print();
            return true;
          } else {
            // remove these from the queue
            for (auto it=new_goal_reaching_states.begin(); it!=new_goal_reaching_states.end(); it++) {
              const int state_id = *it; 
              const Compressed_State& new_goal_reaching_state = Compressed_State::state_id_to_state(state_id);
              //LOG << "about to trim from the queue the state (as goal reaching): " << new_goal_reaching_state.to_string() << endl;
              queue.register_goal_reaching_state(new_goal_reaching_state);
            }
          }
        }

        queue.register_success(success);
      }

      // handle reasons
      for (auto it=worker_reasons->begin(); it!=worker_reasons->end(); it++) {
        worker_reason = *it; 
        const Reason_From_Worker& reason_from_worker = get<1>(worker_reason);
        const Contextless_Reason& reason = reason_from_worker.contextless_reason();

        LG(ST) << "got back reason " << reason.to_string() << endl;

        const int layers_to_add_to = layers.add_reason(reason);

        queue.register_reason(reason_from_worker, k);

        if (layers_to_add_to) {
          //queue.trim(reason, k); // TODO trim only the newly constrained layers, don't need to check the others
          worker_interface.handle_reason_all_workers(Reason_From_Orchestrator(reason, reason.layer()-layers_to_add_to+1));
        }
      }

      // manually clear these buffers
      worker_reasons->clear();
      worker_successes->clear();
    }

    LOG << "should be 1: " << whole_reachability_graph_scc_refresh_loop_count << endl;

    //LOG << "before pushing" << endl;
    //layers.print();

    //if (Global::problem.nondeterministic) worker_interface.reset_nondeterministic_solvers_for_new_k(k+1, false);

    // completed the k, lets do a convergance check and clause pushing

    int converged_at = -1;

    for (int layer=1; layer<=k+1; layer++) {
      LOG << "Clause pushing turned off in nondeterminism for now" << endl;

#define PUSH 0
#if PUSH == 1
      auto reasons_to_push = layers.reasons_not_in_next_layer(layer-1);

      // get all the "obligations"
      vector<Obligation> push;
      for (auto it=reasons_to_push->begin(); it!=reasons_to_push->end(); it++) {
        const Contextless_Reason& reason = *it;
        push.push_back(Obligation(Compressed_State(reason.reason(), 0, false), layer, 0, false, vector<int>()));
      }

      // send them all off
      while (push.size()) {
        worker_interface.process_inbox();
        const set<int> workers = worker_interface.workers_wanting_work_snapshot();
        for (auto it=workers.begin(); it!=workers.end(); it++) {
          const int worker = *it; 

          if (Utils::worker_to_steps(worker) != 1) continue;

          if (push.size()) {
            const Obligation& obligation = *push.rbegin();
            worker_interface.handle_obligation(obligation, false, worker);
            push.pop_back();
          }
        }
      }

      // wait until all the work is completed
      while (!worker_interface.all_workers_idle()) { 
        worker_interface.process_inbox();
      }

      // get the results
      vector<tuple<int, Success>>* worker_successes = worker_interface.get_returned_successes_buffer();
      vector<tuple<int, Reason_From_Worker>>* worker_reasons = worker_interface.get_returned_reasons_buffer();

      // process the results
      for (auto it=worker_reasons->begin(); it!=worker_reasons->end(); it++) {
        worker_reason = *it; 
        const Reason_From_Worker& reason_from_worker = get<1>(worker_reason);
        const Contextless_Reason& reason = reason_from_worker.contextless_reason();

        if (layers.add_reason(reason)) {
          const Reason_From_Orchestrator reason_from_orchestrator = Reason_From_Orchestrator(reason, reason.layer());
          worker_interface.handle_reason_all_workers(reason_from_orchestrator);
        } else LOG << "WARNING: look into this" << endl;
      }

      // manually clear these buffers
      worker_reasons->clear();
      worker_successes->clear();

      // convergence check
      LOG << "after pushing" << endl;
#endif

      int x = goal_reachability_manager.get_global_graph()->approx_num_nodes();
      LOG << "num states seen so far overall: " << x << endl;

      // !Global::problem.nondeterministic && 
      if (layers.same_as_previous(layer)) {
        layers.print_sizes();
        LOG << "converged as layer " << layer << " is the same as the previous one" << endl;
        if (!Global::problem.nondeterministic) {
          if (!Global::problem.evaluation_mode) worker_interface.finalize();
          return false;
        } else {
          LOG << "so, lets push everything up, then go to the next layer" << endl;
          if (converged_at == -1) converged_at = layer;
        }
      }
    }

    if (converged_at != -1) {
      LOG << "entering the special mode" << endl;
      LOG << "collate/push up layers" << endl;
      for (int layer=converged_at; layer<k; layer++) {
        LOG << "deadling with clauses at layer " << layer << " not in the layer after" << endl;
        unordered_set<Contextless_Reason, Contextless_Reason_Hash>* reasons = layers.reasons_not_in_next_layer(layer);

        vector<Contextless_Reason> to_add;

        for (auto it=reasons->begin(); it!=reasons->end(); it++) {
          Contextless_Reason base_reason = *it;
          Contextless_Reason reason = Contextless_Reason(base_reason.reason(), base_reason.layer()+1, 0);
          to_add.push_back(reason);
        }

        for (auto it=to_add.begin(); it!=to_add.end(); it++) {
          Contextless_Reason reason = *it;

          const int layers_to_add_to = layers.add_reason(reason);

          if (layers_to_add_to) {
            worker_interface.handle_reason_all_workers(Reason_From_Orchestrator(reason, reason.layer()-layers_to_add_to+1));
          }
        }
      }
      LOG << "pushed up all the clauses (hopefully), what does it look like:" << endl;
      layers.print_sizes();

      LOG << "now, lets increment k to " << k+1 << " and see if we can push all the clauses" << endl;
      worker_interface.reset_nondeterministic_solvers_for_new_k(k+1, true);

      unordered_set<Contextless_Reason, Contextless_Reason_Hash>* reasons = layers.reasons_not_in_next_layer(k);
      vector<Obligation> to_try_confirm_as_unsat_obligations;
      for (auto it=reasons->begin(); it!=reasons->end(); it++) {
        const Contextless_Reason& reason = *it;
        to_try_confirm_as_unsat_obligations.push_back(Obligation(Compressed_State(reason.reason(), 0, false), k+1, 0, false, vector<int>()));
      }

      LOG << "got them all, now lets see if they are all UNSAT obligations, we will do this in a fixpoint style" << endl;

      bool change = true;
      while (change && (to_try_confirm_as_unsat_obligations.size())) {
        change = false;
        LOG << "sending off: " << to_try_confirm_as_unsat_obligations.size() << endl;
        while (to_try_confirm_as_unsat_obligations.size()) {
          worker_interface.process_inbox();
          const set<int> workers = worker_interface.workers_wanting_work_snapshot();
          for (auto it=workers.begin(); it!=workers.end(); it++) {
            const int worker = *it; 

            if (Utils::worker_to_steps(worker) != 1) continue;

            if (to_try_confirm_as_unsat_obligations.size()) {
              const Obligation& obligation = *to_try_confirm_as_unsat_obligations.rbegin();
              worker_interface.handle_obligation(obligation, false, worker);
              to_try_confirm_as_unsat_obligations.pop_back();
            }
          }
        }

        LOG << "Lets get the results" << endl;

        // wait until all the work is completed
        while (!worker_interface.all_workers_idle()) { 
          worker_interface.process_inbox();
        }

        // get the results
        vector<tuple<int, Success>>* worker_successes = worker_interface.get_returned_successes_buffer();
        vector<tuple<int, Reason_From_Worker>>* worker_reasons = worker_interface.get_returned_reasons_buffer();

        LOG << "UNSAT count: " <<  worker_reasons->size() << endl;
        LOG << "SAT count: " <<  worker_successes->size() << endl;

        change = worker_reasons->size();

        // process the results
        for (auto it=worker_reasons->begin(); it!=worker_reasons->end(); it++) {
          worker_reason = *it; 
          const Reason_From_Worker& reason_from_worker = get<1>(worker_reason);
          const Contextless_Reason& reason = reason_from_worker.contextless_reason();

          if (layers.add_reason(reason)) {
            const Reason_From_Orchestrator reason_from_orchestrator = Reason_From_Orchestrator(reason, reason.layer());
            worker_interface.handle_reason_all_workers(reason_from_orchestrator);
          } else LOG << "WARNING: look into this" << endl;
        }

        // reschedule up the successful ones and go again
        for (auto it=worker_successes->begin(); it!=worker_successes->end(); it++) {
          const Obligation& obl = (get<1>(*it)).original_obligation();
          to_try_confirm_as_unsat_obligations.push_back(obl);
        }


        // manually clear these buffers
        worker_reasons->clear();
        worker_successes->clear();
      }

      if (to_try_confirm_as_unsat_obligations.size()) {
        LOG << "some that couldn't be reasons, damn..." << endl;
      } else {
        LOG << "all are reasons, this will perpetuate, UNSAT!" << endl;
        layers.print_sizes();
        return false;
      }

      LOG << "that didn't work, going to continue and try again later" << endl;
      LOG << "======UNKNOWN==========" << endl;
      return false;
    }
  }
}







/*


    //LOG << "layer copy sizes: " << endl;

    //for (auto it=layer_copy.begin(); it!=layer_copy.end(); it++) {
      //LOG << it->size() << endl; 
    //}

    LOG << "shifted?" << endl;
    if (layers_shifted_since_last_copy(k)) {
      LOG << "Layers pushed, confident stop" << endl;
      layers.print();
      return false;
    }

    copy_over_layers(k);


void Strategies::copy_over_layers(int k) {
  layer_copy.clear();
  for (int i=0; i<=k; i++) {
    layer_copy.push_back(set<vector<int>>());
    auto reasons = *layers.reasons_not_in_next_layer(i);

    for (auto it=reasons.begin(); it!=reasons.end(); it++) {
      layer_copy[i].insert(it->reason());
    }
    //LOG << "COPY DETAILS: " << layer_copy[layer_copy.size()-1].size() << endl;
  }
}

bool helper_equal(const set<vector<int>>& copy, unordered_set<Contextless_Reason, Contextless_Reason_Hash>* base) {
  //LOG << "asking if two are the same, sizes: " << copy.size() << " " << base->size() << endl;
  if (copy.size() != base->size()) return false;

  for (auto it=base->begin(); it!=base->end(); it++) {
    if (copy.find(it->reason()) == copy.end()) {
      //LOG << "missing reason" << endl;
      return false; 
    }
  }

  return true;
}

bool Strategies::layers_shifted_since_last_copy(int k) {
  LOG << "layer_copy size" << layer_copy.size() <<  endl;
  for (int i=k; i>=0; i--) {
    if (layers.reasons_not_in_next_layer(i)->size() == 0) {
      LOG << "returning true, as at layer " << i << " is the same as last?" << endl;
      return true;
    }

    LOG << "is the current " << i << " equal to the previous " << i-1 << endl;
    LOG << "layer_copy " << i-1 << " " << layer_copy[i-1].size() << endl;
    LOG << "layers.re..." << i << " " << layers.reasons_not_in_next_layer(i)->size() << endl;

    if (!helper_equal(layer_copy[i-1], layers.reasons_not_in_next_layer(i))) {
      LOG << " Different" << endl;
      return false;
    }
    LOG << " Same " << endl;
  }
  LOG << "shouldn't get heree" << endl;
  return true;
}
*/
