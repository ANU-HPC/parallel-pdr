#include "Obligation_Processor.h"
#include "Compressed_Actions.h"
#include "Compressed_State.h"
#include "Contextless_Reason.h"
#include "Global.h"
#include "Lingeling.h"
#include "Obligation.h"
#include "Reason_From_Orchestrator.h"
#include "Utils.h"
#include <iterator>

Obligation_Processor::Obligation_Processor(int layer_steps) {
  _layer_steps = layer_steps;
  _sub_steps_per_internal_layer_step = MAX_OR_COUNT+1;
  _total_sub_steps = _sub_steps_per_internal_layer_step * (_layer_steps-1) + 2;

  // create base solver
  _base_solver = new Lingeling();
  _base_solver->set_name("base solver");
  if (Global::problem.nondeterministic) _base_solver->load_nondeterministic_planning_problem(Global::problem.tmp_dir); 
  else                                  _base_solver->load_deterministic_planning_problem(Global::problem.tmp_dir, _total_sub_steps); 

  _base_solver->solve(vector<int>());

  // initialize with goal TODO will break with subproblems
  for (auto it=Global::problem.goal_condition.begin(); it!=Global::problem.goal_condition.end(); it++) {
    Reason_From_Orchestrator goal_condition_reason = Reason_From_Orchestrator(Contextless_Reason(vector<int>({-*it}), 0, 0), 0);
    if (Global::problem.nondeterministic) add_reason_nondeterministic(goal_condition_reason);
    else                                  add_reason_deterministic(goal_condition_reason);
  }
}

void Obligation_Processor::process_obligation(const Obligation& original_obligation, const bool open_children) {
  // checks, statistics
  Global::stats.count("process_obligation");
  assert(!open_children); // not set up for that
  assert(Global::problem.nondeterministic || (original_obligation.banned_actions().size() == 0)); // deterministic not set up to handle banned actions?
  const int end_reasons_layer = original_obligation.layer()-_layer_steps;
  if (Global::problem.nondeterministic) assert (_layer_steps == 1);
  if (end_reasons_layer<0) {
    LOG << "ERROR: Worker with " << _layer_steps << " given an obligation with layer " << original_obligation.layer() << "      " << original_obligation.layer() << " " << _layer_steps << endl;
    assert(0);
  }

  // actual solving
  vector<int> assumptions = original_obligation.compressed_state().get_state();
  const vector<int>& banned_actions = original_obligation.banned_actions();
  for (auto it=banned_actions.begin(); it!=banned_actions.end(); it++) {
    assumptions.push_back(-*it); 
  }
  _last_interaction_was_a_success = _end_reasons_layer_to_solver[end_reasons_layer]->solve(assumptions);

  // dealing with it
  if (Global::problem.nondeterministic) {
    if (_last_interaction_was_a_success) set_success_from_solver_nondeterministic(original_obligation, end_reasons_layer);
    else {
      // need to check if there were any banned actions, then send a different result
      if (banned_actions.size()) {
        // special case (a bit messy...)
        _success = Success(original_obligation, vector<Compressed_Actions>(), vector<Obligation>());
        _last_interaction_was_a_success = true;
        return;
      } else {
        set_reason_from_solver(original_obligation, end_reasons_layer);


        // check this reason is a valid reason
        //vector<int> reason_lits = _reason.contextless_reason().reason();
        //bool valid = !_end_reasons_layer_to_solver[end_reasons_layer]->solve(assumptions);
        //assert(valid);

      }
    }
  } else {
    if (_last_interaction_was_a_success) set_success_from_solver_deterministic(original_obligation, end_reasons_layer);
    else                                 set_reason_from_solver(original_obligation, end_reasons_layer);
  }

  return;

  /*
  // DRAFT BANNED ACTION
  vector<int> assumptions = original_obligation.compressed_state().get_state();
  const vector<int>& banned_actions = original_obligation.banned_actions();
  for (auto it=banned_actions.begin(); it!=banned_actions.end(); it++) {
    assumptions.push_back(-*it); 
  }

  _last_interaction_was_a_success =_end_reasons_layer_to_solver[end_reasons_layer]->solve(original_obligation.compressed_state().get_state());
  if (Global::problem.nondeterministic) {
    // SO, once an action has been executed is is banned:
    // This could happen when:
    //   succesors are created
    //   no successors are created because an outcome is not allowed in the K iteration
    // So loops may be found in the nondeterministic case and nogoods may not be found

    if (_last_interaction_was_a_success) {
      // SAT, but need to check the outcomes make sense
      const int problematic_action = set_success_from_solver_nondeterministic(original_obligation, end_reasons_layer);
      if (problematic_action != 0) {
        // ban that action and try again
        assert(original_obligation.reduce_reason_add_successor_to_queue()); // not sure what this will mean

        // run again with the ban
        Obligation action_restricted_obligation = original_obligation.get_with_additional_banned_action(problematic_action);
        process_obligation(action_restricted_obligation, open_children);
      } // don't need an else, normal valid SAT has set a success
    } else {
     if (open_children) {
       set_success_open_children_unsat(original_obligation);
       _last_interaction_was_a_success = true; // treat it as a weird kind of success
     } else set_reason_from_solver(original_obligation, end_reasons_layer);
    }
  } else {
    // deterministic
    if (_last_interaction_was_a_success) set_success_from_solver_deterministic(original_obligation, end_reasons_layer);
    else                                 set_reason_from_solver(original_obligation, end_reasons_layer);

    Global::stats.count(
        "layer: " + std::to_string(original_obligation.layer()) + 
        " sat? " + std::to_string(_last_interaction_was_a_success));
  }
  return;
  */
}

// TODO don't need to constrain layer 0, always logically the same
void Obligation_Processor::add_reason_nondeterministic(const Reason_From_Orchestrator& reason) {
  const Contextless_Reason& contextless_reason = reason.contextless_reason();
  const vector<int>& timestep_zero_nogood_clause = contextless_reason.timestep_zero_nogood_clause();

  ensure_solver_exists_for_end_reason_layer(contextless_reason.layer());

  // first add to solvers constraining the chosen outcome
  for (int layer_to_add_to=contextless_reason.layer(); layer_to_add_to>=0; layer_to_add_to--) {
    const vector<int>& clause_to_add = Utils::tilde(timestep_zero_nogood_clause, 1);
    end_layer_to_chosen_outcome_added_clauses[layer_to_add_to].push_back(clause_to_add); // record it for resetting
    _end_reasons_layer_to_solver[layer_to_add_to]->add_clause(clause_to_add);
  }

  // then if the reason is at k, also add to the other outcomes of all solvers
  if (contextless_reason.layer() == _k && _k>0) {
    for (int layer_to_add_to=contextless_reason.layer(); layer_to_add_to>0; layer_to_add_to--) {
      const int end_layer_of_solver_to_add_to = layer_to_add_to-1;
      for (int outcome=0; outcome<Global::problem.max_num_outcomes; outcome++) {
        const vector<int>& clause_to_add = Utils::tilde(timestep_zero_nogood_clause, 2 + outcome);
        _end_reasons_layer_to_solver[end_layer_of_solver_to_add_to]->add_clause(clause_to_add);
      }
    }
  }

  // then to the separate consistency check ones
  for (int layer_to_add_to=contextless_reason.layer(); layer_to_add_to>0; layer_to_add_to--) {
    _layer_to_consistency_solver[layer_to_add_to]->add_clause(timestep_zero_nogood_clause);
  }
}

void Obligation_Processor::add_reason_deterministic(const Reason_From_Orchestrator& reason) {
  const Contextless_Reason& contextless_reason = reason.contextless_reason();
  //_largest_constrained_layer = max(_largest_constrained_layer, contextless_reason.layer());
  const vector<int>& timestep_zero_nogood_clause = contextless_reason.timestep_zero_nogood_clause();

  ensure_solver_exists_for_end_reason_layer(contextless_reason.layer());

  for (int solver=max(0,reason.add_from_layer()-_layer_steps); solver<= contextless_reason.layer(); solver++) {
    // try do this explicitly, gets finicky...
    // Work out, for this solver, where to add
    const int solvers_lowest_supported_layer = solver;
    const int solvers_highest_supported_layer = solvers_lowest_supported_layer + _layer_steps - 1;

    const int lowest_layer_to_add_to = max(solvers_lowest_supported_layer, reason.add_from_layer());
    const int highest_layer_to_add_to = min(solvers_highest_supported_layer, contextless_reason.layer());

    // Note the reversed step/layer directions, finicky...
    const int highest_layer_step_to_add_to = _layer_steps - (lowest_layer_to_add_to-solver);
    const int lowest_layer_step_to_add_to = _layer_steps - (highest_layer_to_add_to-solver); // TODO?? ^

    const int highest_substep_to_add_to = highest_layer_step_to_add_to == _layer_steps+1 ? (_layer_steps-1)*_sub_steps_per_internal_layer_step+2 : (highest_layer_step_to_add_to-1)*_sub_steps_per_internal_layer_step + 1;
    const int lowest_substep_to_add_to = 1 + (lowest_layer_step_to_add_to-1)*_sub_steps_per_internal_layer_step;

    /*
    LOG << "add_reason, solver: " << solver << endl;

    LOG << "solvers_lowest_supported_layer    " <<  solvers_lowest_supported_layer << endl;
    LOG << "solvers_highest_supported_layer   " <<  solvers_highest_supported_layer << endl;
                                    
    LOG << "lowest_layer_to_add_to            " <<  lowest_layer_to_add_to << endl;
    LOG << "highest_layer_to_add_to           " <<  highest_layer_to_add_to << endl;
                                    
    LOG << "highest_layer_step_to_add_to      " <<  highest_layer_step_to_add_to << endl;
    LOG << "lowest_layer_step_to_add_to       " <<  lowest_layer_step_to_add_to << endl;
                                    
    LOG << "highest_substep_to_add_to         " <<  highest_substep_to_add_to << endl;
    LOG << "lowest_substep_to_add_to          " <<  lowest_substep_to_add_to << endl;
    LOG << "  == end solver ==" << endl;
    */

    for (int substep = lowest_substep_to_add_to; substep <= highest_substep_to_add_to; substep++) {
      const vector<int>& clause_to_add = Utils::tilde(timestep_zero_nogood_clause, substep);
      _end_reasons_layer_to_solver[solver]->add_clause(clause_to_add);
    }
  }

  /*
  // okay... so for a reason at layer n, lets add it to the first layer step to all the relevant solvers
  for (int layer_step_into_solver=1; layer_step_into_solver < _layer_steps; layer_step_into_solver++) {
    // work out which solvers to apply this to
    const int first_solver = obligation.add_from_layer() - (_layer_steps-1)
    const int last_solver = first_solver+_layer_steps;

  // have a special for the last timestep
  for (int end_reason_layer = reason.add_from_layer(); end_reason_layer <= contextless_reason.layer(); end_reason_layer++) {
    _end_reasons_layer_to_solver[end_reason_layer]->add_clause(Utils::tilde(contextless_reason.timestep_zero_nogood_clause(), _total_sub_steps));
  }


  // okay... so for a reason at layer n, it will be added to the end as above
  for (int layer_step_into_solver=1; layer_step_into_solver < _layer_steps; layer_step_into_solver++) {


  for (int offset_from_end=0; offset_from_end<_layer_steps; offset_from_end++) {
    const int solver_start = max(0,reason.add_from_layer() - offset_from_end);
    const int solver_end = max(0,contextless_reason.layer() - offset_from_end);

    ensure_solver_exists_for_end_reason_layer(solver_end);

    for (int sub_step=0; sub_step<_sub_steps_per_layer_step; sub_step++) {
      const int tilde = _total_sub_steps-1-offset_from_end*_sub_steps_per_layer_step - sub_step;
      const vector<int>& clause_to_add = Utils::tilde(contextless_reason.timestep_zero_nogood_clause(), tilde);

      for (int solver = solver_start; solver <= solver_end; solver++) {
        LOG << "adding clause, layer: " << contextless_reason.layer() << " add_from_layer: " << reason.add_from_layer() << " tilde: " << tilde << " solver: " << solver << " offset_from_end: " << offset_from_end << endl;
        _end_reasons_layer_to_solver[solver]->add_clause(clause_to_add);
      }
    }
  }
  LOG << "end add reason" << endl;
  */
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

int Obligation_Processor::set_success_from_solver_nondeterministic(const Obligation& original_obligation, int end_reasons_layer) {
  // check if need to bother extracting
  if (!original_obligation.reduce_reason_add_successor_to_queue()) {
    _success = Success(original_obligation, vector<Compressed_Actions>(), vector<Obligation>()); // TODO make it not even be able to retrieve it?
    return 0;
  }

  const vector<int>& model = _end_reasons_layer_to_solver[end_reasons_layer]->get_model();

  const vector<int>& all_actions = Global::problem.actions;
  const vector<int>& all_propositions = Global::problem.subproblem_to_propositions[0];

  vector<Obligation> successor_obligations;

  // extract action
  int action= -1;
  for (auto it=all_actions.begin(); it!=all_actions.end(); it++) {
    const int model_var_tilded_to_timestep_zero = model[*it-1];
    assert(abs(model_var_tilded_to_timestep_zero) == *it);
    if (model_var_tilded_to_timestep_zero>0) {
      action = model_var_tilded_to_timestep_zero;
      break;
    }
  }
  assert (action != -1); // an action must have been executed? // Review if this ever happens

  // extract AO
  int AO = -1;
  for (int i=0; i<Global::problem.ao_to_action.size(); i++) {
    const int possible_AO = i+1;
    const int model_index = possible_AO-1+Global::problem.total_per_timestep; //Utils::tilde(possible_AO-1, 1); // in timestep 1
    const int model_var_tilded_to_timestep_zero = Utils::tilde(model[model_index], -1);
    assert(possible_AO == abs(model_var_tilded_to_timestep_zero));
    if (model_var_tilded_to_timestep_zero > 0) {
      AO = model_var_tilded_to_timestep_zero;
      break;
    }
  }
  assert (AO != -1); // an action must have been executed? // Review if this ever happens

  // work out which number outcome that is
  int num_outcome = -1;
  for (int i=0; i<Global::problem.action_to_aos[action].size(); i++) {
    if (Global::problem.action_to_aos[action][i] == AO) {
      num_outcome = i;
    }
  }
  assert (num_outcome != -1);

  // work out outcomes by applying actions
  const vector<int>& aos = Global::problem.action_to_aos[action];
  for (int outcome=0; outcome<aos.size(); outcome++) {
    const int ao = aos[outcome];
    const vector<int>& effects = Global::problem.ao_to_effects[ao];
    Compressed_State successor_state = original_obligation.compressed_state().apply_effect(effects);

    int known_satisfying_layer;
    if (outcome == num_outcome) known_satisfying_layer = original_obligation.layer()-1;
    else                        known_satisfying_layer = _k;

    const int layer = get_lowest_satisfying_layer(successor_state, known_satisfying_layer);

    successor_obligations.push_back(Obligation(successor_state, layer, 0, true, vector<int>()));
  }

  /*
  // work out outcomes by applying actions
  const vector<int>& aos = Global::problem.action_to_aos[action];

  for (auto it=aos.begin(); it!=aos.end(); it++) {
    const int ao = *it;
    const vector<int>& effects = Global::problem.ao_to_effects[ao];
    Compressed_State successor_state = original_obligation.compressed_state().apply_effect(effects);

    const int layer = lowest_satisfying_layer(successor_state);

    if (layer == -1) {
      // no layer satisfies it, so ban the action and try again
      return action;
    }

    const int successor_obligation_or_count = (original_obligation.layer() == original_obligation.or_originating_layer()) ? original_obligation.or_count() : 0;

    successor_obligations.push_back(Obligation(
          successor_state,
          layer,
          0,
          true
          vector<int>()));
  }
  */

  /*
  // extract outcomes
  for (int outcome_id=1; outcome_id <= Global::problem.action_to_num_outcomes[action]; outcome_id++) {
    vector<int> state_vars;
    for (auto it=all_propositions.begin(); it!=all_propositions.end(); it++) {
      const int model_var_tilded_to_timestep_zero = Utils::tilde(model[Utils::tilde(*it,outcome_id)-1], -outcome_id);
      assert(abs(model_var_tilded_to_timestep_zero) == *it);
      if (model_var_tilded_to_timestep_zero>0) state_vars.push_back(model_var_tilded_to_timestep_zero);
    }

    const int successor_obligation_or_count = (original_obligation.layer() == original_obligation.or_originating_layer()) ? original_obligation.or_count() : 0;
    const int layer = original_obligation.layer()-1;
    successor_obligations.push_back(Obligation(
          Compressed_State(state_vars, subproblem, true),
          layer,
          subproblem,
          original_obligation.or_originating_layer(),
          successor_obligation_or_count,
          true));
  }
  */

  vector<Compressed_Actions> actions = vector<Compressed_Actions>({Compressed_Actions(vector<int>(1, action), 0)});
  Obligation original_obligation_with_action_banned = original_obligation.get_with_additional_banned_action(action);
  _success = Success(original_obligation, actions, successor_obligations);
  return 0;
}

// TODO extract the intermediate states for interleaved layers
void Obligation_Processor::set_success_from_solver_deterministic(const Obligation& original_obligation, int end_reasons_layer) {
  // this should unify old macros, old interleaved and this new combination
  // make it so the model is projected to the relevant subproblem propositions
  // Need to take in the model, and extract everything

  // check if need to bother extracting
  if (!original_obligation.reduce_reason_add_successor_to_queue()) {
    _success = Success(original_obligation, vector<Compressed_Actions>(), vector<Obligation>()); // TODO make it not even be able to retrieve it?
    return;
  }

  const vector<int>& model = _end_reasons_layer_to_solver[end_reasons_layer]->get_model();

  const int subproblem = original_obligation.subproblem();

  const vector<int>& all_actions = Global::problem.subproblem_to_actions[subproblem];
  const vector<int>& all_propositions = Global::problem.subproblem_to_propositions[subproblem];

  vector<Compressed_Actions> actions;
  vector<Obligation> successor_obligations;

  // extract actions from model.
  for (int layer_step=0; layer_step<_layer_steps; layer_step++) {
    vector<int> layer_actions;
    const int sub_steps_for_this_layer = layer_step == _layer_steps-1 ? 1 : _sub_steps_per_internal_layer_step;
    for (int layer_sub_step=0; layer_sub_step<sub_steps_for_this_layer; layer_sub_step++) {
      const int sub_step = layer_step*_sub_steps_per_internal_layer_step + layer_sub_step;
      for (auto it=all_actions.begin(); it!=all_actions.end(); it++) {
        const int model_var_tilded_to_timestep_zero = Utils::tilde(model[Utils::tilde(*it,sub_step)-1], -sub_step);
        assert(abs(model_var_tilded_to_timestep_zero) == *it);
        if (model_var_tilded_to_timestep_zero>0) layer_actions.push_back(model_var_tilded_to_timestep_zero);
      }
    }
    actions.push_back(Compressed_Actions(layer_actions, subproblem));
  }

  // extract successor states
  for (int layer_step=1; layer_step<=_layer_steps; layer_step++) {
    int sub_step;
    if (layer_step==_layer_steps) sub_step = (layer_step-1)*_sub_steps_per_internal_layer_step + 1;
    else                          sub_step = layer_step*_sub_steps_per_internal_layer_step;

    vector<int> state_vars;
    for (auto it=all_propositions.begin(); it!=all_propositions.end(); it++) {
      const int model_var_tilded_to_timestep_zero = Utils::tilde(model[Utils::tilde(*it,sub_step)-1], -sub_step);
      assert(abs(model_var_tilded_to_timestep_zero) == *it);
      if (model_var_tilded_to_timestep_zero>0) state_vars.push_back(model_var_tilded_to_timestep_zero);
    }

    //const int successor_obligation_or_count = (original_obligation.layer() == original_obligation.or_originating_layer()) ? original_obligation.or_count() : 0;
    const int layer = original_obligation.layer()-layer_step;

    successor_obligations.push_back(Obligation(
          Compressed_State(state_vars, subproblem, true),
          layer,
          subproblem,
          true,
          vector<int>()));
  }

  _success = Success(original_obligation, actions, successor_obligations);

  if (successor_obligations.rbegin()->compressed_state() == original_obligation.compressed_state()) {
    if (!Global::problem.evaluation_mode) LOG << "Same, layer_steps: " << _layer_steps << " end_reasons_layer" << end_reasons_layer << " success: " << _success.to_string() << endl;
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

void Obligation_Processor::set_reason_from_solver(const Obligation& original_obligation, int end_reasons_layer) {
  assert (original_obligation.banned_actions().size() == 0);

  // So this is actually doing a process of strengthening - lit removal
  //LOG << "finding a reason for the failed obligation: " << original_obligation.to_string() << endl;
  if (!original_obligation.reduce_reason_add_successor_to_queue()) {
    _reason = Reason_From_Worker( 
      Contextless_Reason(original_obligation.compressed_state().get_state(), original_obligation.layer(), original_obligation.subproblem()),
      original_obligation);
    return;
  }

  Lingeling* solver = _end_reasons_layer_to_solver[end_reasons_layer];

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

  assert (running_reason.size() != 0);

  _reason = Reason_From_Worker(
      Contextless_Reason(set_to_abs_sorted_vector(running_reason), original_obligation.layer(), original_obligation.subproblem()),
      original_obligation);
}

void Obligation_Processor::ensure_solver_exists_for_end_reason_layer(int end_reasons_layer) {
  assert (end_reasons_layer>=0);
  while (end_reasons_layer >= _end_reasons_layer_to_solver.size()) {
    _end_reasons_layer_to_solver.push_back(new Lingeling(_base_solver));
    _end_reasons_layer_to_solver[_end_reasons_layer_to_solver.size()-1]->set_name("end_reason_layer_" + std::to_string(end_reasons_layer));

    if (_layer_to_consistency_solver.size() == 0) _layer_to_consistency_solver.push_back(NULL);
    else                                          _layer_to_consistency_solver.push_back(new Lingeling());

    end_layer_to_chosen_outcome_added_clauses.push_back(vector<vector<int>>());
  }
}

void Obligation_Processor::reset_nondeterministic_solvers_for_new_k(int k) {
  LOG << "LOOK INTO THIS FURTHER" << endl; // maybe get rid of the ensure exists, and just have the "get ready for new k"
  _k = k;
  LOG << "new k " << k << endl;

  const int num_standard_solvers = _end_reasons_layer_to_solver.size();

  assert(num_standard_solvers == k);

  for (int i=0; i<num_standard_solvers; i++) {
    delete _end_reasons_layer_to_solver[i];
  }

  _end_reasons_layer_to_solver.clear();

  for (int end_layer=0; end_layer<num_standard_solvers; end_layer++) {
    //ensure_solver_exists_for_end_reason_layer(end_layer);
    Lingeling* new_solver = new Lingeling(_base_solver);
    LG(LCT) << "resetting end_reason_layer_" + std::to_string(end_layer) << endl;
    new_solver->set_name("end_reason_layer_" + std::to_string(end_layer));
    new_solver->add_clauses(end_layer_to_chosen_outcome_added_clauses[end_layer]);
    _end_reasons_layer_to_solver.push_back(new_solver);
  }
}

/*
int Obligation_Processor::get_lowest_satisfying_layer(const Compressed_State& state, int upper_known_satisfying_layer) {
  //LOG << " SLOW!" << endl;

  ensure_solver_exists_for_end_reason_layer(upper_known_satisfying_layer);

  if (upper_known_satisfying_layer == 0) {
    assert(state.is_goal());
    return 0;
  }

  if (state.is_goal()) return 0;


  for (int i=1;;i++) {
    if (_layer_to_consistency_solver[i]->solve(state.get_state())) {
      //LOG << "SLOW END" << endl;
      return i;
    }
  }
}
*/

int Obligation_Processor::get_lowest_satisfying_layer(const Compressed_State& state, int upper_known_satisfying_layer) {
  if (upper_known_satisfying_layer == 0) {
    assert(state.is_goal());
    return 0;
  }

  if (state.is_goal()) return 0;

  int lowest_sat = upper_known_satisfying_layer;
  int highest_unsat = 0;

  while (lowest_sat != highest_unsat+1) {
    const int mid = (lowest_sat+highest_unsat)/2;
    const bool sat_at_mid = _layer_to_consistency_solver[mid]->solve(state.get_state());
    if (sat_at_mid) {
      lowest_sat = mid;
    } else {
      highest_unsat = mid;
    }
  }
  return lowest_sat;
}





  /*
  //LOG << "asking is goal? " << state.to_string() << state.is_goal() << endl;

  ensure_solver_exists_for_end_reason_layer(upper_known_satisfying_layer);

  if (upper_known_satisfying_layer == 0) return 0;

  _layer_to_consistency_solver[upper_known_satisfying_layer]->solve(state.get_state());

  if (state.is_goal()) return 0;

  // binary search
  int lower_bound = 0;
  int upper_bound = upper_known_satisfying_layer;

  while (upper_bound != lower_bound + 1) {
    // test the middle
    int middle = (upper_bound+lower_bound)/2;
    bool valid_at_middle = _layer_to_consistency_solver[middle]->solve(state.get_state());

    //LOG << "checking if state is valid at layer: " << middle << " is it? " << valid_at_middle << " " << state.to_string() << endl;
    // update bounds
    if (valid_at_middle) upper_bound = middle;
    else                 lower_bound = middle;
  }

  return upper_bound;
  */
