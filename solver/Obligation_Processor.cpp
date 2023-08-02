#include "Obligation_Processor.h"
#include "Contextless_Reason.h"
#include "Obligation.h"
#include "Reason_From_Orchestrator.h"
#include "Utils.h"
#include <iterator>

Obligation_Processor::Obligation_Processor(int max_steps) {
  _max_steps = max_steps;

  // create base solvers
  _steps_to_base_solver = vector<Lingeling*>(_max_steps);
  _steps_to_base_solver[0] = NULL;
  for (int steps=1; steps<=max_steps; steps++) {
    _steps_to_base_solver[steps] = new Lingeling((Global::problem.tmp_dir + "/tmp_regular_" + to_string(steps) + ".cnf").c_str());
    _steps_to_base_solver[steps]->solve(vector<int>());
  }

  // initialize with goal TODO will break with subproblems
  for (auto it=Global::problem.goal_condition.begin(); it!=Global::problem.goal_condition.end(); it++) {
    Reason_From_Orchestrator goal_condition_reason = Reason_From_Orchestrator(Contextless_Reason(vector<int>({-*it}), 0, 0), 0);
    add_reason(goal_condition_reason);
  }
}

// TODO this is not a concrete thing, it is the current strategy
void Obligation_Processor::process_obligation(const Obligation& original_obligation) {
  // 3 cases:
  // try step one, fail, should get a reason from that
  // fail at step n, so n-1 worked.
  // get all the way through, the last one succeeded, local_max_steps worked, 
  const int local_max_steps = min(_max_steps, original_obligation.layer());

  int checking_steps;
  bool last_test_success;
  for (checking_steps=1; checking_steps<=local_max_steps; checking_steps++) {
    const int end_reasons_layer = original_obligation.layer()-checking_steps;
    ensure_solver_exists_for_end_reason_layer(end_reasons_layer);
    last_test_success = _end_reasons_layer_to_steps_to_solver[end_reasons_layer][checking_steps]->solve(original_obligation.compressed_state().get_state());
    if (!last_test_success) break; // gone too high, back off
  }

  if ((checking_steps==1) && !last_test_success) {
    // failed at the first one, find a suitable reason
    const int reason_steps = checking_steps;
    const int reason_end_reasons_layer = original_obligation.layer()-reason_steps;

    _last_interaction_was_a_success = false;
    set_reason_from_solver(original_obligation, reason_end_reasons_layer, reason_steps);
  } else {
    // got more than one, so we know this "checking_steps" is the first to fail
    const int success_steps = checking_steps-1;
    const int success_end_reasons_layer = original_obligation.layer()-success_steps;

    _last_interaction_was_a_success = true;
    set_success_from_solver(original_obligation, success_end_reasons_layer, success_steps);
  }
}

void Obligation_Processor::add_reason(const Reason_From_Orchestrator& reason) {
  ensure_solver_exists_for_end_reason_layer(reason.contextless_reason().layer());
  if (Global::problem.interleaved_layers) add_reason_interleaved_layers(reason);
  else                                    add_reason_no_interleaved_layers(reason);
}

void Obligation_Processor::add_reason_interleaved_layers(const Reason_From_Orchestrator& reason) {
  for (int steps=1; steps<=_max_steps; steps++) {
    // consider this many steps
    // first add this reason "where it is supposed to go"
    // then in solvers with a end_reason_layer that is SMALLER, add this clause again, but tilded less steps. Example
    // Reason layer 10, steps 2:
    // add to end_reasons_layer:10, steps:2 tilded:2
    // add to end_reasons_layer:9, steps:2 tilded:1

    for (int distance_from_base=0; (distance_from_base<steps) && (reason.contextless_reason().layer()-distance_from_base>=0) ; distance_from_base++) {
      const int end_reason_layer = reason.contextless_reason().layer()-distance_from_base; // >=0 from the loop condition
      const int start_reason_layer = max(0,reason.add_from_layer()-distance_from_base);
      const int tilde = steps-distance_from_base;

      for (int i=start_reason_layer; i<=end_reason_layer; i++) {
        _end_reasons_layer_to_steps_to_solver[i][steps]->add_clause(Utils::tilde(reason.contextless_reason().timestep_zero_nogood_clause(), tilde));
      }
    }
  }
}

void Obligation_Processor::add_reason_no_interleaved_layers(const Reason_From_Orchestrator& reason) {
  for (int steps=1; steps<=_max_steps; steps++) {
    for (int i=reason.add_from_layer(); i<=reason.contextless_reason().layer(); i++) {
      _end_reasons_layer_to_steps_to_solver[i][steps]->add_clause(Utils::tilde(reason.contextless_reason().timestep_zero_nogood_clause(), steps));
    }
  }
}

bool Obligation_Processor::last_interaction_was_a_success() {
  return _last_interaction_was_a_success;
}

Success Obligation_Processor::last_interactions_success() {
  assert(_last_interaction_was_a_success);
  return _success;
}

Reason_From_Worker Obligation_Processor::last_interactions_reason() {
  assert(!_last_interaction_was_a_success);
  return _reason;
}

// TODO extract the intermediate states for interleaved layers
void Obligation_Processor::set_success_from_solver(const Obligation& original_obligation, int end_reasons_layer, int steps) {
  // TODO if not adding, don't bother creating a success. Works better when have a "solver idle" tag
  // TODO change when in macros etc... (there is a more complicated example in the original codebase), aux??
  // make it so the model is projected to the relevant subproblem propositions
  // Need to take in the model, and extract everything

  const vector<int>& model = _end_reasons_layer_to_steps_to_solver[end_reasons_layer][steps]->get_model();

  const int subproblem = original_obligation.subproblem();

  const vector<int>& all_actions = Global::problem.subproblem_to_actions[subproblem];
  const vector<int>& propositions = Global::problem.subproblem_to_propositions[subproblem];

  vector<int> executed_actions;
  vector<int> positive_propositions;

  // extract actions from model.
  for (int step=0; step<steps; step++) {
    for (auto it=all_actions.begin(); it!=all_actions.end(); it++) {
      const int model_var_tilded_to_timestep_zero = Utils::tilde(model[Utils::tilde(*it,step)-1], -step);
      assert(abs(model_var_tilded_to_timestep_zero) == *it);
      if (model_var_tilded_to_timestep_zero>0) executed_actions.push_back(model_var_tilded_to_timestep_zero);
    }
  }

  // and propositions
  for (auto it=propositions.begin(); it!=propositions.end(); it++) {
    const int model_var_tilded_to_timestep_zero = Utils::tilde(model[Utils::tilde(*it,steps)-1], -steps);
    assert(abs(model_var_tilded_to_timestep_zero) == *it);
    if (model_var_tilded_to_timestep_zero>0) positive_propositions.push_back(model_var_tilded_to_timestep_zero);
  }

  // construct the success object
  const bool reduce_reason_add_successor_to_queue = original_obligation.reduce_reason_add_successor_to_queue();

  Compressed_Actions ca = Compressed_Actions(executed_actions, subproblem);
  Compressed_State cs = Compressed_State(positive_propositions, subproblem, true);

  Obligation successor_obligation = Obligation(cs, end_reasons_layer, subproblem, reduce_reason_add_successor_to_queue);

  _success = Success(original_obligation, ca, successor_obligation);

  if (successor_obligation.compressed_state() == original_obligation.compressed_state()) {
    LOG << "Same, steps: " << steps << " end_reasons_layer" << end_reasons_layer << " success: " << _success.to_string() << endl;
  }
}

// Conversions between - not ideal, I can't see a way to do it nicely
vector<int> set_to_vector(const set<int>& x) {
  return vector<int>(x.begin(), x.end());
}

set<int> vector_to_set(const vector<int>& x) {
  return set<int>(x.begin(), x.end());
}

vector<int> set_to_abs_sorted_vector(const set<int>& x) {
  vector<int> as_vector = set_to_vector(x);
  sort(as_vector.begin(), as_vector.end(), Utils::abs_comp);
  return as_vector;
}

void Obligation_Processor::set_reason_from_solver(const Obligation& original_obligation, int end_reasons_layer, int steps) {
  // So this is actually doing a process of strengthening - lit removal
  if (!original_obligation.reduce_reason_add_successor_to_queue()) {
    _reason = Reason_From_Worker( 
      Contextless_Reason(original_obligation.compressed_state().get_state(), original_obligation.layer(), original_obligation.subproblem()),
      original_obligation);
    return;
  }

  Lingeling* solver = _end_reasons_layer_to_steps_to_solver[end_reasons_layer][steps];

  set<int> running_reason = vector_to_set(solver->used_assumptions());
  const int subproblem = original_obligation.subproblem();
  const vector<int>& propositions_to_exclude = Global::problem.subproblem_to_propositions[subproblem];

  for (auto it=propositions_to_exclude.begin(); it!=propositions_to_exclude.end(); it++) {
    const int proposition_to_exclude = *it; 

    if (!Utils::in(running_reason, proposition_to_exclude)) continue; // already not in the running reason

    // lets remove this proposition and see if it is still UNSAT
    running_reason.erase(proposition_to_exclude);
    if (solver->solve(set_to_vector(running_reason))) {
      running_reason.insert(proposition_to_exclude); // The omission makes it SAT again, so add it back
    } else {
      running_reason = vector_to_set(solver->used_assumptions()); // use the used_assumptions as the new running reason
    }
  }

  _reason = Reason_From_Worker(
      Contextless_Reason(set_to_abs_sorted_vector(running_reason), original_obligation.layer(), original_obligation.subproblem()),
      original_obligation);
}

void Obligation_Processor::ensure_solver_exists_for_end_reason_layer(int end_reasons_layer) {
  assert (end_reasons_layer>=0);
  while (end_reasons_layer >= _end_reasons_layer_to_steps_to_solver.size()) {
    vector<Lingeling*> new_layer = vector<Lingeling*>(_max_steps+1);
    new_layer[0] = NULL;
    for (int steps=1; steps<=_max_steps; steps++) {
      new_layer[steps] = new Lingeling(_steps_to_base_solver[steps]);
    }
    _end_reasons_layer_to_steps_to_solver.push_back(new_layer);
  }
}
