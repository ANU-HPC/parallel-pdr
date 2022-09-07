#include "property_directed_reachability.h"
#include "options.h"

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

bool in_abs_sorted_vector(int x, const vector<int>& vec) {
  for (auto it=vec.begin(); it!=vec.end(); it++) {
    if (*it == x) {
      return true;
    }
  }
  return false;
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

  vector<int> compress_state(const vector<int>& state, const int subproblem, const int compress_mode) {
    assert((compress_mode >= 0) && (compress_mode <= 2));
    // No overlap or the comparison will not work
    if (compress_mode == COMPRESS_FULL_STATE) assert(state.size() == PDR::propositions.size());
    if (compress_mode == COMPRESS_PARTIAL_STATE) assert(state.size() != PDR::propositions.size());

    vector<int> result;
    result.push_back(subproblem);
    result.push_back(compress_mode);
    if (compress_mode == COMPRESS_FULL_STATE || compress_mode == COMPRESS_ACTION) {
      for (auto it=state.begin(); it!=state.end(); it++) {
        if ((*it)>0) result.push_back(*it);
      }
      assert(is_sorted(result.begin()+2, result.end()));
    } else {
      for (auto it=state.begin(); it!=state.end(); it++) result.push_back(*it);
    }

    return result;
  }

  vector<int> uncompress_state(const vector<int>& compressed_state) {
    const int subproblem = compressed_state[0];
    const int compress_mode = compressed_state[1];
    switch (compress_mode) {
      case COMPRESS_ACTION:
        return inflate_compressed_to_full(compressed_state, subproblem_to_actions[subproblem]);
      case COMPRESS_FULL_STATE:
        return inflate_compressed_to_full(compressed_state, subproblem_to_propositions[subproblem]);
      case COMPRESS_PARTIAL_STATE:
        return vector<int>(compressed_state.begin()+2, compressed_state.end());
      default:
        cerr << "ERROR trying to inflate unknown compressed state: " << compress_mode << " " << PDR::state_string(compressed_state) << endl;
        assert(0);
        exit(1);
    }
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


  bool state_conforms_to_only_one_strips_cliques(vector<int> state, const int subproblem){
    cout << "ERROR CLIQUES NO LONGER PASSED ALONG" << endl;
    exit(0);
    sort(state.begin(), state.end());
    const vector<vector<int>>& cliques = subproblem_to_only_one_strips_cliques[subproblem];
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
    if (lit == 0) return "0";
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
      else              ret_val += " \033[38;5;9m";
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

  string uncoloured_state_string(vector<int> state) {
    // give by copy
    string ret_val = "";
    sort(state.begin(), state.end(), state_print_comp);
    for (int i=0; i<state.size(); i++) {
      ret_val += " ";
      //if (state[i] > 0) ret_val += "  ";
      //else              ret_val += " -";
      ret_val += lit_string(state[i]);
    }
    return ret_val;
  }

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
    cout << "ERROR CLIQUES NO LONGER PASSED ALONG" << endl;
    exit(0);
    cout << "WARNING - seems to be slow" << endl;
    // assume this is a consistent state, so for each 
    // assume cliques are disjoint
    set<int> props_to_remove;
    const vector<vector<int>>& cliques = subproblem_to_only_one_strips_cliques[subproblem];
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

  pair<vector<vector<int>>, vector<vector<int>>> project_to_state_actions(const vector<int>& assignment, const int subproblem, const int steps_used) {
    assert(is_abs_sorted(assignment));
    vector<vector<int>> succ_state_sequence;
    vector<vector<int>> actions_executed_sequence;
    assert(assignment.size() == (steps_used+1)*total_per_timestep - num_aux);

    const int num_actions = actions.size(); 
    const int num_propositions = total_per_timestep - num_actions - num_aux;
    assert(subproblem == 0);
    assert(PDR::subproblem_to_propositions[0].size() == num_propositions);

    int DEBUG_largest_var=-1;
    for (int timestep = 0; timestep < steps_used+1; timestep++) {
      const int lower_action_bound = timestep*total_per_timestep+1;
      const int upper_action_bound = num_actions + timestep*total_per_timestep+1;
      const int lower_proposition_bound = num_actions + timestep*total_per_timestep+1;
      const int upper_proposition_bound = (timestep+1)*total_per_timestep+1 - num_aux;

      vector<int> actions_executed;
      vector<int> succ_state;

      // get all the actions (first)
      for (int action_var = lower_action_bound ; action_var < upper_action_bound; action_var++) {
        actions_executed.push_back(tilde_lit(assignment[action_var-1], -timestep));
        assert(abs(assignment[action_var-1]) == action_var);
        DEBUG_largest_var = max(DEBUG_largest_var, action_var);
      }

      // then all the propositions
      for (int proposition_var = lower_proposition_bound ; proposition_var < upper_proposition_bound; proposition_var++) {
        succ_state.push_back(tilde_lit(assignment[proposition_var-1], -timestep));
        assert(abs(assignment[proposition_var-1]) == proposition_var);
        DEBUG_largest_var = max(DEBUG_largest_var, proposition_var);
      }

      assert(succ_state.size() == num_propositions);
      assert(actions_executed == project_state_to_propositions(actions_executed, PDR::actions));
      assert(succ_state == project_state_to_propositions(succ_state, PDR::subproblem_to_propositions[0])); // TODO fix for subproblems
      assert(actions_executed.size() == num_actions);
      assert(succ_state.size() == num_propositions);

      succ_state_sequence.push_back(succ_state);
      actions_executed_sequence.push_back(actions_executed);
    }

    assert(DEBUG_largest_var == (steps_used+1)*total_per_timestep - num_aux);
    assert(DEBUG_largest_var == assignment.size()); // There are some aux variables in the assignment - but these are not at the end, so the largest var will still be the assignment size

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
    const int total_expected = 12;
    set<string> ignore_keys;
    ignore_keys.insert("activation_literals");

    // note ignoring keys that do matter, but they are given by a different channel for now
    ignore_keys.insert("decomposed");
    ignore_keys.insert("report_plan");
    ignore_keys.insert("dagster");
    ignore_keys.insert("mpi_nodes");
    ignore_keys.insert("backwards");

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
      } else if (key == "max_macro_steps") {
        assert(val_int>0);
        max_macro_steps = val_int;
      } else {
        cout << "ERROR setting: " << key << endl;
        assert(0);
      }
    }
    extra_settings_file.close();
    if (complete_nonfinal && project_last) {
      assert(0); // Can't handle projecting AND complete nonfinal - will try do them together, and not do it well
    }
    if ((MS_ONLY_MAX_SOLVER_STEP == 1) && (MS_DEFAULT_STEPS_USED != 0)) {
      cerr << "ERROR: MS_DEFAULT_STEPS_USED must be set to 0 when MS_ONLY_MAX_SOLVER_STEP is set to 1, as the default is meaningless when only using the max" << endl;
      exit(1);
    }
    assert(seen == total_expected);
  }

  // Read in the dagster info file created by the parser
  void read_problem_input(){
    Parser parser;
    parser.parse(tmp_dir);
    //parser.print();

    total_per_timestep                         = parser.total_per_timestep;
    num_aux                                    = parser.num_aux;
    actions                                    = parser.actions;
    actions_set                                = parser.actions_set;
    num_subproblems                            = parser.num_subproblems;
    initial_state                              = parser.initial_state;
    goal_condition                             = parser.goal_condition;
    subproblem_to_propositions                 = parser.subproblem_to_propositions;
    subproblem_to_actions                      = parser.subproblem_to_actions;
    subproblem_to_clause_validating_lits       = parser.subproblem_to_clause_validating_lits;
    subproblem_to_assumptions                  = parser.subproblem_to_assumptions;
    er_to_corresponding                        = parser.er_to_corresponding;
    corresponding_to_er                        = parser.corresponding_to_er;

    //subproblem_to_only_one_strips_cliques      = parser.subproblem_to_only_one_strips_cliques;

    for (int i=0; i<subproblem_to_propositions[0].size(); i++) {
      int var = abs(subproblem_to_propositions[0][i]);
      propositions.push_back(var);
      propositions_set.insert(var);
    }

    assert(subproblem_to_propositions.size() == num_subproblems);

    if (use_OOC) exit(1); // not set up for it
    /* For use in use_ooc - unused and sometiems problematic when introducing more types of cliques
    // process subproblem_only_one_strips_cliques
    for (int subproblem=0; subproblem<num_subproblems; subproblem++) {
      set<int> props_mentioned; // just a check
      for (int clique=0; clique<subproblem_to_only_one_strips_cliques[subproblem].size(); clique++) {
        vector<int> clause_zero = subproblem_to_only_one_strips_cliques[subproblem][clique];
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
    */

#if TEST_NAL
    for (int subproblem=0; subproblem<PDR::num_subproblems; subproblem++) {
      activation_vars.insert(abs(PDR::subproblem_to_clause_validating_lits[subproblem][0]));
    }
#endif

    for (int const lit : goal_condition) {
      if (lit>0) positive_goal_condition.push_back(lit);
    }

#if ALLOW_HEURISTIC_H_ADD
    for (auto const& var : propositions) positive_effect_strips_to_actions[var] = vector<int>();
    for (auto const& action : actions) action_to_positive_preconditions[action] = vector<int>();

    for (auto const& action_preconditions : parser.action_to_preconditions) {
      const int action = action_preconditions.first;
      for (int const& precondition : action_preconditions.second) {
        if (precondition>0) action_to_positive_preconditions[action].push_back(precondition);
      }
    }

    for (auto const& action_effects_strips : parser.action_to_effects_strips) {
      const int action = action_effects_strips.first;
      for (int const& effect : action_effects_strips.second) {
        if (effect>0) positive_effect_strips_to_actions[effect].push_back(action);
      }
    }

    // Deal with ADL conditional effects
    // map from prop_to_be_made_true, to the actions AND the conditions for making it true
    for (auto const& prop : propositions) {
      positive_effect_adl_to_actions_conditions[prop] = vector<vector<int>>();
    }

    for (auto const& action_condition_then_consequence : parser.action_literals_to_extra_positive_effects) {
      const auto& action_condition = action_condition_then_consequence.first;
      const auto& consequence = action_condition_then_consequence.second;
      for (auto const& consequence_prop : consequence) {
        assert(consequence_prop > 0);
        assert(propositions_set.find(consequence_prop) != propositions_set.end());
        positive_effect_adl_to_actions_conditions[consequence_prop].push_back(action_condition);
        //cout << "consequence " << lit_string(consequence_prop) << " activated by " << state_string(action_condition) << endl;
      }
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
    //subproblem_to_only_one_strips_cliques[0]   = parser.subproblem_to_only_one_strips_cliques[PDR::isolate_subproblems_number];
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

  int h_add(const vector<int>& compressed_state) {
    if (compressed_state[1] == COMPRESS_PARTIAL_STATE) {
      // a partial state, convert to full state format
      const int subproblem = compressed_state[0];
      return h_add(compress_state(uncompress_state(compressed_state), subproblem, COMPRESS_FULL_STATE));
    }

    assert(ALLOW_HEURISTIC_H_ADD);
    if (h_add_memo.find(compressed_state) != h_add_memo.end()) return h_add_memo[compressed_state];

    h_add_h_function_memo.clear();
    const unordered_set<int> state_props(compressed_state.begin()+2, compressed_state.end());
    int sum = 0;
    for (int const positive_goal : positive_goal_condition) {
      sum += h_add_h_function(positive_goal, state_props);
      //sum =max(sum, h_add_h_function(positive_goal, compressed_state)); // to change to h^max
    }

    h_add_memo[compressed_state] = sum;
    return sum;
  }

  int h_add_h_function(const int p, const unordered_set<int>& state_props) {
    // If already working on it, are in a loop, so cut this path off
    if (h_add_h_function_open.find(p) != h_add_h_function_open.end()) return 100000;

    // Get the noted value if present
    if (h_add_h_function_memo.find(p) != h_add_h_function_memo.end()) return h_add_h_function_memo[p];

    // If p \in s, return 0
    if (state_props.find(p) != state_props.end()) return 0;

    // Mark as "open" investigation into p
    h_add_h_function_open.insert(p);
    // Not an end, so instead return the min
    int min_so_far = 10000;

    // Start out with strips
    vector<int> actions_to_test = positive_effect_strips_to_actions[p];

    // Add some more from ADL
    for (auto const& action_condition : positive_effect_adl_to_actions_conditions[p]) {
      const int action = *action_condition.begin();
      assert(actions_set.find(action) != actions_set.end());

      for (auto it=action_condition.begin()+1; it!=action_condition.end(); it++) {
        const int condition_lit = *it;
        const int condition_prop = abs(condition_lit);
        assert(propositions_set.find(condition_prop) != propositions_set.end());
        if (condition_lit>0) {
          if (state_props.find(condition_prop) == state_props.end()) {
            // To be relevant this prop has to be in the state. It is not so the action is not relevant.
            continue;
          }
        } else {
          if (state_props.find(condition_prop) != state_props.end()) {
            // To be relevant this prop has to NOT be in the state. It IS so the action is not relevant.
            continue;
          }
        }
      }
      // Got through that, so must be relevant
      actions_to_test.push_back(action);
    }

    for (int const& action : actions_to_test) {
      int one_plus_sum = 1;
      for (int const& q : action_to_positive_preconditions[action]) {
        one_plus_sum += h_add_h_function(q, state_props);
      }
      min_so_far = min(min_so_far, one_plus_sum);
    }
    h_add_h_function_memo[p] = min_so_far;
    h_add_h_function_open.erase(p);
    return min_so_far;
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
#if MS_ONLY_MAX_SOLVER_STEP
    assert(MS_steps_used == max_macro_steps);
#endif

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
      if (PDR::storing_actions && record && subproblem == PDR::num_subproblems-1) assert(PDR::subset(succ_state_sequence[0], state)); // broken on subproblems?
      vector<int> prev_state = state;
      for (int timestep = 0; timestep < PDR::MS_steps_used; timestep++) {
        if(LOUD) cout << "single found a successor state, used actions: " << state_string(actions_executed_sequence[timestep]) << endl;

        if (PDR::storing_actions && record && subproblem == PDR::num_subproblems-1) {
          if (timestep == 0) state_actions.add_state(succ_state_sequence[timestep+1], state, actions_executed_sequence[timestep], subproblem, layer+1);
          else               state_actions.add_state(succ_state_sequence[timestep+1], succ_state_sequence[timestep], actions_executed_sequence[timestep], subproblem, layer+1);
        }
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
#if MS_ONLY_MAX_SOLVER_STEP
    assert(MS_steps_used == max_macro_steps);
#endif
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
    int sat_count = 0;
    // TODO does not use state, could be confusing
#if MS_ONLY_MAX_SOLVER_STEP
    assert(MS_steps_used == max_macro_steps);
#endif

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
        sat_count++;
        if (!single_has_successor(possible_reason, layer, subproblem)) {
          running_reason = single_layers.layer_to_steps_solvers[layer-1][PDR::MS_steps_used]->used_assumptions();
          if (S) cout << "In reduce, mid-way candidate [ " << running_reason.size() << " / " << subproblem_to_propositions[subproblem].size() << " ] " << state_string(running_reason) << endl;
        }
      }
    }
    reason_num_sat_calls.push_back(sat_count);
#if USE_ER
    running_reason = single_get_er_reason(running_reason, layer, subproblem);
#endif
    return running_reason;
  }

  vector<int> remove_if_in_vector(const vector<int>& in, const int x) {
    // SLOW!!
    vector<int> new_vector;
    for (auto it=in.begin(); it!=in.end(); it++) {
      if (*it != x) new_vector.push_back(*it);
    }
    return new_vector;
  }

  vector<int> single_get_er_reason(const vector<int>& existing_reason, int layer, int subproblem) {
    vector<int> running_reason = existing_reason;

    for (auto ita=er_to_corresponding.begin(); ita!=er_to_corresponding.end(); ita++) {
      const int er = ita->first; 
      const vector<int>& corresponding = ita->second;

      vector<int> possible_reason = running_reason;

      if (!in_abs_sorted_vector(er, running_reason)) {
        // er is NOT in the reason, so lets see if any of the corresponding are either
        bool a_corresponding_is_in = false;
        for (auto itb=corresponding.begin(); itb!=corresponding.end(); itb++) {
          const int var = *itb;

          if (in_abs_sorted_vector(var, possible_reason)) {
            possible_reason = remove_if_in_vector(possible_reason, var);
            a_corresponding_is_in = true;
          }
        }

        if (a_corresponding_is_in) {
          // Test if this possible reason is a real reason
          possible_reason.push_back(er);
          sort(possible_reason.begin(), possible_reason.end(), abs_comp);
          if (!single_has_successor(possible_reason, layer, subproblem)) {
            running_reason = single_layers.layer_to_steps_solvers[layer-1][PDR::MS_steps_used]->used_assumptions();
          }
        }
      } else if (!in_abs_sorted_vector(-er, running_reason)) {
        // Same as before but for negative
        // -er is NOT in the reason, so lets see if any of the corresponding are either
        bool a_corresponding_is_in = false;
        for (auto itb=corresponding.begin(); itb!=corresponding.end(); itb++) {
          const int var = *itb;
          if (in_abs_sorted_vector(-var, possible_reason)) {
            possible_reason = remove_if_in_vector(possible_reason, -var);
            a_corresponding_is_in = true;
          }
        }

        if (a_corresponding_is_in) {
          // Test if this possible reason is a real reason
          possible_reason.push_back(-er);
          sort(possible_reason.begin(), possible_reason.end(), abs_comp);
          if (!single_has_successor(possible_reason, layer, subproblem)) {
            running_reason = single_layers.layer_to_steps_solvers[layer-1][PDR::MS_steps_used]->used_assumptions();
          }
        }
      }
    }

    if (running_reason != existing_reason) {
      cout << "FROM : " << state_string(existing_reason) << endl;
      cout << "TO   : " << state_string(running_reason) << endl;
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
    //load_CNF_DAG(cnf, dag);
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

  int MS_steps_used = -1;
  string state_string(vector<int> state);
  vector<vector<int>> BUFFER_layer_to_subproblem_to_state_count; // for use in buffer only (would be a member of buffer, but scope and position of classes)

  Timing timing;
  Timer parallel_timer;
  clock_t total_parallel_time_spent = 0;
  clock_t time_starting_main = 0;
  int last_stats_print_obligations_so_far = 0;

  vector<int> initial_state;
  vector<int> goal_condition;
  vector<int> positive_goal_condition;
  vector<int> propositions;
  set<int> propositions_set;
  vector<int> actions;
  set<int> actions_set;
  int total_per_timestep;
  int num_aux;
  vector<string> symbols;
  string tmp_dir;

  int num_workers = INT_MIN;
  vector<Lingeling*> baseLingelings;

  // Some things used in calculating the h^add heuristic
  unordered_map<int, vector<int>> positive_effect_strips_to_actions;
  unordered_map<int, vector<vector<int>>> positive_effect_adl_to_actions_conditions;
  unordered_map<int, vector<int>> action_to_positive_preconditions;
  map<vector<int>, int> h_add_memo;
  unordered_map<int, int> h_add_h_function_memo; // MUST BE CLEARED BETWEEN EACH H_ADD CALL
  unordered_set<int> h_add_h_function_open;

  // clause assuming a one step problem - the conversion to multiple steps is done on the worker nodes
  vector<vector<vector<vector<int>>>> worker_upper_layer_dagster_clauses_to_add;

  vector<int> reason_num_sat_calls;
  // at runtime, use dagster? if false use lingeling instead, ONLY ONE AT A TIME
  bool runtime_dagster = true;
  bool storing_actions = true;

  vector<int> dagster_sat_counts;
  vector<int> dagster_unsat_counts;
  clock_t dagster_total_time = 0;

  // setting file settings
  bool project_last = true;
  bool complete_nonfinal = true;
  bool obligation_rescheduling = true;
  bool use_OOC = true; // use only_one_clique information
  bool isolate_subproblems = true;
  bool extra_settings_read = false;
  int max_macro_steps = -1;

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
  map<int, vector<int>> corresponding_to_er;
  map<int, vector<int>> er_to_corresponding;

  map<int, vector<vector<int>>> subproblem_to_only_one_strips_cliques;
}
