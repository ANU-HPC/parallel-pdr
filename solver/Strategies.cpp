#include "Strategies.h"
#include "Compressed_State.h"
#include "Contextless_Reason.h"
#include "Reason_From_Orchestrator.h"
#include "Success.h"
#include "nondeterminism/State_ID_Manager.h"
#include "nondeterminism/Goal_Reachability_Manager.h"
#include "queue/Wrapper_Queue.h"
#include "queue/Open_States_Tracking_Queue.h"
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

/*
bool Strategies::OLD() {
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
*/





















/*
bool Strategies::OLD2() {
  // TODO just for now...
  Global::active_heuristics = set<int>({Heuristics::NONE, Heuristics::RANDOM});

  // Create the initial state to create initial obligations
  Compressed_State initial_state = Compressed_State(Global::problem.initial_state, 0, true);

  // set up everything we need
  Open_States_Tracking_Queue queue;
  Layers layers;
  Worker_Interface worker_interface;
  Goal_States_Graph goal_states_graph;
  State_ID_Manager state_id_manager = State_ID_Manager(initial_state); 

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
          const Obligation& obligation = queue.pop(Heuristics::RANDOM);
          bool open_children = AAAA;
          worker_interface.handle_obligation(obligation, open_children, worker);
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

        queue.register_success(success);

        vector<int> outcome_ids;

        // TODO move this all into the goal tracker - just hand over the success object

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
            LOG << "registering goal state: " << state_id_manager.state_to_state_id(successor_obligation.compressed_state()) << endl;
            const unordered_set<int> extra_new_goal_reaching_states = goal_states_graph.register_goal_state(state_id_manager.state_to_state_id(successor_obligation.compressed_state()));
            new_goal_reaching_states.insert(extra_new_goal_reaching_states.begin(), extra_new_goal_reaching_states.end()); // the extra ones implied by it
            new_goal_reaching_states.insert(state_id_manager.state_to_state_id(successor_obligation.compressed_state())); // the goal state itself
          }

          outcome_ids.push_back(state_id_manager.state_to_state_id(successor_obligation.compressed_state()));
        }

        // after adding them all, trim the queue of goal reaching states, and check if a plan exists

        assert(success.actions().size()==1); // only one action should have been executed
        assert(success.actions()[0].get_actions().size()==1); // only one action should have been executed

        LOG << "registering an arc" << endl;
        const unordered_set<int> extra_new_goal_reaching_states = goal_states_graph.register_state_action_to_outcome_states(
            state_id_manager.state_to_state_id(success.original_obligation().compressed_state()),
            success.actions()[0].get_actions()[0],
            outcome_ids);

        new_goal_reaching_states.insert(extra_new_goal_reaching_states.begin(), extra_new_goal_reaching_states.end());

        if (new_goal_reaching_states.find(state_id_manager.initial_state_id()) != new_goal_reaching_states.end()) {
          // a plan exists!
          if (!Global::problem.evaluation_mode) worker_interface.finalize();
          LOG << "A NONDETERMINISTIC PLAN EXISTS" << endl;
          return true;
        } else {
          // remove these from the queue
          for (auto it=new_goal_reaching_states.begin(); it!=new_goal_reaching_states.end(); it++) {
            const int state_id = *it; 
            LOG << "about to trim from the queue the state: " << state_id_manager.state_id_to_state(state_id).to_string() << endl;
            queue.remove_and_ban_states_as_goal_reaching(state_id_manager.state_id_to_state(state_id));
          }
        }
      }

      // handle reasons
      for (auto it=worker_reasons->begin(); it!=worker_reasons->end(); it++) {
        worker_reason = *it; 
        const Reason_From_Worker& reason_from_worker = get<1>(worker_reason);
        const Obligation& original_obligation = reason_from_worker.originating_obligation();
        const Contextless_Reason& reason = reason_from_worker.contextless_reason();

        LOG << "got back reason: " << reason_from_worker.to_string() << endl;

        const int num_layers_to_add_to = layers.add_reason(reason);

        if (layers_to_add_to) {
          queue.trim(reason, k);
          worker_interface.handle_reason_all_workers(Reason_From_Orchestrator(reason, reason.layer()-num_layers_to_add_to+1));
        }

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
      // /*
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
      // */

      /*
      // convergence check
      if (layers.same_as_previous(layer)) {
        LOG << "converged as layer " << layer << " is the same as the previous one" << endl;
        if (!Global::problem.evaluation_mode) worker_interface.finalize();
        return false;
      }
    }
  }
}
*/

bool Strategies::run_default() {

  Global::active_heuristics = set<int>({Heuristics::NONE, Heuristics::RANDOM});

  // set up everything we need
  Wrapper_Queue queue;
  Layers layers;
  Worker_Interface worker_interface;
  Goal_Reachability_Manager goal_reachability_manager; // only for nondeterminism
  Plan_Builder deterministic_plan_builder; // only for deterministic

  // is very expensive to pass through
#ifdef DNDEBUG
#else
  queue.inform_of_global_reachability_graph(goal_reachability_manager.get_global_graph());
#endif

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
    while (!queue.fully_empty() || !worker_interface.all_workers_idle()) {
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
