#include "State_Action_Graph.h"
#include <cassert>

State_Action_Graph::State_Action_Graph() { }

State_Action_Graph::State_Action_Graph(const State_Action_Graph& existing) {
  for (const auto& it:existing._state_to_actions) {
    const int state = it.first;
    const auto& actions = it.second;
    _state_to_actions[state] = unordered_set<int>(actions);
  }

  for (const auto& it:existing._state_action_pair_to_outcomes) {
    const pair<int, int>& state_action = it.first;
    const unordered_set<int>& outcomes = it.second;
    _state_action_pair_to_outcomes[state_action] = unordered_set<int>(outcomes);
  }

  for (const auto& it:existing._state_to_producing_state_action_pairs) {
    const int state = it.first;
    const auto& state_action_pairs = it.second;
    _state_to_producing_state_action_pairs[state] = unordered_set<pair<int, int>, Int_Pair_Hash>(state_action_pairs);
  }

    /*
    unordered_set<pair<int, int>, Int_Pair_Hash> new_state_action_pairs;
    for (const auto& itb: state_action_pairs) {
      const pair<int, int> state_action = *itb;
      new_state_action_pairs.insert(pair<int, int>(state_action.first, state_action.second));
    }
    */
  assert(consistency_check());
}

void State_Action_Graph::add(const int original_state, const int action, const vector<int>& successor_states) {
  assert(consistency_check());

  LOG << "adding, original: " << original_state << " action: " << action << " outcomes: " << Utils::to_string(successor_states) << endl;

  const pair<int, int> state_action = pair<int, int>(original_state, action);

  _state_to_producing_state_action_pairs[original_state].size(); // make it exist even if empty

  if (_state_action_pair_to_outcomes.find(state_action) != _state_action_pair_to_outcomes.end()) LOG << "adding a state_action already registered" << endl;

  _state_to_actions[original_state].insert(action);
  _state_action_pair_to_outcomes[state_action] = unordered_set<int>(successor_states.begin(), successor_states.end());
  for (int outcome:successor_states) {
    _state_to_producing_state_action_pairs[outcome].insert(state_action);
    _state_to_actions[outcome].size(); // make it exist even if empty
  }

  assert(consistency_check());
}

void State_Action_Graph::erase_state_if_lone(int state) {
  //LOG << "considering if lone: " << state << endl;

  //assert(consistency_check());
  if ((_state_to_actions[state].size() == 0) && (_state_to_producing_state_action_pairs[state].size() == 0)) {
    _state_to_actions.erase(state);
    _state_to_producing_state_action_pairs.erase(state);
  } 
  //assert(consistency_check());
}

// Removes nodes with no arcs (in OR out)
void State_Action_Graph::remove_state_action_arcs(const pair<int, int>& state_action) {
  assert(consistency_check());
  const int state = state_action.first;
  const int action = state_action.second;

  for (const int outcome:_state_action_pair_to_outcomes[state_action]) {
    _state_to_producing_state_action_pairs[outcome].erase(state_action);
    erase_state_if_lone(outcome);
  }

  _state_action_pair_to_outcomes.erase(state_action);
  _state_to_actions[state].erase(action);

  erase_state_if_lone(state);
  assert(consistency_check());
}

void State_Action_Graph::remove_state(const int state) {
  //LOG << "start: " << state << endl;
  assert(consistency_check());
  // need to remove the state from:
  // (A) _state_to_actions (both sides!)
  // (B) _state_action_pair_to_outcomes (both sides!)
  // (C) _state_to_producing_state_action_pairs (both sides!)

  // all the actions which come out of this state (after)
  for (auto after_action:_state_to_actions[state]) {
    //LOG << "after action" << endl;
    const pair<int, int> after_state_action = pair<int, int>(state, after_action);
    for (auto outcome:_state_action_pair_to_outcomes[after_state_action]) {
      _state_to_producing_state_action_pairs[outcome].erase(after_state_action); //(C after)
      erase_state_if_lone(outcome);
    }
    _state_action_pair_to_outcomes.erase(after_state_action); // (B after)
  }
  //LOG << "_state_to_actions.erase(" << state << endl;
  _state_to_actions.erase(state); // (A after)

  // all the actions that go to this state (before)
  for (auto before_state_action:_state_to_producing_state_action_pairs[state]) {
    //LOG << "considering before state action" << endl;
    // this state action led here, so remove all the outcomes arcs, and the state-action itself (in 2 places)

    for (int co_outcome:_state_action_pair_to_outcomes[before_state_action]) {
      if (co_outcome == state) continue;
      _state_to_producing_state_action_pairs[co_outcome].erase(before_state_action); // (C before)
      //LOG << "erase from " << co_outcome << " down to size " << _state_to_producing_state_action_pairs[co_outcome].size() << endl;
      erase_state_if_lone(co_outcome);
    }
    _state_action_pair_to_outcomes.erase(before_state_action); // (B before)

    const int before_state = before_state_action.first;
    const int before_action = before_state_action.second;
    _state_to_actions[before_state].erase(before_action); // (A before)

    erase_state_if_lone(before_state);
  }

  _state_to_producing_state_action_pairs.erase(state);
  //LOG << "worked! expected it to fail right before..." << endl;
  //exit(1);
  assert(consistency_check());
}


/*
  for (auto x:_state_to_producing_state_action_pairs) {
    int state = x.first;
    auto producing_state_action_pairs = x.second;
    if (producing_state_action_pairs.size() == 0) {
      // no incoming, check it has an outgoing
      if (_state_to_actions[state].size() == 0) {
        LOG << "error" << endl;
        return false;
      }
    }
  }
*/








unordered_set<int> State_Action_Graph::state_to_actions(int state) {
  return _state_to_actions[state];
}

unordered_set<int> State_Action_Graph::state_action_pair_to_outcomes(const pair<int,int>& state_action) {
  return _state_action_pair_to_outcomes[state_action];
}

unordered_set<pair<int, int>, Int_Pair_Hash> State_Action_Graph::state_to_producing_state_action_pairs(int state) {
  return _state_to_producing_state_action_pairs[state];
}

// TODO make it constrained so only "reachable" states are considered
// based on pseudocode from: https://en.wikipedia.org/wiki/Tarjan%27s_strongly_connected_components_algorithm
class SCC_Iteration_Helper {
  public:
    SCC_Iteration_Helper(State_Action_Graph* base_graph);
    vector<unordered_set<int>*> run();
  private:
    void strong_connect(vector<unordered_set<int>*>* sccs, const int state);

    int _index = 0;
    unordered_set<int> _unordered_stack;
    vector<int> _stack;

    unordered_map<int, int> _state_to_index;
    unordered_map<int, int> _state_to_lowlink;

    State_Action_Graph* _base_graph;
};

SCC_Iteration_Helper::SCC_Iteration_Helper(State_Action_Graph* base_graph) {
  _base_graph = base_graph;
}

vector<unordered_set<int>*> SCC_Iteration_Helper::run() {
  vector<unordered_set<int>*> sccs;
  for (const auto state_actions:_base_graph->_state_to_actions) {
    const int state = state_actions.first;
    //LOG << "considering state when creating SCCs" << state << endl;
    if (_state_to_index.find(state) == _state_to_index.end()) {
      //LOG << "considering new state (and corresponding SCC): " << state << endl;
      strong_connect(&sccs, state);
    }
  }
  return sccs;
}

void SCC_Iteration_Helper::strong_connect(vector<unordered_set<int>*>* sccs, const int state) {
  LOG << "called strong connect on state: " << state << endl;
  _state_to_index[state] = _index;
  _state_to_lowlink[state] = _index;
  _index++;
  _stack.push_back(state);
  _unordered_stack.insert(state);

  for (const auto action:_base_graph->state_to_actions(state)) {
    for (auto outcome:_base_graph->state_action_pair_to_outcomes(pair<int, int>(state, action))) {
      if (_state_to_index.find(state) != _state_to_index.end()) {
        strong_connect(sccs, outcome);
        _state_to_lowlink[state] = min(_state_to_lowlink[state], _state_to_lowlink[outcome]);
      } else {
        _state_to_lowlink[state] = min(_state_to_lowlink[state], _state_to_index[outcome]);
      }
    }
  }

  //LOG << "considering if is a root node: " << state << " will be if =: " << _state_to_lowlink[state] << " " << _state_to_index[state] << endl;

  // If v is a root node, pop the stack and generate an SCC
  if (_state_to_lowlink[state] == _state_to_index[state]) {
    // start a new SCC
    unordered_set<int>* scc = new unordered_set<int>();

    while (true) {
      const int other_state = *_stack.rbegin();

      _stack.pop_back();
      _unordered_stack.erase(other_state);

      scc->insert(other_state);
      if (state == other_state) break;
    }
    sccs->push_back(scc);
  }
}

unordered_set<int> State_Action_Graph::scc_iteration_non_goal_reaching_states(const unordered_map<int, unordered_set<int>>& goal_state_to_action) {
  // get the SCCs
  SCC_Iteration_Helper helper(this);
  vector<unordered_set<int>*> sccs = helper.run();

  //LOG << "The SCCs we are dealing with:" << endl;
  /*
  for (int i=0; i<sccs.size(); i++) {
    LOG << i << " " << Utils::to_string(*sccs[i]) << endl;
  }
  */

  // we have the SCCs, now to work out which are goal SCCs directly, and which do and don't lead to a goal

  // first work out which are goals directly
  unordered_set<int> goal_sccs;
  for (int scc_num=0; scc_num<sccs.size(); scc_num++) {
    unordered_set<int>* scc = sccs[scc_num];
    for (int state:*scc){
      //LOG << "asking is it a goal state? " << state << endl;
      if (goal_state_to_action.find(state) != goal_state_to_action.end()) {
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

  unordered_map<int, unordered_set<int>> scc_to_sccs_that_go_to_it;

  for (const auto& x:_state_to_producing_state_action_pairs) {
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

  // do a search through the SCC graph labelling everything that can reach the goal as a goal state
  set<int> frontier = set<int>(goal_sccs.begin(), goal_sccs.end());
  LOG << "start frontier " << Utils::to_string(frontier) << endl;
  //set<int> seen; // TODO don't double up (just for efficiency)
  while(frontier.size()) {
    const int goal_scc = *frontier.rbegin();
    frontier.erase(goal_scc);

    //LOG << "from scc: " << goal_scc << " back to: " << Utils::to_string(scc_to_sccs_that_go_to_it[goal_scc]) << endl;

    frontier.insert(scc_to_sccs_that_go_to_it[goal_scc].begin(), scc_to_sccs_that_go_to_it[goal_scc].end());
    goal_sccs.insert(scc_to_sccs_that_go_to_it[goal_scc].begin(), scc_to_sccs_that_go_to_it[goal_scc].end());
  }

  LOG << "end of the backwards SCC search, the resulting goal SCCS: " << Utils::to_string(goal_sccs) << endl;

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

unordered_set<int> State_Action_Graph::scc_refinement_find_newly_goal_reaching_states(unordered_map<int, unordered_set<int>>* goal_state_to_actions) {
  State_Action_Graph graph = State_Action_Graph(*this);
  
  // iteratively refine this graph
  while (true) {
    unordered_set<int> states_to_remove = graph.scc_iteration_non_goal_reaching_states(*goal_state_to_actions);
    if (states_to_remove.size()) {
      LOG << "got back to remove states: " << Utils::to_string(states_to_remove) << endl;
      for (auto state:states_to_remove) {
        graph.remove_state(state); // implicitly also removes all its arcs
      }
    } else {
      break;
    }
  }

  // then the states in the graph are the goal reaching states, find the new ones
  unordered_set<int> newly_goal_reaching_states;
  for (auto state_actions:graph._state_to_actions) {
    const int state = state_actions.first;
    if (goal_state_to_actions->find(state) == goal_state_to_actions->end()) {
      // no action can go wrong in this graph, so list all of them
      unordered_set<int> x = state_actions.second;
      (*goal_state_to_actions)[state] = state_actions.second;
      newly_goal_reaching_states.insert(state);
    }
  }

  for (int state:newly_goal_reaching_states) {
    LOG << "newly called state a goal: " << state << endl;
  }

  return newly_goal_reaching_states;
}

bool State_Action_Graph::consistency_check() {
  //LOG << "consistency check (expensive!)" << endl;
  //LOG << _state_to_actions.size() << " " << _state_to_producing_state_action_pairs.size() << endl;

  for (auto state_actions:_state_to_actions) {
    int state = state_actions.first;
    const unordered_set<int>& actions = state_actions.second;

    set<int> seen_actions;
    
    for (auto x:_state_action_pair_to_outcomes) {
      const pair<int, int>& state_action = x.first;
      if (state_action.first == state) {
        int action = state_action.second;

        // make sure this action is in state to actions, and sign off that the state_to_action action has been seen in the _state_action_to_outcomes keys
        bool a_in = (_state_to_actions[state].find(action) != _state_to_actions[state].end());
        if (!a_in) {
          LOG << "error: action in state_action_to_outcomes not in state_to_actions" << endl;
          return false;
        }

        seen_actions.insert(action);
      }
    }

    if (seen_actions.size() != actions.size()) {
      LOG << "error, differing number of actions for the same state between state_action_to_outcomes and state_to_actions" << endl;
      return false;
    }
  }

  // now lets check the symmetry of _state_action_pair_to_outcomes and _state_to_producing_state_action_pairs;
  for (auto x:_state_action_pair_to_outcomes) {
    auto state_action_pair = x.first;
    auto outcomes = x.second;

    for (int outcome:outcomes) {
      if (_state_to_producing_state_action_pairs[outcome].find(state_action_pair) == _state_to_producing_state_action_pairs[outcome].end()) {
        LOG << "error, look into it A" << endl;
        return false;
      }
    }
  }

  for (auto x:_state_to_producing_state_action_pairs) {
    auto outcome = x.first;
    auto state_action_pairs = x.second;

    for (auto state_action_pair:state_action_pairs) {
      if (_state_action_pair_to_outcomes[state_action_pair].find(outcome) == _state_action_pair_to_outcomes[state_action_pair].end()) {
        LOG << "error 2" << endl;
        return false;
      }
    }
  }

  // check that every node has an in or an out
  for (auto x:_state_to_actions) {
    int state = x.first;
    auto actions = x.second;

    if (actions.size() == 0) {
      // state_to_actions is empty, first check that the other one exists
      if (_state_to_producing_state_action_pairs.find(state) == _state_to_producing_state_action_pairs.end()) {
        LOG << "error" << endl;
        return false;
      }

      // then check it is also nonempty 
      if (_state_to_producing_state_action_pairs[state].size() == 0) {
        LOG << "error" << endl;
        return false;
      }
    }
  }

  //LOG << _state_to_actions.size() << " " << _state_to_producing_state_action_pairs.size() << endl;

  for (auto x:_state_to_producing_state_action_pairs) {
    int state = x.first;
    auto producing_state_action_pairs = x.second;

    if (producing_state_action_pairs.size() == 0) {
      // producing_state_action_pairs is empty, first check that the other one exists
      if (_state_to_actions.find(state) == _state_to_actions.end()) {
        LOG << "error" << endl;
        return false;
      }

      // then check it is also nonempty 
      if (_state_to_actions[state].size() == 0) {
        LOG << "error" << endl;
        return false;
      }
    }
  }
  //LOG << "end consistency check" << endl;
  return true;
}
