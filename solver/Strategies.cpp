#include "Strategies.h"
#include "Contextless_Reason.h"
#include "nondeterminism/ND_Manager.h"
#include "Reason_From_Orchestrator.h"
#include "nondeterminism/Goal_States_Graph.h"
#include <chrono>

long long int Strategies::get_results_iteration = 0;
long long int Strategies::successes_count = 1;
long long int Strategies::reasons_count = 1;
long long int Strategies::reasons_count_iteration_checkpoint = 0;
long long int Strategies::successes_count_iteration_checkpoint = 0;

int Strategies::one_worker_results = 0;
int Strategies::more_than_one_worker_results = 0;

uint64_t already_displayed_elapsed_time = 0;

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

void print_elapsed_time() {
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

bool Strategies::run_default() {
  // TODO just for now...
  Global::active_heuristics = set<int>({Heuristics::NONE, Heuristics::RANDOM});

  // set up everything we need
  Default_Queue queue;
  Layers layers;
  Worker_Interface worker_interface;
  Plan_Builder plan_builder;

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

  for(int k=1;; k++) {
    LOG << "starting layer k: " << k << endl;
    // Put the initial state in the queue
    Obligation initial_obligation = Obligation(initial_state, k, 0, 0, 0, true);
    queue.push(initial_obligation);

    // Process it
    while (!queue.empty() || !worker_interface.all_workers_idle()) {
      if (Global::problem.evaluation_mode) print_elapsed_time();

      // add some more work
      const set<int> workers = worker_interface.workers_wanting_work_snapshot();
      for (auto it=workers.begin(); it!=workers.end(); it++) {
        const int worker = *it;
        if (!queue.empty()) {
          // special requirement, if the queue does not have something available, don't bother here
          if (Utils::worker_to_steps(worker)>queue.lowest_layer_with_content()) continue;
          worker_interface.handle_obligation(queue.pop(Heuristics::RANDOM), worker);
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
        plan_builder.register_success(success);

        assert(success.original_obligation().reduce_reason_add_successor_to_queue());

        queue.push(success.original_obligation());

        const vector<Obligation>& successor_obligations = success.successor_obligations();
        for (auto itb=successor_obligations.begin(); itb!=successor_obligations.end(); itb++) {
          const Obligation& successor_obligation = *itb;
          queue.push(successor_obligation);
          assert(successor_obligation.reduce_reason_add_successor_to_queue());

          // check if found a plan
          if (successor_obligation.layer() == 0) {
            plan_builder.write_plan(success);
            if (!Global::problem.evaluation_mode) worker_interface.finalize();
            return true;
          }
        }
      }

      // handle reasons
      for (auto it=worker_reasons->begin(); it!=worker_reasons->end(); it++) {
        worker_reason = *it; 
        const Reason_From_Worker& reason_from_worker = get<1>(worker_reason);
        const Contextless_Reason& reason = reason_from_worker.contextless_reason();

        const int layers_to_add_to = layers.add_reason(reason);

        if (layers_to_add_to) {
          queue.trim(reason, k);
          worker_interface.handle_reason_all_workers(Reason_From_Orchestrator(reason, reason.layer()-layers_to_add_to+1));
        }

        const Obligation& original_obligation = reason_from_worker.originating_obligation();
        if (Global::problem.obligation_rescheduling && (original_obligation.layer() < k)) {
          // going to OR?
          const bool dont_or = (original_obligation.or_count() + 1 > MAX_OR_COUNT) || (original_obligation.layer() == original_obligation.or_originating_layer());

          if (!dont_or) queue.push(original_obligation.get_with_incremented_layer_and_or_count(1, 1));
        }
      }

      // manually clear these buffers
      worker_reasons->clear();
      worker_successes->clear();
    }

    // completed the k, lets do a convergance check and clause pushing
    for (int layer=1; layer<=k+1; layer++) {
      auto reasons_to_push = layers.reasons_not_in_next_layer(layer-1);

      // get all the "obligations"
      vector<Obligation> push;
      for (auto it=reasons_to_push->begin(); it!=reasons_to_push->end(); it++) {
        const Contextless_Reason& reason = *it;
        push.push_back(Obligation(Compressed_State(reason.reason(), 0, false), layer, 0, 0, 0, false));
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
            worker_interface.handle_obligation(obligation, worker);
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
      if (layers.same_as_previous(layer)) {
        LOG << "converged as layer " << layer << " is the same as the previous one" << endl;
        if (!Global::problem.evaluation_mode) worker_interface.finalize();
        return false;
      }
    }
  }
}

bool Strategies::run_nondeterministic() {
  // TODO just for now...
  Global::active_heuristics = set<int>({Heuristics::NONE, Heuristics::RANDOM});

  // Create the initial state to create initial obligations
  Compressed_State initial_state = Compressed_State(Global::problem.initial_state, 0, true);

  // set up everything we need
  Default_Queue queue;
  Layers layers;
  Worker_Interface worker_interface;
  Goal_States_Graph goal_states_graph;
  ND_Manager nd_manager = ND_Manager(initial_state); 

  // tmp unpackers
  tuple<int, Success> worker_success;
  tuple<int, Reason_From_Worker> worker_reason;

  // add the goal to the reasons object
  for (auto it=Global::problem.goal_condition.begin(); it!=Global::problem.goal_condition.end(); it++) {
    vector<int> bad_state = vector<int>({-*it});
    Contextless_Reason reason = Contextless_Reason(bad_state, 0, 0);
    layers.add_reason(reason);
  }

  for(int k=1;; k++) {
    LOG << "starting layer k: " << k << endl;
    // Put the initial state in the queue
    Obligation initial_obligation = Obligation(initial_state, k, 0, 0, 0, true);
    queue.push(initial_obligation);

    // Process it
    while (!queue.empty() || !worker_interface.all_workers_idle()) {
      if (Global::problem.evaluation_mode) print_elapsed_time();

      // add some more work
      const set<int> workers = worker_interface.workers_wanting_work_snapshot();
      for (auto it=workers.begin(); it!=workers.end(); it++) {
        const int worker = *it;
        if (!queue.empty()) {
          worker_interface.handle_obligation(queue.pop(Heuristics::RANDOM), worker);
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

        assert(success.original_obligation().reduce_reason_add_successor_to_queue());

        queue.push(success.original_obligation());

        vector<int> outcome_ids;

        //LOG << "got back success: " << success.to_string() << endl;
        //LOG << "From state: " << success.original_obligation().compressed_state().to_string() << endl;
        assert(success.actions().size()==1);
        assert(success.actions()[0].get_actions().size()==1);
        //LOG << "With action: " << Global::problem.symbols[success.actions()[0].get_actions()[0]] << endl;

        set<int> new_goal_reaching_states;

        const vector<Obligation>& successor_obligations = success.successor_obligations();
        for (auto itb=successor_obligations.begin(); itb!=successor_obligations.end(); itb++) {
          const Obligation& successor_obligation = *itb;
          queue.push(successor_obligation);
          assert(successor_obligation.reduce_reason_add_successor_to_queue());

          LOG << "Outcome: " << successor_obligation.compressed_state().to_string() << endl;

          // check if obligation is a goal state
          if (successor_obligation.layer() == 0) {
            const set<int> extra_new_goal_reaching_states = goal_states_graph.register_goal_state(nd_manager.state_to_state_id(successor_obligation.compressed_state()));
            new_goal_reaching_states.insert(extra_new_goal_reaching_states.begin(), extra_new_goal_reaching_states.end());
          }

          outcome_ids.push_back(nd_manager.state_to_state_id(successor_obligation.compressed_state()));
        }

        // after adding them all, trim the queue of goal reaching states, and check if a plan exists

        assert(success.actions().size()==1); // only one action should have been executed
        assert(success.actions()[0].get_actions().size()==1); // only one action should have been executed

        const set<int> extra_new_goal_reaching_states = goal_states_graph.register_state_action_to_outcome_states(
            nd_manager.state_to_state_id(success.original_obligation().compressed_state()),
            success.actions()[0].get_actions()[0],
            outcome_ids);

        new_goal_reaching_states.insert(extra_new_goal_reaching_states.begin(), extra_new_goal_reaching_states.end());

        if (new_goal_reaching_states.find(nd_manager.initial_state_id()) != new_goal_reaching_states.end()) {
          // a plan exists!
          if (!Global::problem.evaluation_mode) worker_interface.finalize();
          LOG << "A NONDETERMINISTIC PLAN EXISTS" << endl;
          return true;
        } else {
          // remove these from the queue
          for (auto it=new_goal_reaching_states.begin(); it!=new_goal_reaching_states.end(); it++) {
            const int state_id = *it; 
            LOG << "about to trim from the queue the state: " << nd_manager.state_id_to_state(state_id).to_string() << endl;
            queue.remove_and_ban_state(nd_manager.state_id_to_state(state_id));
          }
        }
      }

      // handle reasons
      for (auto it=worker_reasons->begin(); it!=worker_reasons->end(); it++) {
        worker_reason = *it; 
        const Reason_From_Worker& reason_from_worker = get<1>(worker_reason);
        const Contextless_Reason& reason = reason_from_worker.contextless_reason();
        LOG << "got back reason: " << reason_from_worker.to_string() << endl;

        const int layers_to_add_to = layers.add_reason(reason);

        if (layers_to_add_to) {
          queue.trim(reason, k);
          worker_interface.handle_reason_all_workers(Reason_From_Orchestrator(reason, reason.layer()-layers_to_add_to+1));
        }

        const Obligation& original_obligation = reason_from_worker.originating_obligation();
        if (Global::problem.obligation_rescheduling && (original_obligation.layer() < k)) {
          // going to OR?
          const bool dont_or = (original_obligation.or_count() + 1 > MAX_OR_COUNT) || (original_obligation.layer() == original_obligation.or_originating_layer());

          if (!dont_or) queue.push(original_obligation.get_with_incremented_layer_and_or_count(1, 1));
        }
      }

      // manually clear these buffers
      worker_reasons->clear();
      worker_successes->clear();
    }

    // completed the k, lets do a convergance check and clause pushing
    for (int layer=1; layer<=k+1; layer++) {
      auto reasons_to_push = layers.reasons_not_in_next_layer(layer-1);

      LOG << "Clause pushing turned off in nondeterminism for now" << endl;
      /*
      // get all the "obligations"
      vector<Obligation> push;
      for (auto it=reasons_to_push->begin(); it!=reasons_to_push->end(); it++) {
        const Contextless_Reason& reason = *it;
        push.push_back(Obligation(Compressed_State(reason.reason(), 0, false), layer, 0, 0, 0, false));
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
            worker_interface.handle_obligation(obligation, worker);
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
      */

      // convergence check
      if (layers.same_as_previous(layer)) {
        LOG << "converged as layer " << layer << " is the same as the previous one" << endl;
        if (!Global::problem.evaluation_mode) worker_interface.finalize();
        return false;
      }
    }
  }
}
