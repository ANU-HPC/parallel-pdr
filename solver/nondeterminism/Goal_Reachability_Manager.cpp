#include "Goal_Reachability_Manager.h"

// TODO if no state has reached the goal, don't even bother working out what can reach the goal as we know it is nothing

unordered_set<int> Goal_Reachability_Manager::register_pure_goal_return_new_goal_states(const Compressed_State& state) {
  //LOG << "here" << endl;
  _goal_state_to_actions[state.id()] = unordered_set<int>(); // empty as already a goal state
  return find_newly_goal_reaching_states();
}

unordered_set<int> Goal_Reachability_Manager::register_success_return_new_goal_states(const Success& success) {
  bool change = _graph.add(success);
  if (change) _no_change_since_last_check = false;
  return find_newly_goal_reaching_states();
}

unordered_set<int> Goal_Reachability_Manager::scc_iteration_non_goal_reaching_states(State_Action_Graph* iterative_graph) {
  // get the SCCs
  SCC_Generator scc_generator(iterative_graph);
  vector<unordered_set<int>*> sccs = scc_generator.run();

  /*
  LOG << "The SCCs we are dealing with:" << endl;
  for (int i=0; i<sccs.size(); i++) {
    LOG << i << " " << Utils::to_string(*sccs[i]) << endl;
  }
  */

  // we have the SCCs, now to work out which are goal SCCs directly, and which do and don't lead to a goal

  // TODO stop right here if there are no goals in the sccs

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

  // work out the graph between these sccs
  unordered_map<int, int> state_to_scc_num;
  for (int scc_num=0; scc_num<sccs.size(); scc_num++) {
    unordered_set<int>* scc = sccs[scc_num];
    for (int state:*scc){
      state_to_scc_num[state] = scc_num;
    }
  }

  // work out the edges of the SCC graph
  unordered_map<int, unordered_set<int>> scc_to_sccs_that_go_to_it;
  for (const auto& x:iterative_graph->_state_to_producing_state_action_pairs) {
    const int state = x.first;
    const unordered_set<pair<int, int>, Int_Pair_Hash>& producing_state_action_pairs = x.second;

    const int child_scc = state_to_scc_num[state];

    for (const auto& state_action:producing_state_action_pairs) {
      const int parent_state = state_action.first;
      const int parent_scc = state_to_scc_num[parent_state];
      if (parent_scc != child_scc) {
        scc_to_sccs_that_go_to_it[child_scc].insert(parent_scc);
      }
    }
  }

  for (int i=0; i<sccs.size(); i++) {
    //LOG << "SCC " << i << " states: " << Utils::to_string(*(sccs[i])) << "Reached by: " << Utils::to_string(scc_to_sccs_that_go_to_it[i]) << endl;
  }

  // do a search through the SCC graph labelling everything that can reach the goal as a goal state
  set<int> frontier = set<int>(goal_sccs.begin(), goal_sccs.end());
  //LOG << "start frontier " << Utils::to_string(frontier) << endl;
  //set<int> seen; // TODO don't double up (just for efficiency)
  while(frontier.size()) {
    const int goal_scc = *frontier.rbegin();
    frontier.erase(goal_scc);

    //LOG << "from scc: " << goal_scc << " back to: " << Utils::to_string(scc_to_sccs_that_go_to_it[goal_scc]) << endl;

    //LOG << "SCC " << goal_scc << " is reached by " << Utils::to_string(scc_to_sccs_that_go_to_it[goal_scc]) << endl;

    frontier.insert(scc_to_sccs_that_go_to_it[goal_scc].begin(), scc_to_sccs_that_go_to_it[goal_scc].end());
    goal_sccs.insert(scc_to_sccs_that_go_to_it[goal_scc].begin(), scc_to_sccs_that_go_to_it[goal_scc].end());
  }

  //LOG << "end of the backwards SCC search, the resulting goal SCCS: " << Utils::to_string(goal_sccs) << endl;

  // we want to work out which states and actions lead to a non-goal-reaching sink ("bad" sink)
  // first work out the states which cannot reach the goal no matter what:

  // work out which sccs are NOT goal reaching, then find all the states in all of them
  unordered_set<int> non_goal_reaching_states;
  for (int scc_num=0; scc_num<sccs.size(); scc_num++) {
    if (!Utils::in(goal_sccs, scc_num)) {
      non_goal_reaching_states.insert(sccs[scc_num]->begin(), sccs[scc_num]->end());
    }
  }

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

  return non_goal_reaching_states;
}

bool Goal_Reachability_Manager::goal_reaching_state(const int state) {
  return _goal_state_to_actions.find(state) != _goal_state_to_actions.end();
}

unordered_set<int> Goal_Reachability_Manager::find_newly_goal_reaching_states() {
  LOG << "START" << endl;
  State_Action_Graph iterative_graph = State_Action_Graph(_graph);
  
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
      unordered_set<int> x = state_actions.second;
      _goal_state_to_actions[state] = state_actions.second;
      newly_goal_reaching_states.insert(state);
    }
  }

  //LOG << "found newly reaching goal states: " << Utils::to_string(newly_goal_reaching_states) << endl;

  LOG << "END" << endl;
  return newly_goal_reaching_states;
}

void Goal_Reachability_Manager::print() {
  _graph.print(_goal_state_to_actions);
}

bool Goal_Reachability_Manager::no_change_since_last_check() {
  bool ret_val = _no_change_since_last_check;
  _no_change_since_last_check = true;
  return ret_val;
}
