#include "Layers.h"

// Layer objects
void Layers::print_reasons_size() {
  cout << "Layer reasons sizes:" << endl;
  for (int layer=0; layer<reasons.size(); layer++) {
    cout << "Layer: " << layer;
    if (num_subproblems != 1) cout << endl;
    for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
      int reason_size_sum = 0;
      const set<vector<int>>& all = reasons[layer][subproblem].get_all();
      for (auto it = all.begin(); it != all.end(); it++) {
        reason_size_sum += it->size();
      }
      cout << "  Subproblem: " << subproblem << " [" << reasons[layer][subproblem].size() << "] avg size: " << string_float(reason_size_sum/((all.size() + 0.0000001))) << endl;
    }
  }
}

void Layers::print_reasons() {
  cout << "Layer reasons:" << endl;
  for (int layer=0; layer<reasons.size(); layer++) {
    cout << "Layer: " << layer << endl;
    for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
      cout << "  Subproblem: " << subproblem << " [" << reasons[layer][subproblem].size() << "]" << endl;
      const set<vector<int>>& all = reasons[layer][subproblem].get_all();
      for (auto it = all.begin(); it != all.end(); it++) {
        cout << "    " << state_string(*it) << endl;
      }
    }
  }
}

void Layers::check() {
  cout << "CHECKING LAYERS" << endl;
  // some checks on the consistency of the reasons
  // each clause should only be in one layer
  vector<vector<set<vector<int>>>> layer_subproblem_reasons = vector<vector<set<vector<int>>>>(reasons.size());
  assert(layer_subproblem_reasons.size() == reasons.size());
  for (int layer=0; layer<reasons.size(); layer++) {
    layer_subproblem_reasons[layer] = vector<set<vector<int>>>(num_subproblems);
    for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
      layer_subproblem_reasons[layer][subproblem] = reasons[layer][subproblem].get_all();
    }
  }

  for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
    for (int layer=0; layer<reasons.size(); layer++) {
      set<vector<int>> X = layer_subproblem_reasons[layer][subproblem];
      for (auto it=X.begin(); it!=X.end(); it++) {
        vector<int> reason = *it;
        for (int check_layer=layer+1; check_layer<reasons.size(); check_layer++) {
          // see if this reason has been repeated
          cout << "check layer " << check_layer << endl;
          cout << "layer subprob size " << layer_subproblem_reasons.size() << endl;
          cout << "reasons.size()" << reasons.size() << endl;
          assert(layer_subproblem_reasons.size() > check_layer);
          assert(layer_subproblem_reasons[check_layer].size() > subproblem);
          for (auto itb=layer_subproblem_reasons[check_layer][subproblem].begin(); itb!=layer_subproblem_reasons[check_layer][subproblem].end(); itb++) {
            vector<int> comparison_reason = *itb;
            cout << "checking layers " << layer << " -> " << check_layer << " : " << state_string(reason) << endl;
            assert(reason != comparison_reason);
          }
        }
      }
    }
  }
  cout << "END CHECKING LAYERS" << endl;
}

void Layers::add_reason(const vector<int>& reason, int layer, int subproblem){
  // TODO don't check layer 0
  // check all reason vars are propositions
#if DEBUG_WARNING_REPEATED_REASON
  // TODO This block is just for debugging
  tuple<int, vector<int>> x = tuple<int, vector<int>>(layer, reason);
  if (seen_before.find(x) != seen_before.end()) {
    cout << "WARNING!!!!! clause seen before " << layer << " " << state_string(reason) << endl;
    //assert(0);
  }
  seen_before.insert(x);
#endif

  for (int i=0; i<reason.size(); i++){
    assert(propositions_set.find(abs(reason[i])) != propositions_set.end());
  }

  assert(layer<reasons.size());

  // check if weaker than a clause in the current layer - then drop the clause (should be rare?..)
  if(LOUD && layer == 0) cout << "layer 0, this should only be for goal lits!" << endl;
  if(LOUD) cout << "add_reason layer " << layer << " , reason: " << state_string(reason) << endl;
  // TODO check for subsumption both ways, along the way

  // check if stronger than a clause in the current layer  AND all previous layers. if so, remove ALL the weaker ones

  // Can cheaply check if it is a weaker clause - and avoid adding. Hard to check if a stronger clause
  // So if it is a stronger clause, just add as if new

  // If a lower layer has this clause, remove it from that and add it here

  if (reason.size() == 1 && layer == 0) {
    //cout << "needed?" << endl;
    if(LOUD) cout << "special for goal lits, adding directly" << endl;
    reasons[layer][subproblem].insert(reason);
    solver_add_reason(reason, layer, subproblem);
    return;
  }

  if(LOUD) cout << "check if adding clause stronger" << endl;

  for (int check_layer = 0; check_layer < layer; check_layer++) {
    if (reasons[check_layer][subproblem].contains_remove(reason)) {
      reasons[layer][subproblem].insert(reason);
      solver_add_reason(reason, layer, subproblem);
      return;
    }
  }

  if(LOUD) cout << "check if adding clause weaker" << endl;
  // TODO inneficient - investigate

  // if this, or a stronger reason is already registered at this or a higher layer, don't add
  for (int check_layer = layer; check_layer < reasons.size(); check_layer++) {
    if (reasons[check_layer][subproblem].contains_subset(reason)) return;
  }

  if(LOUD) cout << "new clause so adding it directly" << endl;

  // If a new clause add it here
  reasons[layer][subproblem].insert(reason);
  solver_add_reason(reason, layer, subproblem);
}

set<vector<int>> Layers::get_reasons_not_in_next_layer(int layer, int subproblem) {
  return reasons[layer][subproblem].get_all();
}

bool Layers::same_as_previous(int nextLayer, set<int> subproblems_to_check) {
  const int layer = nextLayer - 1; // the layer to test if there is nothing here that is not in the next layer
  assert(layer >= 0);
  assert(layer < reasons.size());

  if (subproblems_to_check.find(PDR::num_subproblems-1) != subproblems_to_check.end()) {
    // has the final subproblem, a bit hacky, special case when only this one
    assert(subproblems_to_check.size() == 1);

    // as is the final, need ALL to be empty to declare the same
    for (int subproblem=0; subproblem<PDR::num_subproblems; subproblem++) {
      if (reasons[layer][subproblem].size()) return false;
    }
    return true;
  } else {
    // if any of the ones to check are empty, then that subproblem is unsat, so the whole problem is unsat 
    for (auto it=subproblems_to_check.begin(); it!=subproblems_to_check.end(); it++) {
      cout << "checking (layer, subproblem) (" << layer << "," << *it << ")" << endl;
      if (reasons[layer][*it].size() == 0) return true;
    }
    return false;
  }
}

int Layers::get_first_empty_layer() {
  // TODO inconsistent use of iterators
  for (int layer = 0; layer < reasons.size(); layer++) {
    bool empty_layer = true;
    for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
      if (reasons[layer][subproblem].size()) {
        empty_layer = false;
        break;
      }
    }
    if (empty_layer) return layer;
  }
  // none of the layers so far are empty
  return reasons.size(); // the index of the next layer
}

void Layers::push_nonfinal_up_to_layer(int desired_just_empty_layer) {
  cout << "push_nonfinal_up_to_layer" << endl;
  // make sure THIS layer is empty, but the one directly under is not (unless it is a completely empty subproblem)
  // uses manual enumerate then push (as opposed to some more direct efficient method)
  map<int, int> subproblem_to_first_empty_layer;
  int max_empty_layer = -1; // DEBUg to make sure input matches

  for (int subproblem=0; subproblem<num_subproblems-1; subproblem++) {
    cout << "subproblem " << subproblem << endl;
    // find the first empty layer
    int empty_layer = INT_MIN;
    for (int layer = 0; layer < reasons.size(); layer++) {
      if (reasons[layer][subproblem].size()) empty_layer = INT_MIN;
      else {
        if (empty_layer == INT_MIN) empty_layer = layer;
      }
    }
    if (empty_layer == INT_MIN) empty_layer = reasons.size();
    max_empty_layer = max(max_empty_layer, empty_layer);

    // with that first empty layer, work out the difference for how much to push up
    const int difference = desired_just_empty_layer - empty_layer;
    if (difference) {
      // move up everythong by that distance, starting from the top
      cout << "desired empty layer: " << desired_just_empty_layer << endl;
      cout << "empty layer: " << empty_layer << endl;
      for (int layer=empty_layer; layer>=0; layer--) {
        const int destination_layer = layer + difference;
        cout << "pushing " << layer << " to " << destination_layer << endl;
        const set<vector<int>>& all_reasons = reasons[layer][subproblem].get_all();
        for (auto it=all_reasons.begin(); it!=all_reasons.end(); it++) {
          const vector<int>& reason = *it;
          add_reason(reason, destination_layer, subproblem);
        }
      }
    }
  }
  assert(max_empty_layer == desired_just_empty_layer);
}

/* looks like a tilde?
   vector<int> convert_clause_for_steps(vector<int> clause, int steps) {
   if (steps == 1) return clause;
   vector<int> ret_val;

   for (auto it=clause.begin(); it!=clause.end(); it++) {
   const int lit = *it;
   assert(abs(lit) - PDR::total_per_timestep - 1 < PDR::total_per_timestep); // check that the original lit was in timestep 2
   if (lit > 0) ret_val.push_back(lit + (steps-1)*PDR::total_per_timestep);
   else         ret_val.push_back(lit - (steps-1)*PDR::total_per_timestep);
   }
   return ret_val;
   }
   */

void Dagster_Layers::make_layer_exist(int layer) {
  while (reasons.size() < layer + 1) {
    vector<Set_Trie> new_layer;
    for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
      new_layer.push_back(Set_Trie());
    }
    reasons.push_back(new_layer);
  }
}

// upper layer to add to, this function adds to all less also
void Dagster_Layers::solver_add_reason(const vector<int>& reason, int layer, int subproblem) { // TODO rename
  // dagster only set up for static constant number of steps
  assert(MS_ONLY_MAX_SOLVER_STEP);

  if(LOUD) cout << "dagster layer solver_add_reason layer, subproblem: " << layer << " " << subproblem << endl;

  // see if this should be added to the actual solver
  if (project_state_to_propositions(reason, subproblem_to_propositions[subproblem]).size() < reason.size()) {
    if (reason.size() == 1 && layer==0) {
      cout << "SPECIAL EXEMPTION FOR GOAL LITS" << endl;
      if(LOUD) cout << "NOT ACTUALLY ADDING REASON TO SINGLE SOLVER (AS IS A GOAL PROP AT THE WRONG SUBPROBLEM - will add when relevant): " << state_string(reason) << endl;
      return;
    } else {
      if(LOUD) cout << "NOT ACTUALLY ADDING REASON AS DOESN'T PROJECT TO PROPOSITIONS USED, TO SINGLE SOLVER: " << state_string(reason) << endl;
      return;

      assert(0); // TODO what?...
      cout << "giving special excemption to the last one TODO review this whole system" << endl;
      //if (subproblem+1 != num_subproblems) assert(0); // this is baed on the subproblem we happen to be in - problematic for adding a permament clause
    }
    // projection lost some lits, so projected space is small, so drop clauses
  }

  const vector<int>& clause_one_step = get_clause_from_reason(reason, subproblem);

  for (int worker=1; worker<num_workers+1; worker++) {
    while (worker_upper_layer_dagster_clauses_to_add[worker].size()<=layer) {
      worker_upper_layer_dagster_clauses_to_add[worker].push_back(vector<vector<int>>()); // just make sure it is full
    }
    worker_upper_layer_dagster_clauses_to_add[worker][layer].push_back(clause_one_step);
  }
}

Single_Layers::~Single_Layers() {
#if MS_ONLY_MAX_SOLVER_STEP
  const int START_STEP = PDR::max_macro_steps;
#else
  const int START_STEP = 1;
#endif
  for (int i=0; i < layer_to_steps_solvers.size(); i++) {
    for (int j=START_STEP; j < layer_to_steps_solvers[i].size(); j++) delete layer_to_steps_solvers[i][j];
  }
}

void Single_Layers::make_layer_exist(int layer) {
#if MS_ONLY_MAX_SOLVER_STEP
  const int START_STEP = PDR::max_macro_steps;
#else
  const int START_STEP = 1;
#endif

  if (baseLingelings.size() == 0) {
    baseLingelings = vector<Lingeling*>(PDR::max_macro_steps+1, NULL);

    for (int steps = START_STEP; steps < PDR::max_macro_steps + 1; steps++) {
      cout << "starting getting cnf " << steps << endl;
      baseLingelings[steps] = new Lingeling((tmp_dir + "/tmp_regular_" + to_string(steps) + ".cnf").c_str());
      if (use_OOC) {
        for (auto it=ooc_clauses_for_every_new_solver.begin(); it!=ooc_clauses_for_every_new_solver.end(); it++) baseLingelings[steps]->add_clause(*it);
      }
      const vector<int> blank = vector<int>();

      PDR::parallel_timer.stored_duration = 0;
      PDR::parallel_timer.start();
      baseLingelings[steps]->solve(blank);
      PDR::parallel_timer.pause();
      PDR::total_parallel_time_spent += PDR::parallel_timer.stored_duration;
    }
  }

  while (reasons.size() < layer + 1) {
    vector<Set_Trie> new_layer;
    for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
      new_layer.push_back(Set_Trie());
    }
    reasons.push_back(new_layer);

    layer_to_steps_solvers.push_back(vector<Lingeling*>(PDR::max_macro_steps+1, NULL));
    const int new_layer_number = layer_to_steps_solvers.size()-1;
    //layer_to_steps_solvers[new_layer_number].push_back(NULL); // as 1 indexed, for number of steps
    for (int steps = START_STEP; steps < PDR::max_macro_steps + 1; steps++) {
      Lingeling* new_solver = new Lingeling(baseLingelings[steps]);
      layer_to_steps_solvers[new_layer_number][steps] = new_solver;
    }

#if TEST_NAL
    Lingeling* NAL_new_solver = new Lingeling(baseLingeling);
    NAL_solvers.push_back(NAL_new_solver);
#endif
  }
}

// upper layer to add to, this function adds to all less also
void Single_Layers::solver_add_reason(const vector<int>& reason, const int layer, const int subproblem) {
#if MS_ONLY_MAX_SOLVER_STEP
  const int START_STEP = PDR::max_macro_steps;
#else
  const int START_STEP = 1;
#endif

  if(LOUD) cout << "single layer solver_add_reason" << endl;

  // see if this should be added to the actual solver
  if (project_state_to_propositions(reason, subproblem_to_propositions[subproblem]).size() < reason.size()) {
    if (reason.size() == 1 && layer==0) {
      cout << "SPECIAL EXEMPTION FOR GOAL LITS" << endl;
      if(LOUD) cout << "NOT ACTUALLY ADDING REASON TO SINGLE SOLVER (AS IS A GOAL PROP AT THE WRONG SUBPROBLEM - will add when relevant): " << state_string(reason) << endl;
      return;
    } else {
      if(LOUD) cout << "NOT ACTUALLY ADDING REASON AS DOESN'T PROJECT TO PROPOSITIONS USED, TO SINGLE SOLVER: " << state_string(reason) << endl;
      return;

      assert(0); // TODO what?...
      cout << "giving special excemption to the last one TODO review this whole system" << endl;
      //if (subproblem+1 != num_subproblems) assert(0); // this is baed on the subproblem we happen to be in - problematic for adding a permament clause
    }
    // projection lost some lits, so projected space is small, so drop clauses
  }

  const vector<int>& clause = get_clause_from_reason(reason, subproblem);

#if TEST_NAL
  // NAL clause
  vector<int> NAL_clause;
  for (auto it=clause.begin(); it!=clause.end(); it++) {
    if (activation_vars.find(abs(*it)) == activation_vars.end()) NAL_clause.push_back(*it);
  }
  assert(clause.size() > NAL_clause.size());
#endif

  for (int i=0; i<layer+1; i++) {
    if(LOUD) cout << "ACTUALLY ADDING CLAUSE TO SOLVER LAYER " << i << " : " << state_string(clause) << endl;
    if(LOUD) cout << "solver" << i << " add clause" << state_string(clause) << endl;

#if MULTI_STEP_INTERLEAVED
    // Interleaved
    for (int starting_higher_layer = 0; starting_higher_layer<PDR::max_macro_steps; starting_higher_layer++) {
      const int max_steps = min(i+starting_higher_layer+1, PDR::max_macro_steps);
      const int min_steps = starting_higher_layer+1;
      assert(PDR::max_macro_steps != 1 || ((max_steps == 1) && (min_steps ==1)));
#if MS_ONLY_MAX_SOLVER_STEP
      const int steps = PDR::max_macro_steps;
      if ((steps <= max_steps) && (steps >= min_steps)) {
#else
        for (int steps = min_steps; steps <= max_steps; steps++) {
#endif
          make_layer_exist(i+starting_higher_layer);
          vector<int> clause_to_add = tilde_clause(clause, starting_higher_layer);
          layer_to_steps_solvers[i+starting_higher_layer][steps]->add_clause(clause_to_add);
        }
      }
#else
      // Macros
      for (int steps = START_STEP; steps<PDR::max_macro_steps+1; steps++) {
        layer_to_steps_solvers[i][steps]->add_clause(convert_clause_for_steps(clause, steps));
      }
#endif

#if TEST_NAL
      NAL_solvers[i]->add_clause(NAL_clause);
#endif
    }
  }
