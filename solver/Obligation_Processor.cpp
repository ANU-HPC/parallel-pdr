#include "Obligation_Processor.h"
#include "Utils.h"

Obligation_Processor::Obligation_Processor() {
  const int steps = 1;

  // create base solver
  _base_solver = new Lingeling((Global::problem.tmp_dir + "/tmp_regular_" + to_string(steps) + ".cnf").c_str());
  _base_solver->solve(vector<int>());

  // create layer 1->0 solver
  Lingeling test = Lingeling(_base_solver);

  // initialize with goal TODO maybe it is better to do this manually by sending reasons?..
  ensure_solver_exist(0);
  for (auto it=Global::problem.goal_condition.begin(); it!=Global::problem.goal_condition.end(); it++) {
    vector<int> clause = vector<int>({Utils::tilde(*it, 1)});
    _solvers[0]->add_clause(clause);
  }
}

void Obligation_Processor::process_obligation(const Obligation& original_obligation) {
  const int solver_id = get_solver_to_send_to(original_obligation);
  ensure_solver_exist(solver_id);
  _last_interaction_was_a_success = _solvers[solver_id]->solve(original_obligation.compressed_state().get_state());

  if (_last_interaction_was_a_success) set_success_from_solver(original_obligation, solver_id);
  else                                 set_reason_from_solver(original_obligation, solver_id);
}

void Obligation_Processor::add_reason(const Reason& reason) {
  const int solver_id = get_solver_to_send_to(reason);
  ensure_solver_exist(solver_id);
  _solvers[solver_id]->add_clause(reason.nogood_clause());
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

void Obligation_Processor::set_success_from_solver(const Obligation& original_obligation, int solver_id) {
  // TODO change when in macros etc... (there is a more complicated example in the original codebase), aux??
  // make it so the model is projected to the relevant subproblem propositions
  // Need to take in the model, and extract everything

  const vector<int> model = _solvers[solver_id]->get_model();

  const int subproblem = original_obligation.subproblem();

  const vector<int>& all_actions = Global::problem.subproblem_to_actions[subproblem];
  const vector<int>& propositions = Global::problem.subproblem_to_propositions[subproblem];

  vector<int> executed_actions;
  vector<int> positive_propositions;

  // extract from the model
  for (auto it=all_actions.begin(); it!=all_actions.end(); it++) {
    const int model_var = model[*it-1];
    assert(abs(model_var) == *it);
    if (model_var>0) executed_actions.push_back(model_var);
  }

  for (auto it=propositions.begin(); it!=propositions.end(); it++) {
    const int model_var_tilded_to_timestep_zero = Utils::tilde(model[Utils::tilde(*it,1)-1], -1);
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

void Obligation_Processor::set_reason_from_solver(const Obligation& original_obligation, int solver_id) {
  // So this is actually doing a process of strengthening - lit removal

  set<int> running_reason = vector_to_set(_solvers[solver_id]->used_assumptions());
  const int subproblem = original_obligation.subproblem();
  const vector<int>& propositions_to_exclude = Global::problem.subproblem_to_propositions[subproblem];

  for (auto it=propositions_to_exclude.begin(); it!=propositions_to_exclude.end(); it++) {
    const int proposition_to_exclude = *it; 

    if (!Utils::in(running_reason, proposition_to_exclude)) continue; // already not in the running reason

    // lets remove this proposition and see if it is still UNSAT
    running_reason.erase(proposition_to_exclude);
    if (_solvers[solver_id]->solve(set_to_vector(running_reason))) {
      running_reason.insert(proposition_to_exclude); // The omission makes it SAT again, so add it back
    } else {
      running_reason = vector_to_set(_solvers[solver_id]->used_assumptions()); // use the used_assumptions as the new running reason
    }
  }

  _reason = Reason(set_to_abs_sorted_vector(running_reason), original_obligation.layer(), original_obligation.subproblem());
}

int Obligation_Processor::get_solver_to_send_to(const Obligation& obl) {
  return obl.layer()-1; // TODO change when in macros etc...
}

int Obligation_Processor::get_solver_to_send_to(const Reason& reason) {
  return reason.layer(); // TODO change when in macros etc...
}

void Obligation_Processor::ensure_solver_exist(int solver_id) {
  assert (solver_id>=0);
  while (solver_id >= _solvers.size()) {
    _solvers.push_back(new Lingeling(_base_solver));
  }
}
