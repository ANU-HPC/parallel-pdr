#include "Obligation_Processor.h"
#include "Obligation.h"
#include "Utils.h"

Obligation_Processor::Obligation_Processor(int max_steps) {
  _max_steps = max_steps;

  // create base solvers
  _steps_to_base_solver = vector<Lingeling*>(_max_steps);
  _steps_to_base_solver[0] = NULL;
  for (int steps=1; steps<=max_steps; steps++) {
    _steps_to_base_solver[steps] = new Lingeling((Global::problem.tmp_dir + "/tmp_regular_" + to_string(steps) + ".cnf").c_str());
    _steps_to_base_solver[steps]->solve(vector<int>());
  }
  
  // create obligation_layer 0 solvers (NULLs)
  vector<Lingeling*> first_layer = vector<Lingeling*>(_max_steps+1);
  for (int steps=0; steps<=_max_steps; steps++) first_layer[steps] = NULL;
  _obligation_layer_steps_to_solver.push_back(first_layer);

  // initialize with goal TODO will break with subproblems
  for (auto it=Global::problem.goal_condition.begin(); it!=Global::problem.goal_condition.end(); it++) {
    Reason goal_condition_reason = Reason(Obligation::BLANK_OBLIGATION, vector<int>({-*it}), 0, 0);
    add_reason(goal_condition_reason);
  }
}

void Obligation_Processor::process_obligation(const Obligation& original_obligation) {
  const int steps = _max_steps; // TODO
  const int obligation_layer = original_obligation.layer();

  ensure_solver_exists_for_obligation_layer(obligation_layer);
  _last_interaction_was_a_success = _obligation_layer_steps_to_solver[obligation_layer][steps]->solve(original_obligation.compressed_state().get_state());

  if (_last_interaction_was_a_success) set_success_from_solver(original_obligation, steps);
  else                                 set_reason_from_solver(original_obligation, steps);
}

void Obligation_Processor::add_reason(const Reason& reason) {
  for (int steps=1; steps<=_max_steps; steps++) {
    const int obligation_layer = get_solver_to_send_to(reason, steps);
    ensure_solver_exists_for_obligation_layer(obligation_layer);
    _obligation_layer_steps_to_solver[obligation_layer][steps]->add_clause(Utils::tilde(reason.timestep_zero_nogood_clause(), steps));
  }
}

bool Obligation_Processor::last_interaction_was_a_success() {
  return _last_interaction_was_a_success;
}

Success Obligation_Processor::last_interactions_success() {
  assert(_last_interaction_was_a_success);
  return _success;
}

Reason Obligation_Processor::last_interactions_reason() {
  assert(!_last_interaction_was_a_success);
  return _reason;
}

void Obligation_Processor::set_success_from_solver(const Obligation& original_obligation, int steps) {
  // TODO if not adding, don't bother creating a success. Works better when have a "solver idle" tag
  // TODO change when in macros etc... (there is a more complicated example in the original codebase), aux??
  // make it so the model is projected to the relevant subproblem propositions
  // Need to take in the model, and extract everything

  const vector<int>& model = _obligation_layer_steps_to_solver[original_obligation.layer()][steps]->get_model();

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
  const int next_layer = original_obligation.layer()-1;
  const bool reduce_reason_add_successor_to_queue = original_obligation.reduce_reason_add_successor_to_queue();

  Compressed_Actions ca = Compressed_Actions(executed_actions, subproblem);
  Compressed_State cs = Compressed_State(positive_propositions, subproblem, true);

  Obligation successor_obligation = Obligation(cs, next_layer, subproblem, reduce_reason_add_successor_to_queue);

  _success = Success(original_obligation, ca, successor_obligation);
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

void Obligation_Processor::set_reason_from_solver(const Obligation& original_obligation, int steps) {
  // So this is actually doing a process of strengthening - lit removal
  if (!original_obligation.reduce_reason_add_successor_to_queue()) {
    _reason = Reason(original_obligation, original_obligation.compressed_state().get_state(), original_obligation.layer(), original_obligation.subproblem());
    return;
  }

  Lingeling* solver = _obligation_layer_steps_to_solver[original_obligation.layer()][steps];

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

  _reason = Reason(original_obligation, set_to_abs_sorted_vector(running_reason), original_obligation.layer(), original_obligation.subproblem());
}

int Obligation_Processor::get_solver_to_send_to(const Reason& reason, int steps) {
  return reason.layer()+1;
}

void Obligation_Processor::ensure_solver_exists_for_obligation_layer(int obligation_layer) {
  assert (obligation_layer>0);
  while (obligation_layer >= _obligation_layer_steps_to_solver.size()) {
    vector<Lingeling*> new_layer = vector<Lingeling*>(_max_steps+1);
    new_layer[0] = NULL;
    for (int steps=1; steps<=_max_steps; steps++) {
      new_layer[steps] = new Lingeling(_steps_to_base_solver[steps]);
    }
    _obligation_layer_steps_to_solver.push_back(new_layer);
  }
}
