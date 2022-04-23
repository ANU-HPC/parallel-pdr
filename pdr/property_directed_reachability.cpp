#include "property_directed_reachability.h"

Cnf* get_cnf(const vector<vector<int>>& clauses) {
  Cnf* cnf = new Cnf();
  for (int i=0; i<clauses.size(); i++) {
    int array_clause[clauses[i].size()+1] = {}; // TODO delete object, scope?
    for (int j=0; j<clauses[i].size(); j++) {
      array_clause[j] = clauses[i][j];
    }
    array_clause[clauses[i].size()] = 0;
    cnf->add_clause(array_clause);
  }
  return cnf;
}

string string_float(float number) {
  stringstream stream;
  stream << fixed << setprecision(2) << number;
  return stream.str();
}

float float_time(clock_t time) {
  return ((float)time)/CLOCKS_PER_SEC;
}

string vector_string(vector<int> state) {
  // give by copy
  string ret_val = "";
  for (int i=0; i<state.size(); i++) {
    if (state[i] > 0) {
      ret_val += "  \033[38;5;10m";
      ret_val += to_string(state[i]);
    } else {
      ret_val += " \033[38;5;9m";
      ret_val += to_string(state[i]);
    }
    ret_val += "\033[0m";
  }
  return ret_val;
}

bool in_pos_vector(int x, const vector<int>& vec) {
  return binary_search(vec.begin(), vec.end(), x);
}


namespace property_directed_reachability {
  vector<int> project_state_to_propositions(const vector<int>& state, const vector<int>& project_propositions) {
    auto state_current = state.begin();
    const auto state_end = state.end();
    auto project_current = project_propositions.begin();
    const auto project_end = project_propositions.end();
  
    assert(is_abs_sorted(state));
    assert(is_sorted(project_current, project_end));
  
    vector<int> result;
  
    while (state_current != state_end && project_current != project_end) {
      if (abs(*state_current) == *project_current) {
        result.push_back(*state_current);
        state_current++;
        project_current++;
      } else if (abs(*state_current) < *project_current) {
        state_current++;
      } else {
        assert(abs(*state_current) > *project_current);
        project_current++;
      }
    }
    return result;
  }

  vector<int> inflate_compressed_to_full(const vector<int>& compressed_state, const vector<int>& full) {
    auto full_current = full.begin();
    const auto full_end = full.end();
    auto compressed_current = compressed_state.begin()+2;
    const auto compressed_end = compressed_state.end();
  
    assert(is_abs_sorted(full));
    assert(is_sorted(compressed_current, compressed_end));
  
    vector<int> result;
  
    while (compressed_current != compressed_end) {
      if (abs(*full_current) == *compressed_current) {
        result.push_back(*full_current);
        full_current++;
        compressed_current++;
      } else {
        result.push_back(-(*full_current));
        full_current++;
      }
    }

    while (full_current != full_end) {
      result.push_back(-(*full_current));
      full_current++;
    }

    return result;
  }

  vector<int> compress_state(const vector<int>& state, const int subproblem, const bool proper_state) {
    vector<int> result;
    result.push_back(subproblem);
    if (proper_state) result.push_back(1);
    else              result.push_back(0);
    
    for (auto it=state.begin(); it!=state.end(); it++) {
      if ((*it)>0) result.push_back(*it);
    }

    assert(is_sorted(result.begin()+2, result.end()));
    return result;
  }

  vector<int> uncompress_state(const vector<int>& compressed_state) {
    const int subproblem = compressed_state[0];
    const bool proper_state = compressed_state[1];
    if (proper_state) return inflate_compressed_to_full(compressed_state, subproblem_to_propositions[subproblem]);
    else              return inflate_compressed_to_full(compressed_state, subproblem_to_actions[subproblem]);
  }

  bool subset(vector<int> a, vector<int> b) { //b is a subset of a
    set<int> a_set = set<int>(a.begin(), a.end());
    set<int> B_set = set<int>(b.begin(), b.end());
    set<int> C;

    std::set_difference(B_set.begin(), B_set.end(), 
        a_set.begin(), a_set.end(),
        std::inserter(C, C.begin()));

    return C.size() == 0; // 0 iff no elements ONLY in b, so b is a subset
  }

  string str(const Obligation& obl) {
    return "[(state " + state_string(obl.state) + ") (layer " + to_string(obl.layer) + ") (subproblem " + to_string(obl.subproblem) + ") (worker " + to_string(obl.worker) + ") (reduce " + to_string(obl.reduce) + ") (keep_states " + to_string(obl.keep_states) + ")]";
  }


  bool state_conforms_to_only_one_cliques(vector<int> state, const int subproblem){
    sort(state.begin(), state.end());
    const vector<vector<int>>& cliques = subproblem_to_only_one_cliques[subproblem];
    for (auto it=cliques.begin(); it!=cliques.end(); it++) {
      vector<int> clique = *it;
      sort(clique.begin(), clique.end());
      vector<int> intersection; 
      set_intersection(state.begin(),state.end(),clique.begin(),clique.end(), std::back_inserter(intersection));
      assert(intersection.size() <= 1); // if 2 or more, then the clique is wrong
      if (intersection.size() == 0) return false;
    }
    return true;
  }

  void BUFFER_print_state_count() {
    cout << "S \\ L";
    for (int layer=0; layer < PDR::BUFFER_layer_to_subproblem_to_state_count.size(); layer++) {
      cout << "\t" << layer;
    }
    cout << endl;

    for (int subproblem=0; subproblem < PDR::num_subproblems; subproblem++) {
      cout << subproblem;
      for (int layer=0; layer < PDR::BUFFER_layer_to_subproblem_to_state_count.size(); layer++) {
        cout << "\t" << PDR::BUFFER_layer_to_subproblem_to_state_count[layer][subproblem];
      }
      cout << endl;
    }
  }

  bool state_print_comp(int i,int j) { 
#if VERBOSE_STATE
    if (abs(i) < symbols.size() && abs(j) >= symbols.size()) return true;
    else if (abs(i) >= symbols.size() && abs(j) < symbols.size()) return false;
    else if (abs(i) >= symbols.size() && abs(j) >= symbols.size()) return abs(i)<abs(j);
    return symbols[abs(i)]<symbols[abs(j)];
#else
    return abs(i)<abs(j); 
#endif
  }

#if VERBOSE_STATE
  string pos_state_string(vector<int> state) {
    // give by copy
    string ret_val = "";
    sort(state.begin(), state.end(), state_print_comp);
    for (int i=0; i<state.size(); i++) {
      if (state[i] > 0) {
        ret_val += "  \033[38;5;10m";
        if (state[i] < symbols.size())                           ret_val += symbols[state[i]];
        else if (state[i] - total_per_timestep < symbols.size()) ret_val += "*" + symbols[state[i] - total_per_timestep];
        else                                                     ret_val += to_string(state[i]);
      }
      ret_val += "\033[0m";
    }
    return ret_val;
  }
#else
  string pos_state_string(vector<int> state) {
    // give by copy
    string ret_val = "";
    sort(state.begin(), state.end(), state_print_comp);
    for (int i=0; i<state.size(); i++) {
      if (state[i] > 0) {
        ret_val += "  \033[38;5;10m";
        ret_val += to_string(state[i]);
      }
      ret_val += "\033[0m";
    }
    return ret_val;
  }
#endif

#if VERBOSE_STATE
  string lit_string(int lit) {
    assert(lit);
    string ret_val = "";
    if (lit<0) ret_val += "-";
    int var = abs(lit);
    while (var > symbols.size()) {
      ret_val += "*";
      var = var - total_per_timestep;
    }
    assert(var>0);
    ret_val += symbols[var];
    return ret_val;
  }

  string state_string(vector<int> state) {
    // give by copy
    string ret_val = "";
    sort(state.begin(), state.end(), state_print_comp);
    for (int i=0; i<state.size(); i++) {
      if (state[i] > 0) ret_val += "  \033[38;5;10m";
      else              ret_val += " \033[38;5;9m-";
      ret_val += lit_string(state[i]);
      ret_val += "\033[0m";
    }
    return ret_val;
  }
#else
  string state_string(vector<int> state) {
    // give by copy
    string ret_val = "";
    sort(state.begin(), state.end(), state_print_comp);
    for (int i=0; i<state.size(); i++) {
      if (state[i] > 0) {
        ret_val += "  \033[38;5;10m";
        ret_val += to_string(state[i]);
      } else {
        ret_val += " \033[38;5;9m";
        ret_val += to_string(state[i]);
      }
      ret_val += "\033[0m";
    }
    return ret_val;
  }
#endif

  string state_string(set<int> state) {return state_string(vector<int>(state.begin(), state.end()));}

  string str(vector<vector<int>> x) {
    string s = "";
    for (auto it=x.begin(); it!=x.end(); it++) {
      s += state_string(*it) + "\n"; 
    }
    return s;
  }

  string str(set<vector<int>> x) {
    string s = "";
    for (auto it=x.begin(); it!=x.end(); it++) {
      s += state_string(*it) + "\n"; 
    }
    return s;
  }

  int tilde_lit(int lit, int amount) {
    assert(lit != 0);
    if (lit > 0) return lit + amount * total_per_timestep;
    else         return lit - amount * total_per_timestep;
  }

  vector<int> tilde_clause(vector<int> clause, int amount) {
    vector<int> ret_val(clause.size());
    for (int i=0; i<clause.size(); i++) {
      ret_val[i] = tilde_lit(clause[i], amount);
    }
    assert(ret_val.size() == clause.size());
    return ret_val;
  }

  vector<int> get_clause_from_reason(const vector<int>& reason, const int subproblem) {
    vector<int> clause;
    for (int i=0; i<reason.size(); i++){
      clause.push_back(-PDR::tilde_lit(reason[i], 1));
    }
    for (int i=0; i<subproblem_to_clause_validating_lits[subproblem].size(); i++) {
      clause.push_back(subproblem_to_clause_validating_lits[subproblem][i]);
    }
    return clause;
  }

  int get_reason_scc_node(const vector<int>& reason);

  vector<int> project_state_to_only_one_mutex_cliques(const vector<int>& state, const int subproblem) {
    cout << "WARNING - seems to be slow" << endl;
    // assume this is a consistent state, so for each 
    // assume cliques are disjoint
    set<int> props_to_remove;
    const vector<vector<int>>& cliques = subproblem_to_only_one_cliques[subproblem];
    for (auto it=cliques.begin(); it!=cliques.end(); it++) {
      const vector<int>& clique = *it; 
      const vector<int>& projected = project_state_to_propositions(state, clique);
      vector<int> intersection;
      for(int i=0; i<projected.size(); i++) {
        if (projected[i]>0) intersection.push_back(projected[i]);
      }
      //cout << "state:" << state_string(state) << endl;
      //cout << "clique:" << state_string(clique) << endl;
      assert(intersection.size() <= 1);
      if (intersection.size() == 1) {
        const int prop_to_remove = intersection[0];
        props_to_remove.insert(prop_to_remove);
      }
    }

    vector<int> projected_state;
    for (auto it=state.begin(); it!=state.end(); it++) {
      if (props_to_remove.find(*it) == props_to_remove.end()) {
        projected_state.push_back(*it);
      }
    }
    return projected_state;
  }

  // State_Actions Class for tracking which actions lead to which states
  void State_Actions::set_final_state(const vector<int>& state, const int in_subproblem) {
    final_state = state;
    subproblem = in_subproblem;
    assert(subproblem == PDR::num_subproblems-1); // should be the last one
  }

  //void add_state(const vector<int>& succ_state, const vector<int>& prev_state, const vector<int>& actions, int succ_state_layer) {
  void State_Actions::add_state(const vector<int>& succ_state, const vector<int>& prev_state, const vector<int>& actions, const int state_subproblem, const int succ_state_layer) {
    // TODO consider loops and minimal length paths?
    // Only add if not seen before
    const vector<int>& compressed_prev_state = PDR::compress_state(prev_state, state_subproblem, true);
    const vector<int>& compressed_succ_state = PDR::compress_state(succ_state, state_subproblem, true);
    const vector<int>& compressed_actions    = PDR::compress_state(actions, state_subproblem, false);

    assert(succ_state.size() == prev_state.size());
    if(data.find(compressed_succ_state) == data.end()) {
      data[compressed_succ_state] = tuple<vector<int>, vector<int>, int> (compressed_prev_state, compressed_actions, succ_state_layer);
    }
  }

  void State_Actions::remove_state(const vector<int>& succ_state) {
    cout << "PROBLEMATIC!" << endl;
    data.erase(succ_state);
  }
  
  void State_Actions::write_empty_plan() {
    ofstream plan_file;
    if (PDR::isolate_subproblems) plan_file.open(tmp_dir + "/partial_plan" + to_string(PDR::isolate_subproblems_number));
    else                          plan_file.open(tmp_dir + "/plan");
    plan_file.close();
  }

  void State_Actions::print_write_path(const vector<int>& final_state, int subproblem) {
    if (PRINT_END_RESULT) cout << "WRITING PLAN" << endl;
    ofstream plan_file;
    if (PDR::isolate_subproblems) plan_file.open(tmp_dir + "/partial_plan" + to_string(PDR::isolate_subproblems_number));
    else                          plan_file.open(tmp_dir + "/plan");

    set<vector<int>> seen_compressed_states; // just to check for loops

    vector<int> compressed_succ_state;
    vector<int> compressed_prev_state = compress_state(final_state, subproblem, true);
    vector<int> compressed_actions_executed;
    vector<vector<int>> backwards_plan;
    assert(subproblem == num_subproblems-1); // assume the plan we care about is the last/special one
    const vector<int> compressed_projected_initial_state = compress_state(project_state_to_propositions(initial_state, subproblem_to_propositions[subproblem]), subproblem, true);
    do {
      assert(seen_compressed_states.find(compressed_prev_state) == seen_compressed_states.end());
      seen_compressed_states.insert(compressed_prev_state);

      compressed_succ_state = compressed_prev_state;

      assert(data.find(compressed_succ_state) != data.end()); // Assert the map access will work

      const tuple<vector<int>, vector<int>, int> X = data[compressed_succ_state];
      compressed_prev_state = get<0>(X);
      compressed_actions_executed = get<1>(X);
      const int succ_state_layer = get<2>(X);
      backwards_plan.push_back(uncompress_state(compressed_actions_executed));
    } while (compressed_prev_state != compressed_projected_initial_state); // if the previous state is not the initial state go again

    vector<int> actions_executed;
    if (PRINT_END_RESULT) cout << endl;
    int planstep = 0;
    for(int backstep=backwards_plan.size()-1; backstep>=0; backstep--) {
      actions_executed = backwards_plan[backstep];
      for(int i=0; i<actions_executed.size(); i++) {
        if (actions_executed[i]>0) {
          string symbol = symbols[actions_executed[i]];
          for (int j=0; j<= symbol.size(); j++) {
            if (symbol[j] == '(' || symbol[j] == ',') symbol[j] = ' ';
          }
          if (PRINT_END_RESULT) cout      << planstep << " : (" << symbol << endl;
          plan_file << planstep << " : (" << symbol << "\n";
          planstep++;
        }
      }
    }
    plan_file.close();
    if (PRINT_END_RESULT) cout << "FINISHED WRITING PLAN" << endl;
  }

  void State_Actions::print_write_path_final_state() {
    if ((final_state.size() == 0) && subproblem == -1) write_empty_plan();
    else                                               print_write_path(final_state, subproblem);
  }

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

    const vector<int>& clause = get_clause_from_reason(reason, subproblem);
    for (int worker=1; worker<num_workers+1; worker++) {
      while (worker_upper_layer_dagster_clauses_to_add[worker].size()<=layer) {
        worker_upper_layer_dagster_clauses_to_add[worker].push_back(vector<vector<int>>()); // just make sure it is full
      }
      worker_upper_layer_dagster_clauses_to_add[worker][layer].push_back(clause);
    }
  }

  Single_Layers::~Single_Layers() {
    for (int i=0; i < layer_to_steps_solvers.size(); i++) {
      for (int j=1; j < layer_to_steps_solvers[i].size(); j++) delete layer_to_steps_solvers[i][j];
    }
  }

  void Single_Layers::make_layer_exist(int layer) {
    if (baseLingelings.size() == 0) {
      baseLingelings.push_back(NULL);
      for (int steps = 1; steps < MAX_SOLVER_STEPS + 1; steps++) {
        cout << "starting getting cnf " << steps << endl;
        baseLingelings.push_back(new Lingeling((tmp_dir + "/tmp_regular_" + to_string(steps) + ".cnf").c_str()));
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

      layer_to_steps_solvers.push_back(vector<Lingeling*>());
      const int new_layer_number = layer_to_steps_solvers.size()-1;
      layer_to_steps_solvers[new_layer_number].push_back(NULL); // as 1 indexed, for number of steps
      for (int steps = 1; steps < MAX_SOLVER_STEPS + 1; steps++) {
        Lingeling* new_solver = new Lingeling(baseLingelings[steps]);
        layer_to_steps_solvers[new_layer_number].push_back(new_solver);
      }

#if TEST_NAL
      Lingeling* NAL_new_solver = new Lingeling(baseLingeling);
      NAL_solvers.push_back(NAL_new_solver);
#endif
    }
  }


      // upper layer to add to, this function adds to all less also
  void Single_Layers::solver_add_reason(const vector<int>& reason, const int layer, const int subproblem){
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
      for (int starting_higher_layer = 0; starting_higher_layer<MAX_SOLVER_STEPS; starting_higher_layer++) {
        const int max_steps = min(i+starting_higher_layer+1, MAX_SOLVER_STEPS);
        const int min_steps = starting_higher_layer+1;
        assert(MAX_SOLVER_STEPS != 1 || ((max_steps == 1) && (min_steps ==1)));
        for (int steps = min_steps; steps <= max_steps; steps++) {
          make_layer_exist(i+starting_higher_layer);
          vector<int> clause_to_add = tilde_clause(clause, starting_higher_layer);
          layer_to_steps_solvers[i+starting_higher_layer][steps]->add_clause(clause_to_add);
        }
      }
#else
      // Macros
      for (int steps = 1; steps<MAX_SOLVER_STEPS+1; steps++) {
        layer_to_steps_solvers[i][steps]->add_clause(convert_clause_for_steps(clause, steps));
      }
#endif

#if TEST_NAL
      NAL_solvers[i]->add_clause(NAL_clause);
#endif
    }
  }

  pair<vector<vector<int>>, vector<vector<int>>> project_to_state_actions(const vector<int>& assignment, const int subproblem, const int steps_used) {
    assert(is_abs_sorted(assignment));
    vector<vector<int>> succ_state_sequence;
    vector<vector<int>> actions_executed_sequence;
    assert(assignment.size() == (steps_used+1)*total_per_timestep);

    const int num_actions = actions.size(); 
    const int num_propositions = total_per_timestep - num_actions;
    assert(PDR::subproblem_to_propositions[0].size() == num_propositions);

    int DEBUG_largest_var=-1;
    for (int timestep = 0; timestep < steps_used+1; timestep++) {
      const int lower_action_bound = timestep*total_per_timestep+1;
      const int upper_action_bound = num_actions + timestep*total_per_timestep+1;
      const int lower_proposition_bound = num_actions + timestep*total_per_timestep+1;
      const int upper_proposition_bound = (timestep+1)*total_per_timestep+1;

      vector<int> actions_executed;
      vector<int> succ_state;

      // get all the actions (first)
      for (int action_var = lower_action_bound ; action_var < upper_action_bound; action_var++) {
        actions_executed.push_back(tilde_lit(assignment[action_var-1], -timestep));
        assert(abs(assignment[action_var-1]) == action_var);
        DEBUG_largest_var = max(DEBUG_largest_var, action_var);
      }

      for (int proposition_var = lower_proposition_bound ; proposition_var < upper_proposition_bound; proposition_var++) {
        succ_state.push_back(tilde_lit(assignment[proposition_var-1], -timestep));
        assert(abs(assignment[proposition_var-1]) == proposition_var);
        DEBUG_largest_var = max(DEBUG_largest_var, proposition_var);
      }

      assert(actions_executed == project_state_to_propositions(actions_executed, PDR::actions));
      assert(succ_state == project_state_to_propositions(succ_state, PDR::subproblem_to_propositions[0])); // TODO fix for subproblems
      assert(actions_executed.size() == num_actions);
      assert(succ_state.size() == num_propositions);

      succ_state_sequence.push_back(succ_state);
      actions_executed_sequence.push_back(actions_executed);
    }

    assert(DEBUG_largest_var == (steps_used+1)*total_per_timestep);
    assert(DEBUG_largest_var == assignment.size());

    return pair<vector<vector<int>>, vector<vector<int>>>(succ_state_sequence, actions_executed_sequence);
  }

  vector<string> split(const string& input){
    vector<string> tokens;
    string buffer;
    stringstream ss(input);
    while (ss >> buffer) tokens.push_back(buffer);
    return tokens;
  }

  void read_mapping(){
    string line;
    ifstream mapping_file(tmp_dir + "/tmp_mapping.txt");
    if (mapping_file.is_open())
    {
      symbols.push_back("NONE");
      while (getline(mapping_file, line)) {
        vector<string> type_symbol_variable = split(line);
        string symbol = type_symbol_variable[1];
        int variable = stoi(type_symbol_variable[2]);
        assert(variable == symbols.size());
        symbols.push_back(symbol);
      }
      mapping_file.close();
    }
  }
    
  void read_extra_settings(string extra_settings_filename) {
    PDR::extra_settings_read = true;
    // read extra settings - the is mainly for testing, so new feastures can be quickly added and removed
    const int total_expected = 10;
    set<string> ignore_keys;
    ignore_keys.insert("activation_literals");

    // note ignoring keys that do matter, but they are given by a different channel for now
    ignore_keys.insert("decomposed");
    ignore_keys.insert("report_plan");
    ignore_keys.insert("dagster");
    ignore_keys.insert("mpi_nodes");

    string line;
    ifstream extra_settings_file(extra_settings_filename);
    assert(extra_settings_file.is_open());
    int seen = 0;
    while (getline(extra_settings_file, line)) {
      seen++;
      vector<string> key_val = split(line);
      assert(key_val.size() == 2);
      const string key = key_val[0];
      const string val = key_val[1];
      const int val_int = stoi(val);
      if (ignore_keys.find(key) != ignore_keys.end()) continue;
      else if (key == "project_last") {
        if (val_int == 1)      project_last = true;
        else if (val_int == 0) project_last = false;
        else assert(0);
      } else if (key == "complete_nonfinal") {
        if (val_int == 1)      complete_nonfinal = true;
        else if (val_int == 0) complete_nonfinal = false;
        else assert(0);
      } else if (key == "obligation_rescheduling") {
        if (val_int == 1)      obligation_rescheduling = true;
        else if (val_int == 0) obligation_rescheduling = false;
        else assert(0);
      } else if (key == "use_ooc") {
        if (val_int == 1)      use_OOC = true;
        else if (val_int == 0) use_OOC = false;
        else assert(0);
      } else if (key == "isolate_subproblems") {
        if (val_int == 1)      isolate_subproblems = true;
        else if (val_int == 0) isolate_subproblems = false;
        else assert(0);
      } else {
        cout << "ERROR setting: " << key << endl;
        assert(0);
      }
    }
    extra_settings_file.close();
    if (complete_nonfinal && project_last) {
      assert(0); // Can't handle projecting AND complete nonfinal - will try do them together, and not do it well
    }
    assert(seen == total_expected);
  }

  // Read in the dagster info file created by the parser
  void read_problem_input(){
    Parser parser;
    parser.parse(tmp_dir);
    //parser.print();

    total_per_timestep                         = parser.total_per_timestep;
    actions                                    = parser.actions;
    actions_set                                = parser.actions_set;
    num_subproblems                            = parser.num_subproblems;
    initial_state                              = parser.initial_state;
    goal_condition                             = parser.goal_condition;
    subproblem_to_propositions                 = parser.subproblem_to_propositions;
    subproblem_to_actions                      = parser.subproblem_to_actions;
    subproblem_to_clause_validating_lits       = parser.subproblem_to_clause_validating_lits;
    subproblem_to_assumptions                  = parser.subproblem_to_assumptions;
    subproblem_to_only_one_cliques             = parser.subproblem_to_only_one_cliques;

    for (int i=0; i<initial_state.size(); i++) {
      int var = abs(initial_state[i]);
      propositions.push_back(var);
      propositions_set.insert(var);
    }

    assert(subproblem_to_propositions.size() == num_subproblems);

    // process subproblem_only_one_cliques
    for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
      set<int> props_mentioned; // just a check
      for (int clique=0; clique<subproblem_to_only_one_cliques[subproblem].size(); clique++) {
        vector<int> clause_zero = subproblem_to_only_one_cliques[subproblem][clique];
        assert(is_abs_sorted(clause_zero));
        vector<int> clause_one;
        for (auto it=clause_zero.begin(); it!=clause_zero.end(); it++) {
          assert(props_mentioned.find(*it) == props_mentioned.end());
          props_mentioned.insert(*it);
          clause_one.push_back(tilde_lit(*it, 1));
        }

        for (int i=0; i<subproblem_to_clause_validating_lits[subproblem].size(); i++) {
          clause_zero.push_back(subproblem_to_clause_validating_lits[subproblem][i]);
        }

        for (int i=0; i<subproblem_to_clause_validating_lits[subproblem].size(); i++) {
          clause_one.push_back(subproblem_to_clause_validating_lits[subproblem][i]);
        }

        // for use_ooc
        ooc_clauses_for_every_new_solver.push_back(clause_zero);
        ooc_clauses_for_every_new_solver.push_back(clause_one);
      }
    }

#if TEST_NAL
    for (int subproblem=0; subproblem<PDR::num_subproblems; subproblem++) {
      activation_vars.insert(abs(PDR::subproblem_to_clause_validating_lits[subproblem][0]));
    }
#endif
  }

  void read_problem_input_isolate_subproblems(){
    Parser parser;
    parser.parse(tmp_dir);
    //parser.print();

    total_per_timestep                         = parser.total_per_timestep;
    actions                                    = parser.actions;
    actions_set                                = parser.actions_set;

    // Changed from the parser
    num_subproblems                            = 1;
    subproblem_to_propositions[0]              = parser.subproblem_to_propositions[PDR::isolate_subproblems_number];
    subproblem_to_actions[0]                   = parser.subproblem_to_actions[PDR::isolate_subproblems_number];
    subproblem_to_clause_validating_lits[0]    = parser.subproblem_to_clause_validating_lits[PDR::isolate_subproblems_number];
    subproblem_to_assumptions[0]               = parser.subproblem_to_assumptions[PDR::isolate_subproblems_number];
    subproblem_to_only_one_cliques[0]          = parser.subproblem_to_only_one_cliques[PDR::isolate_subproblems_number];
    goal_condition                             = parser.subproblem_to_isolate_goal[isolate_subproblems_number];
    initial_state                              = project_state_to_propositions(parser.initial_state, subproblem_to_propositions[0]);

    for (int i=0; i<initial_state.size(); i++) {
      int var = abs(initial_state[i]);
      propositions.push_back(var);
      propositions_set.insert(var);
    }
    assert(parser.subproblem_to_propositions.size() == parser.num_subproblems);
    assert(initial_state.size() == propositions_set.size()); 
    if (use_OOC) exit(1); // not set up for it

#if TEST_NAL
    exit(1); // not set up for it
#endif
  }

  void dagster_initialize_to_send_clauses(const set<int>& workers_to_compile_clauses_for) {
    // sends off the clauses 
    for (auto it=workers_to_compile_clauses_for.begin(); it!=workers_to_compile_clauses_for.end(); it++) {
      const int worker = *it;
      assert(worker);
      for (int layer=0; layer<worker_upper_layer_dagster_clauses_to_add[worker].size(); layer++) {
        const vector<vector<int>>& clauses = worker_upper_layer_dagster_clauses_to_add[worker][layer];
        if (clauses.size()) {
          if(A)cout << "preparing an extra clauses message for worker " << worker << " with clauses sizes: ";
          for (auto it=clauses.begin(); it!=clauses.end(); it++) {
            vector<int> clause = *it; 
            if(A)cout << clause.size() << " ";
          }
          if(A)cout << endl;

          Message* add_clauses_message = new Message(layer, ADD_CLAUSES_FROM);
          add_clauses_message->additional_clauses = get_cnf(clauses);
          add_clauses_worker(add_clauses_message, worker);
          worker_upper_layer_dagster_clauses_to_add[worker][layer].clear();
        }
      }
    }
  }

  // TODO neatness rename the layer for state layer, and succ state layer for clarity
  vector<int> single_get_successor(const vector<int>& state, int layer, int subproblem, bool record) {
    // TODO giving memo result in the function means unsat cores will be wrong for subsequent reason call
    //const tuple<vector<int>, int> state_layer_pair (state, layer);
    if(LOUD) single_layers.print_reasons();
    if(LOUD) cout << "state: " << state_string(state) << endl;
    //if(LOUD) cout << "allowed actions: " << state_string(subproblem_to_actions[subproblem]) << endl;
    //if(LOUD) cout << "allowed propositions: " << state_string(subproblem_to_propositions[subproblem]) << endl;
    //if(LOUD) cout << "assumptions: " << state_string(subproblem_to_assumptions[subproblem]) << endl;

    if(LOUD) cout << "single_get_successor for layer " << layer << endl;
    assert(single_layers.layer_to_steps_solvers.size()>layer-1);
    timing.lingeling_start(subproblem);
    //cout << "solver" << layer-1 << " all assumptions " << state_string(state) << " " << state_string(subproblem_to_assumptions[subproblem]) << endl;
    bool success1;
#if TEST_NAL
    bool NAL_success1;
#endif
    if (PDR::use_OOC) {
      const vector<int>& projected_state = project_state_to_only_one_mutex_cliques(state, subproblem);
      parallel_timer.start();
      success1 = single_layers.layer_to_steps_solvers[layer-1][PDR::MS_steps_used]->solve_unmentioned_assumptions(projected_state, subproblem_to_assumptions[subproblem]);
#if TEST_NAL
      NAL_success1 = single_layers.NAL_solvers[layer-1]->solve_unmentioned_assumptions(projected_state, subproblem_to_assumptions[subproblem]);
#endif
      parallel_timer.pause();
    } else {
      parallel_timer.start();
      success1 = single_layers.layer_to_steps_solvers[layer-1][PDR::MS_steps_used]->solve_unmentioned_assumptions(state, subproblem_to_assumptions[subproblem]);
#if TEST_NAL
      NAL_success1 = single_layers.NAL_solvers[layer-1]->solve_unmentioned_assumptions(state, subproblem_to_assumptions[subproblem]);
#endif
      parallel_timer.pause();
    }
    
#if TEST_NAL
    assert(success1 == NAL_success1);
#endif
    if (success1) {
      timing.lingeling_stop(true);
      vector<int> assignments = single_layers.layer_to_steps_solvers[layer-1][PDR::MS_steps_used]->get_model();
      pair<vector<vector<int>>, vector<vector<int>>> x = project_to_state_actions(assignments, subproblem, PDR::MS_steps_used);
      vector<vector<int>> succ_state_sequence = get<0>(x);
      vector<vector<int>> actions_executed_sequence = get<1>(x);
      if (PDR::storing_actions && record && subproblem == PDR::num_subproblems-1) assert(succ_state_sequence[0] == state); // broken on subproblems?
      vector<int> prev_state = state;
      for (int timestep = 0; timestep < PDR::MS_steps_used; timestep++) {
        if(LOUD) cout << "single found a successor state, used actions: " << state_string(actions_executed_sequence[timestep]) << endl;
        if (PDR::storing_actions && record && subproblem == PDR::num_subproblems-1) state_actions.add_state(succ_state_sequence[timestep+1], succ_state_sequence[timestep], actions_executed_sequence[timestep], subproblem, layer+1);
        //prev_state = succ_state_sequence[future]; // for next time
      }
      return succ_state_sequence[PDR::MS_steps_used];
    } else {
      timing.lingeling_stop(false);
      const tuple<vector<int>, int> state_layer_pair (state, layer);
      assert(is_abs_sorted(state));
      return vector<int>();
    }
  }

  bool single_has_successor(const vector<int>& state, int layer, int subproblem){
    if(LOUD) cout << "single_has_successor for layer " << layer << " subproblem: " << subproblem << endl;
    assert(single_layers.layer_to_steps_solvers.size()>layer-1);

    // check to make sure this is being used as thought
    if (PDR::use_OOC) assert(state.size() == project_state_to_only_one_mutex_cliques(state, subproblem).size());

    parallel_timer.start();
    timing.lingeling_start(subproblem);
    bool return_value1 = single_layers.layer_to_steps_solvers[layer-1][PDR::MS_steps_used]->solve_unmentioned_assumptions(state, subproblem_to_assumptions[subproblem]);
#if TEST_NAL
    bool NAL_return_value1 = single_layers.NAL_solvers[layer-1]->solve_unmentioned_assumptions(state, subproblem_to_assumptions[subproblem]);
    assert(return_value1 == NAL_return_value1);
#endif
    //bool return_value2 = single_layers.solvers[layer-1]->solve(state);
    //assert (return_value1 == return_value2);
    timing.lingeling_stop(return_value1);
    parallel_timer.pause();
    return return_value1;
  }

  vector<int> single_get_reason_just_used(const vector<int>& state, int layer, int subproblem) {
    return single_layers.layer_to_steps_solvers[layer-1][PDR::MS_steps_used]->used_assumptions();
  }

  vector<int> single_get_reason(const vector<int>& state, int layer, int subproblem) {
    // TODO does not use state, could be confusing

    vector<int> running_reason = single_layers.layer_to_steps_solvers[layer-1][PDR::MS_steps_used]->used_assumptions();
    if (S) cout << "in layer " << layer << endl;
    if (S) cout << "subproblem " << subproblem << endl;
    if (S) cout << "In reduce, starting candidate [ " << running_reason.size() << " / " << subproblem_to_propositions[subproblem].size() << " ] " << state_string(running_reason) << endl;
    //return running_reason;

    vector<int> propositions_to_exclude = propositions;

    for (int i=0; i<propositions_to_exclude.size(); i++) {
      int proposition_to_exclude = propositions_to_exclude[i];
      vector<int> possible_reason;
      for (int j=0; j<running_reason.size(); j++) {
        if (abs(running_reason[j]) != proposition_to_exclude) possible_reason.push_back(running_reason[j]);
      }
      // proposition to exclude has not already been excluded
      if (running_reason != possible_reason) {
        assert(running_reason.size() == possible_reason.size()+1);
        // have a new reason candidate, if a valid reason use as the new reason
        if (!single_has_successor(possible_reason, layer, subproblem)) {
          running_reason = single_layers.layer_to_steps_solvers[layer-1][PDR::MS_steps_used]->used_assumptions();
          if (S) cout << "In reduce, mid-way candidate [ " << running_reason.size() << " / " << subproblem_to_propositions[subproblem].size() << " ] " << state_string(running_reason) << endl;
        }
      }
    }
    return running_reason;
  }

  void print_dagster_stats() {
    for (int subproblem=0; subproblem<PDR::num_subproblems; subproblem++) {
      cout << "dagster_sat_count " << subproblem << " : " << dagster_sat_counts[subproblem] << endl;
    }
    for (int subproblem=0; subproblem<PDR::num_subproblems; subproblem++) {
      cout << "dagster_unsat_count " << subproblem << " : " << dagster_unsat_counts[subproblem] << endl;
    }
    cout << "dagster_call_count: " << PDR::dagster_call_count << endl;
    cout << "dagster_total_time: " << string_float(float_time(dagster_total_time)) << endl;

    cout << "simulated_parallel_total_time: " << string_float(float_time(total_parallel_time_spent)) << endl;
  }

  void dagster_start(int argc, char **argv) {
    cout << "dagster initializing" << endl;
    // for mpi
    // Default: BREADTH_FIRST_NODE_ALLOCATIONS = false;

    command_line_arguments.master_sub_mode = 1;
    command_line_arguments.sat_solution_interrupt = 1;
    command_line_arguments.ENUMERATE_SOLUTIONS = false;
    command_line_arguments.mode = 3;
    global_init(argc, argv, PDR::tmp_dir, subproblem_to_propositions, subproblem_to_assumptions);
    Cnf* cnf = new Cnf((PDR::tmp_dir + "/../blank/tmp_decomposed.cnf").c_str());
    Dag* dag = new Dag((PDR::tmp_dir + "/../blank/tmp_decomposed.dag").c_str());
    load_CNF_DAG(cnf, dag);
    delete cnf;
    delete dag;
    cout << "dagster finished initializing" << endl;
  }

  void dagster_stop() {
    shutdown();
  }

  void add_reason(const vector<int>& reason, int layer, int subproblem) { 
    if (PDR::runtime_dagster) return dagster_layers.add_reason(reason, layer, subproblem);
    else                      return single_layers.add_reason(reason, layer, subproblem);
  }

  void make_layer_exist(int layer) { 
    if (PDR::runtime_dagster) dagster_layers.make_layer_exist(layer);
    else                      single_layers.make_layer_exist(layer);
  }

  set<vector<int>> get_reasons_not_in_next_layer(int layer, int scc_node) { 
    if (PDR::runtime_dagster) return dagster_layers.get_reasons_not_in_next_layer(layer, scc_node);
    else                      return single_layers.get_reasons_not_in_next_layer(layer, scc_node);
  }

  bool same_as_previous(int layer, set<int> layers_to_check) { 
    if (PDR::runtime_dagster) return dagster_layers.same_as_previous(layer, layers_to_check);
    else                      return single_layers.same_as_previous(layer, layers_to_check);
  }

  int get_first_empty_layer() { 
    if (PDR::runtime_dagster) return dagster_layers.get_first_empty_layer();
    else                      return single_layers.get_first_empty_layer();
  }

  void push_nonfinal_up_to_layer(int just_empty_layer) { 
    if (PDR::runtime_dagster) return dagster_layers.push_nonfinal_up_to_layer(just_empty_layer);
    else                      return single_layers.push_nonfinal_up_to_layer(just_empty_layer);
  }

  Dagster_Layers dagster_layers;
  Single_Layers single_layers;
  State_Actions state_actions;

  int MS_steps_used = 1;
  string state_string(vector<int> state);
  vector<vector<int>> BUFFER_layer_to_subproblem_to_state_count; // for use in buffer only (would be a member of buffer, but scope and position of classes)

  Timing timing;
  Timer parallel_timer;
  clock_t total_parallel_time_spent = 0;

  vector<int> initial_state;
  vector<int> goal_condition;
  vector<int> propositions;
  set<int> propositions_set;
  vector<int> actions;
  set<int> actions_set;
  int total_per_timestep;
  vector<string> symbols;
  string tmp_dir;

  int num_workers = INT_MIN;
  vector<Lingeling*> baseLingelings;

  // TODO tmp
  vector<vector<vector<vector<int>>>> worker_upper_layer_dagster_clauses_to_add;

  // at runtime, use dagster? if false use lingeling instead, ONLY ONE AT A TIME
  bool runtime_dagster = true;
  bool storing_actions = true;

  vector<int> dagster_sat_counts;
  vector<int> dagster_unsat_counts;
  int dagster_call_count = 0;
  clock_t dagster_total_time = 0;

  // setting file settings (should be integrated properly long term)
  bool project_last = true;
  bool complete_nonfinal = true;
  bool obligation_rescheduling = true;
  bool use_OOC = true; // use only_one_clique information
  bool isolate_subproblems = true;
  bool extra_settings_read = false;

  // In the case of isolate_subproblem, the subproblem we are dealing with in this instance
  int isolate_subproblems_number = -1;

  vector<vector<int>> ooc_clauses_for_every_new_solver;
  set<int> workers_to_send_to;

#if TEST_NAL
  set<int> activation_vars;
#endif

  // Dagster specific
  int num_subproblems;
  map<int, vector<int>> subproblem_to_propositions;
  map<int, vector<int>> subproblem_to_actions;
  map<int, vector<int>> subproblem_to_assumptions;
  map<int, vector<int>> subproblem_to_clause_validating_lits;

  map<int, vector<vector<int>>> subproblem_to_only_one_cliques;
}
