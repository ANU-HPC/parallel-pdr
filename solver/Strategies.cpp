#include "Strategies.h"
#include "Contextless_Reason.h"
#include "Reason_From_Orchestrator.h"

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

  long long int get_results_iteration = 0;
  long long int successes_count = 1;
  long long int reasons_count = 1;
  long long int reasons_count_iteration_checkpoint = 0;
  long long int successes_count_iteration_checkpoint = 0;

  for(int k=1;; k++) {
    LOG << "starting layer k: " << k << endl;
    // Put the initial state in the queue
    Obligation initial_obligation = Obligation(initial_state, k, 0, 0, true);
    queue.push(initial_obligation);

    // Process it
    while (!queue.empty() || !worker_interface.all_workers_idle()) {
      // add some more work
      const set<int> workers = worker_interface.workers_wanting_work_snapshot();
      for (auto it=workers.begin(); it!=workers.end(); it++) {
        const int worker = *it;
        if (!queue.empty()) {
          // just get as normal
          worker_interface.handle_obligation(queue.pop(Heuristics::RANDOM), worker);

          // one in three workers get a random obligation
          //if (worker%2==0) worker_interface.handle_obligation(queue.pop(Heuristics::RANDOM), worker);
          //else             worker_interface.handle_obligation(queue.pop(Heuristics::NONE), worker);
        }
      }

      // get the results from the worker_interface
      worker_interface.process_inbox();
      vector<tuple<int, Success>>* worker_successes = worker_interface.get_returned_successes_buffer();
      vector<tuple<int, Reason_From_Worker>>* worker_reasons = worker_interface.get_returned_reasons_buffer();

      // stats on how busy the orchestrator is
      get_results_iteration++;
      reasons_count+=worker_reasons->size();
      successes_count+=worker_successes->size();
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
            worker_interface.finalize();
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
          if (original_obligation.or_level() < 12) queue.push(original_obligation.get_with_incremented_layer_and_or_level(1, 1));
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
        push.push_back(Obligation(Compressed_State(reason.reason(), 0, false), layer, 0, 0, false));
      }

      // send them all off
      while (push.size()) {
        worker_interface.process_inbox();
        const set<int> workers = worker_interface.workers_wanting_work_snapshot();
        for (auto it=workers.begin(); it!=workers.end(); it++) {
          const int worker = *it; 
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
        worker_interface.finalize();
        return false;
      }
    }
  }
}
