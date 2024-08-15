#include "Goal_Reachability_Manager.h"

// TODO if no state has reached the goal, don't even bother working out what can reach the goal as we know it is nothing

unordered_set<int> Goal_Reachability_Manager::register_pure_goal_return_new_goal_states(const Compressed_State& state) {
  //LOG << "here" << endl;
  _goal_state_to_actions[state.id()] = unordered_set<int>(); // empty as already a goal state
  if (_goal_state_to_actions.size() == 0) return unordered_set<int>();
  return find_newly_goal_reaching_states(NULL, state.id());
}

unordered_set<int> Goal_Reachability_Manager::register_success_return_new_goal_states(const Success& success) {
  bool change = _graph.add(success);
  if (change) _no_change_since_last_check = false;
  return find_newly_goal_reaching_states(&success, -1);
}

bool Goal_Reachability_Manager::revalidate_plan_from_scratch() {
  LOG << "START" << endl;
  _goal_state_to_actions = unordered_map<int, unordered_set<int>>();

  for (auto state_actions : _graph._state_to_actions) {
    const int state = state_actions.first;
    if (Compressed_State::state_id_to_state(state).is_goal()) {
      _goal_state_to_actions[state] = unordered_set<int>();
    }
  }

  unordered_set<int> goal_reaching_states = scc_find_newly_goal_reaching_states(vector<Success>(), vector<int>(), true);
  LOG << "END" << endl;

  return goal_reaching_states.find(Compressed_State::initial_state_id()) != goal_reaching_states.end();
}

unordered_set<int> Goal_Reachability_Manager::scc_iteration_non_goal_reaching_states(State_Action_Graph* iterative_graph) {
  Stopwatch::store["scc_iteration_non_goal_reaching_states"].start();

  // get the SCCs
  Stopwatch::store["scc generator"].start();
  SCC_Generator scc_generator(iterative_graph);
  vector<unordered_set<int>*> sccs = scc_generator.run();
  Stopwatch::store["scc generator"].stop();

  /* LOG << "The SCCs we are dealing with:" << endl;
  for (int i=0; i<sccs.size(); i++) {
    LOG << i << " " << Utils::to_string(*sccs[i]) << endl;
  } */

  // we have the SCCs, now to work out which are goal SCCs directly, and which do and don't lead to a goal

  // TODO stop right here if there are no goals in the sccs

  Stopwatch::store["work out which ones are goal sccs"].start();
  // first work out which are goals directly
  unordered_set<int> goal_sccs;
  for (int scc_num=0; scc_num<sccs.size(); scc_num++) {
    unordered_set<int>* scc = sccs[scc_num];
    for (int state:*scc){
      //LOG << "asking is it a goal state? " << state << endl;
      if (_goal_state_to_actions.find(state) != _goal_state_to_actions.end()) {
        // a goal SCC
        goal_sccs.insert(scc_num);
        //LOG << "it is!" << endl;
        break;
      }
    }
  }
  Stopwatch::store["work out which ones are goal sccs"].stop();

  //LOG << "num goal reaching sccs: " << goal_sccs.size() << endl;

  Stopwatch::store["state to scc num"].start();
  int num_states = 0;
  // work out the graph between these sccs
  unordered_map<int, int> state_to_scc_num;
  for (int scc_num=0; scc_num<sccs.size(); scc_num++) {
    unordered_set<int>* scc = sccs[scc_num];
    for (int state:*scc){
      state_to_scc_num[state] = scc_num;
      num_states++;
    }
  }
  Stopwatch::store["state to scc num"].stop();

  //LOG << "states: " << num_states << " for num sccs: " << sccs.size() << endl;

  Stopwatch::store["work out graph between sccs"].start();
  // work out the edges of the SCC graph
  vector<set<int>> scc_to_sccs_that_go_to_it (sccs.size());
  for (const auto& x:iterative_graph->_state_to_producing_stateactions) {
    const int state = x.first;
    const set<int>& producing_stateactions = x.second;

    const int child_scc = state_to_scc_num[state];

    for (const auto& stateaction:producing_stateactions) {
      const int parent_state = State_Action_To_Stateaction::get_state(stateaction);
      const int parent_scc = state_to_scc_num[parent_state];
      if (parent_scc != child_scc) {
        scc_to_sccs_that_go_to_it[child_scc].insert(parent_scc);
      }
    }
  }
  Stopwatch::store["work out graph between sccs"].stop();

  Stopwatch::store["search for what is goal reaching"].start();
  // do a search through the SCC graph labelling everything that can reach the goal as a goal state
  set<int> frontier = set<int>(goal_sccs.begin(), goal_sccs.end());
  set<int> seen; // TODO don't double up (just for efficiency)
  while(frontier.size()) {
    const int goal_scc = *frontier.begin();
    frontier.erase(goal_scc);

    // TODO necessary?
    for (int scc : scc_to_sccs_that_go_to_it[goal_scc]) {
      if (seen.find(scc) == seen.end()) {
        frontier.insert(scc);
      }
    }

    goal_sccs.insert(scc_to_sccs_that_go_to_it[goal_scc].begin(), scc_to_sccs_that_go_to_it[goal_scc].end());
  }

  Stopwatch::store["search for what is goal reaching"].stop();

  //LOG << "end of the backwards SCC search, the resulting goal SCCS: " << Utils::to_string(goal_sccs) << endl;

  // we want to work out which states and actions lead to a non-goal-reaching sink ("bad" sink)
  // first work out the states which cannot reach the goal no matter what:

  // work out which sccs are NOT goal reaching, then find all the states in all of them


  Stopwatch::store["remove non goal reaching to be trimmed"].start();
  unordered_set<int> non_goal_reaching_states;
  for (int scc_num=0; scc_num<sccs.size(); scc_num++) {
    if (!Utils::in(goal_sccs, scc_num)) {
      non_goal_reaching_states.insert(sccs[scc_num]->begin(), sccs[scc_num]->end());
    }
  }
  Stopwatch::store["remove non goal reaching to be trimmed"].stop();

  // then find all the state-action pairs which lead to these bad sinks, and remove all of them.
  // (Note here, it could be that a good state has a sole action, one good outcome and one bad.
  // this then means the original state itself is bad (it does not have an action which is guaranteed to not go to a bad sink)
  // a variant of this algorithm could find these bad states recursively? maybe that is worth adding TODO
  // but for now, we just remove the actions which could go to a bad state, and let the next iteration actually remove that state
  // for now, lets let the outer loop handle that

  // clean up
  for (int scc_num=0; scc_num<sccs.size(); scc_num++) {
    delete sccs[scc_num];
  }

  Stopwatch::store["scc_iteration_non_goal_reaching_states"].stop();
  return non_goal_reaching_states;
}

bool Goal_Reachability_Manager::goal_reaching_state(const int state) {
  return _goal_state_to_actions.find(state) != _goal_state_to_actions.end();
}


unordered_set<int> Goal_Reachability_Manager::find_newly_goal_reaching_states(const Success* optional_success, int optional_goal_state) {
  bool scc_check = (_cheap_non_scc_checks_since_scc_check == CHEAP_NON_SCC_CHECK_RATE);

  if (scc_check) _cheap_non_scc_checks_since_scc_check = 0;
  _cheap_non_scc_checks_since_scc_check++;

  //LOG << "scc check: " << scc_check << endl;

  vector<Success> successes;
  vector<int> goal_states;
  if (optional_success != NULL) successes.push_back(*optional_success);
  if (optional_goal_state != -1) goal_states.push_back(optional_goal_state);

  if (scc_check) return scc_find_newly_goal_reaching_states(successes, goal_states, false);
  else           return cheap_find_newly_goal_reaching_states(optional_success, optional_goal_state);
}

void Goal_Reachability_Manager::cheap_find_newly_goal_reaching_states_helper(int newly_goal_reaching_state, unordered_set<int>* ret_val) {
  if (_memo.find(newly_goal_reaching_state) != _memo.end()) {
    return;
  }
  _memo.insert(newly_goal_reaching_state);

  // this state is now goal reaching, see if it triggers any others to be
  const set<int>& producing_stateactions = _graph._state_to_producing_stateactions[newly_goal_reaching_state];
  for (const int stateaction : producing_stateactions) {
    // see if this state can reach the goal, if it can already we are done here

    const int state = State_Action_To_Stateaction::get_state(stateaction);

    if (_goal_state_to_actions.find(state) != _goal_state_to_actions.end()) continue;

    // now lets see if all the outcomes of this goal_action are goal reaching
    bool all_outcomes_reach_goal = true; // assume true prove otherwise
    for (int outcome : _graph._stateaction_to_outcomes[stateaction]) {
      if (_goal_state_to_actions.find(outcome) == _goal_state_to_actions.end()) {
        all_outcomes_reach_goal = false;
        break;
      }
    }

    if (all_outcomes_reach_goal) {
      const int action = State_Action_To_Stateaction::get_action(stateaction);
      unordered_set<int> actions;
      actions.insert(action);

      _goal_state_to_actions[state] = actions;
      ret_val->insert(state);
      //LOG << "state " << newly_goal_reaching_state << " is goal reaching, the state " << state << " has action " << action << ", all its outcomes are goal reaching so it is too" << endl;
      cheap_find_newly_goal_reaching_states_helper(state, ret_val);
    }
  }
}

unordered_set<int> Goal_Reachability_Manager::cheap_find_newly_goal_reaching_states(const Success* optional_success, int optional_goal_state) {
  // cheaper ignores cycles
  _memo.clear();

  unordered_set<int> ret_val;
  //return ret_val;

  // first deal with the optional success
  if (optional_success != NULL) {
    const int original_state = optional_success->original_obligation().compressed_state().id();
    // first check if this is already a goal state, if so we are done here
    if (_goal_state_to_actions.find(original_state) == _goal_state_to_actions.end()) {
      // if all the outcomes are goals then this is a goal state too
      bool goal_reaching = true; // assume goal reaching, prove otherwise
      for (const Obligation& obl : optional_success->successor_obligations()) {
        const int outcome = obl.compressed_state().id();
        if (_goal_state_to_actions.find(outcome) == _goal_state_to_actions.end()) {
          goal_reaching = false;
          break; // not a goal, leave this loop
        }
      }
  
      if (goal_reaching) {
        // all the outcomes are goal reaching! this is a goal state too
        const int action = optional_success->actions()[0].get_actions()[0];
        unordered_set<int> actions;
        actions.insert(action);
        _goal_state_to_actions[original_state] = actions;

        ret_val.insert(original_state);

        cheap_find_newly_goal_reaching_states_helper(original_state, &ret_val);
        //LOG << "state " << original_state << " has a success, and all outcome from action " << action << "are goal reaching, so the original state is too" << endl;
      }
    }
  }
  
  if (optional_goal_state != -1) {
    cheap_find_newly_goal_reaching_states_helper(optional_goal_state, &ret_val);
  }

  //LOG << "returning: " << Utils::to_string(ret_val) << endl;
  return ret_val;
}

unordered_set<int> Goal_Reachability_Manager::scc_find_newly_goal_reaching_states(const vector<Success>& successes, const vector<int>& goal_states, bool run_on_whole_graph) {
  Stopwatch::store["scc_find_newly_goal_reaching_states"].start();
  //LOG << "NOT USING THE FANCY REACHABLE SCC STUFF" << endl;
  
  if ((goal_states.size() == 0) & (successes.size() == 0) & (!run_on_whole_graph)) return unordered_set<int>();

  LOG << "num successes being used: " << successes.size() << endl;
  LOG << "Layer graph num states: " << _layer_graph->approx_num_nodes() << endl;
  LOG << "Global graph num states: " << _graph.approx_num_nodes() << endl;

  State_Action_Graph iterative_graph;
  if (run_on_whole_graph) {
    iterative_graph = State_Action_Graph(_graph);
  } else {
    iterative_graph = _graph.reachable_subgraph(_goal_state_to_actions, successes, goal_states);
  }

  if (iterative_graph._state_to_actions.size() == 0) {
    Stopwatch::store["scc_find_newly_goal_reaching_states"].stop();
    return unordered_set<int>();
  }
  
  // iteratively refine this graph
  //LOG << "starting... " << endl;
  while (true) {
    //LOG << "starting iteration with graph:" << endl;
    //iterative_graph.print(_goal_state_to_actions);

    unordered_set<int> states_to_remove = scc_iteration_non_goal_reaching_states(&iterative_graph);

    //LOG << "to remove as cannot reach the goal: " << Utils::to_string(states_to_remove) << endl;

    if (states_to_remove.size()) {
      //LOG << "got back to remove states: " << Utils::to_string(states_to_remove) << endl;
      for (auto state:states_to_remove) {
        iterative_graph.remove_state(state); // implicitly also removes all its arcs
      }
    } else {
      break;
    }
  }

  // At this point the states in the graph are the goal reaching states, find the new ones
  unordered_set<int> newly_goal_reaching_states;
  for (auto state_actions:iterative_graph._state_to_actions) {
    const int state = state_actions.first;
    if (_goal_state_to_actions.find(state) == _goal_state_to_actions.end()) {
      // no action can go wrong in this graph, so list all of them
      set<int> x = state_actions.second;
      _goal_state_to_actions[state] = unordered_set<int>(state_actions.second.begin(), state_actions.second.end());
      newly_goal_reaching_states.insert(state);
    }
  }

  //LOG << "found newly reaching goal states: " << Utils::to_string(newly_goal_reaching_states) << endl;

  Stopwatch::store["scc_find_newly_goal_reaching_states"].stop();
  return newly_goal_reaching_states;
}

void Goal_Reachability_Manager::print() {
  LOG << "TURNED OFF PLAN PRINTING" << endl;
  const bool valid = revalidate_plan_from_scratch();
  LOG << "PLAN VALID: " << valid << endl;
  if (!valid) {
    for (int i=0; i<10; i++) LOG << "ERROR!!!" << endl;
  }
  //_graph.print(_goal_state_to_actions);
}

bool Goal_Reachability_Manager::no_change_since_last_check() {
  bool ret_val = _no_change_since_last_check;
  _no_change_since_last_check = true;
  return ret_val;
}

State_Action_Graph* Goal_Reachability_Manager::get_global_graph() {
  LOG << "called again" << endl;
  return &_graph;
}

void Goal_Reachability_Manager::inform_of_layer_graph(State_Action_Graph* layer_graph) {
  _layer_graph = layer_graph;
}
