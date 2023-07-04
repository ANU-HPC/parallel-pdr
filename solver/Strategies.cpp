#include "Strategies.h"

#include "Compressed_State.h"
#include "Global.h"
#include "Layers.h"
#include "Obligation.h"
#include "Worker_Interface.h"
#include "Plan_Builder.h"
#include "queue/Default_Queue.h"
#include "Default_Queue.h"
#include "queue/Heuristics.h"

bool Strategies::run_default() {
  // TODO just for now...
  Global::active_heuristics = set<int>({Heuristics::NONE});

  // set up everything we need
  Default_Queue queue;
  Layers layers;
  Worker_Interface worker_interface;
  Plan_Builder plan_builder;

  // tmp unpackers
  tuple<int, Success> worker_success;
  tuple<int, Reason> worker_reason;

  // add the goal to the reasons object
  for (auto it=Global::problem.goal_condition.begin(); it!=Global::problem.goal_condition.end(); it++) {
    vector<int> bad_state = vector<int>({-*it});
    Reason reason = Reason(bad_state, 0, 0);
    layers.add_reason(reason);
  }

  // Create the initial state to create initial obligations
  Compressed_State initial_state = Compressed_State(Global::problem.initial_state, 0, true);

  for(int k=1;; k++) {
    LOG << "starting layer k: " << k << endl;
    // Put the initial state in the queue
    Obligation initial_obligation = Obligation(initial_state, k, 0, true);
    queue.push(initial_obligation);

    // Process it
    while (!queue.empty() || !worker_interface.all_workers_idle()) {
      // add some more work
      const set<int> workers = worker_interface.workers_wanting_work_snapshot();
      for (auto it=workers.begin(); it!=workers.end(); it++) {
        const int worker = *it;
        if (!queue.empty()) {
          worker_interface.handle_obligation(queue.pop(Heuristics::NONE), worker);
        }
      }

      // get the results from the worker_interface
      worker_interface.process_inbox();
      vector<tuple<int, Success>>* worker_successes = worker_interface.get_returned_successes_buffer();
      vector<tuple<int, Reason>>* worker_reasons = worker_interface.get_returned_reasons_buffer();

      // handle successes
      for (auto it=worker_successes->begin(); it!=worker_successes->end(); it++) {
        worker_success = *it;
        const Success& success = get<1>(worker_success);
        plan_builder.register_success(success);

        assert(success.original_obligation().reduce_reason_add_successor_to_queue());
        assert(success.successor_obligation().reduce_reason_add_successor_to_queue());

        queue.push(success.original_obligation());
        queue.push(success.successor_obligation());

        // check if found a plan
        if (success.successor_obligation().layer() == 0) {
          plan_builder.write_plan(success);
          worker_interface.finalize();
          return true;
        }
      }

      // handle reasons
      for (auto it=worker_reasons->begin(); it!=worker_reasons->end(); it++) {
        worker_reason = *it; 
        const Reason& reason = get<1>(worker_reason);

        if (layers.add_reason(reason)) {
          queue.trim(reason, k);
          //LOG << "Am sending out a reason" << endl;
          worker_interface.handle_reason_all_workers(reason);
        }

        // TODO obligation rescheduling
      }

      // manually clear these buffers
      worker_reasons->clear();
      worker_successes->clear();
    }

    // completed the k, lets do a convergance check and clause pushing
    for (int layer=1; layer<=k+1; layer++) {
      if (layers.same_as_previous(layer)) {
        LOG << "converged as layer " << layer << " is apparently the same as the previous one" << endl;
        worker_interface.finalize();
        return false;
      }
    }
  }
}
