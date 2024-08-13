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

bool Strategies::full_scc_goal_refresh() {
  LOG << "START Full scc refresh" << endl;
  unordered_set<int> goal_reaching_states = goal_reachability_manager.scc_find_newly_goal_reaching_states(successes_since_last_scc_refresh, -1, true);
  for (auto it=goal_reaching_states.begin(); it!=goal_reaching_states.end(); it++) {
    queue.register_goal_reaching_state(Compressed_State::state_id_to_state(*it));
    if (*it == 0) {
      LOG << "found a plan in a full SCC refresh" << endl;
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

  if (PROPER_SCC_CHECK_RATE == 1) return false; // everything is up to code, checking every time, so if there is nothing to do then there is truelly nothing to do

  exit(1);
  return false;

  // now, keep going in the loop if there is a possibility of a deadlock (is not doing a proper scc check every time)
  //!queue.fully_empty() || !worker_interface.all_workers_idle() || ((full_scc_refresh_loop_count != 1) && (PROPER_SCC_CHECK_RATE != 1))
}




bool Strategies::run_default() {
  Global::active_heuristics = set<int>({Heuristics::NONE, Heuristics::RANDOM});

  // is very expensive to pass through
  queue.inform_of_global_reachability_graph(goal_reachability_manager.get_global_graph());
  goal_reachability_manager.inform_of_layer_graph(queue.get_layer_graph());
  LOG << "ONLY ONCE" << endl;

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
    return true;
  }

  LOG << "initial state: " << initial_state.to_string() << endl;

  worker_interface.reset_nondeterministic_solvers_for_new_k(1);
  for(int k=1;; k++) {
    LOG << "starting layer k: " << k << endl;

    // Put the initial state in the queue
    Obligation initial_obligation = Obligation(initial_state, k, 0, true, vector<int>());
    queue.push_initial(initial_obligation, k);

    LG(ST) << "pushing initial obligation to the queue: " << initial_obligation.to_string() << endl;

    // Process it
    while (keep_processing()) {
      if (Global::problem.nondeterministic & full_scc_refresh_loop_count == FULL_SCC_REFRESH_RATE) {
        if (full_scc_goal_refresh()) return true;
        full_scc_refresh_loop_count = 0;
      }
      full_scc_refresh_loop_count++;

      if (!queue.available_work()) {
        LOG << "work not available, full_scc_refresh_loop_count " << full_scc_refresh_loop_count << endl;
      }

      //LOG << "INT start main loop" << endl;
      if (Global::problem.evaluation_mode) print_elapsed_time();
      // add some more work
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
        }
      }

      // get the results from the worker_interface
      worker_interface.process_inbox();
      vector<tuple<int, Success>>* worker_successes = worker_interface.get_returned_successes_buffer();
      vector<tuple<int, Reason_From_Worker>>* worker_reasons = worker_interface.get_returned_reasons_buffer();

      // some periodic stats reporting
      manage_per_inbox_check_periodic_stats(worker_successes->size(), worker_reasons->size());

      // handle successes
      for (auto ita=worker_successes->begin(); ita!=worker_successes->end(); ita++) {
        worker_success = *ita;
        const Success& success = get<1>(worker_success);
        successes_since_last_scc_refresh.push_back(success);

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

    LOG << "should be 1: " << full_scc_refresh_loop_count << endl;

    //LOG << "before pushing" << endl;
    //layers.print();

    if (Global::problem.nondeterministic) worker_interface.reset_nondeterministic_solvers_for_new_k(k+1);

    // completed the k, lets do a convergance check and clause pushing
    for (int layer=1; layer<=k+1; layer++) {
      LOG << "Clause pushing turned off in nondeterminism for now" << endl;
      /*
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
      layers.print();
      */

      // !Global::problem.nondeterministic && 
      if (layers.same_as_previous(layer)) {
        //layers.print();
        LOG << "converged as layer " << layer << " is the same as the previous one" << endl;
        if (!Global::problem.evaluation_mode) worker_interface.finalize();
        return false;
      }
    }
  }
}
