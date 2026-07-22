#include "Plan_Builder.h"
#include "Global.h"

void Plan_Builder::register_success(const Success& success) {
  const Compressed_State& original_state = success.original_obligation().compressed_state();
  const vector<Compressed_Actions>& actions = success.actions();
  const vector<Obligation>& successor_obligations = success.successor_obligations();

  for (int successor_id=0; successor_id<actions.size(); successor_id++) {
    const Compressed_State& prev_state = successor_id==0 ? original_state : successor_obligations[successor_id-1].compressed_state();
    const Compressed_State& next_state = successor_obligations[successor_id].compressed_state();
    const Compressed_Actions& step_actions = actions[successor_id];

    if (prev_state == next_state) {
      LOG << "WARNING: trying to register a loop in a plan, stopped" << endl;
      LOG << "success object: " << success.to_string() << endl;
    } else {
      // only add this way to get to a successor state if there is not already an older (so probably better) way TODO think more about the logic here, can this go wrong?
      if (_tree.find(next_state) == _tree.end()) _tree[next_state] = tuple<Compressed_Actions, Compressed_State>(step_actions, prev_state);
    }
  }
}

void Plan_Builder::write_plan(const Success& success) {
  vector<Compressed_Actions> reverse_cronology_actions;
  
  // traverse through the tree to reach the root
  Compressed_State successor_state = success.successor_obligations().rbegin()->compressed_state();
  while (_tree.find(successor_state) != _tree.end()) {
    const tuple<Compressed_Actions, Compressed_State>& actions_previous_state = _tree[successor_state];
    reverse_cronology_actions.push_back(get<0>(actions_previous_state));
    successor_state = get<1>(actions_previous_state);
    if (reverse_cronology_actions.size() == 100000) {
      LOG << "WARNING: 100,000 action steps and counting in plan, may be a fault" << endl;
    }
  }

  // now have the sequence of actions executed, write them out
  ofstream plan_file;
  if (Global::problem.isolate_subproblems) plan_file.open(Global::problem.tmp_dir + "/partial_plan" + to_string(99999)); // TODO
  else                                     plan_file.open(Global::problem.tmp_dir + "/plan");

  int plan_step = 0;
  for (auto ita=reverse_cronology_actions.rbegin(); ita!=reverse_cronology_actions.rend(); ita++) {
    const Compressed_Actions actions = *ita; 
    const vector<int>& action_variables = actions.get_actions();
    for (auto itb=action_variables.begin(); itb!=action_variables.end(); itb++) {
      const int action = *itb;
      string symbol = Global::problem.symbols[action];
      for (int j=0; j<= symbol.size(); j++) {
        if (symbol[j] == '(' || symbol[j] == ',') symbol[j] = ' ';
      }
      plan_file << plan_step << " : (" << symbol << "\n";
      plan_step++;
    }
  }
  plan_file.close();
}
