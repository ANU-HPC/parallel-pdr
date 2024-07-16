#include "Wrapper_Queue.h"

void Wrapper_Queue::register_goal_reaching_state(const Compressed_State& state) {
  if (Global::problem.nondeterministic) {
    _nondeterministic.register_goal_reaching_state(state.id());
  } else {
    LOG << "shouldn't be doing this!" << endl;
    assert(false);
    //_deterministic.remove_and_ban_states_as_goal_reaching(state);
  }
}

void Wrapper_Queue::push_initial(const Obligation& obligation, int k) {
  if (Global::problem.nondeterministic) {
    _nondeterministic.new_k(k);
    _nondeterministic.push_initial(obligation);
  } else {
    _deterministic.push(obligation);
  }
}

void Wrapper_Queue::register_success(const Success& success) {
  if (Global::problem.nondeterministic) {
    _nondeterministic.register_success(success);
  } else {
    assert(success.successor_obligations().size() == 1);
    _deterministic.push(success.original_obligation());
    _deterministic.push(success.successor_obligations()[0]);

  }
}

Obligation Wrapper_Queue::pop(int heuristic) {
  if (Global::problem.nondeterministic) {
    return _nondeterministic.pop(heuristic);
  } else {
    return _deterministic.pop(heuristic);
  }
}

bool Wrapper_Queue::available_work() {
  if (Global::problem.nondeterministic) {
    return _nondeterministic.available_work();
  } else {
    return !_deterministic.empty();
  }
}

bool Wrapper_Queue::fully_empty() {
  if (Global::problem.nondeterministic) {
    return _nondeterministic.fully_empty();
  } else {
    return _deterministic.empty();
  }
}

int Wrapper_Queue::size() {
  return -1;
  /*
  if (Global::problem.nondeterministic) {
    
  } else {

  }
  */
}

void Wrapper_Queue::register_reason(const Reason_From_Worker& reason, int obligation_rescheduling_upper_layer) {
  if (Global::problem.nondeterministic) {
    _nondeterministic.register_reason(reason);
  } else {
    if (reason.originating_obligation().layer() < obligation_rescheduling_upper_layer) {
      _deterministic.push(reason.originating_obligation().get_with_incremented_layer(1));
    }
    _deterministic.trim(reason.contextless_reason(), obligation_rescheduling_upper_layer);
  }
}

int Wrapper_Queue::lowest_layer_with_content() {
  if (Global::problem.nondeterministic) {
    return _nondeterministic.lowest_layer_with_content();
  } else {
    return _deterministic.lowest_layer_with_content();
  }
}

void Wrapper_Queue::inform_of_global_reachability_graph(State_Action_Graph* global_reachability_graph) {
  if (Global::problem.nondeterministic) {
    _nondeterministic.inform_of_global_reachability_graph(global_reachability_graph);
  }
}
