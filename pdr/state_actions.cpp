#include "state_actions.h"

namespace property_directed_reachability {
  State_Actions state_actions;

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
    vector<int> compressed_prev_state;
    if (prev_state.size() == PDR::propositions.size()) compressed_prev_state = PDR::compress_state(prev_state, state_subproblem, COMPRESS_FULL_STATE);
    else                                               compressed_prev_state = PDR::compress_state(prev_state, state_subproblem, COMPRESS_PARTIAL_STATE);
    assert(succ_state.size() == PDR::propositions.size()); // As only the initial state is partial (for now)

    const vector<int>& compressed_succ_state = PDR::compress_state(succ_state, state_subproblem, COMPRESS_FULL_STATE);
    const vector<int>& compressed_actions    = PDR::compress_state(actions, state_subproblem, COMPRESS_ACTION);

    //assert(succ_state.size() == prev_state.size());
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
    vector<int> compressed_prev_state = compress_state(final_state, subproblem, COMPRESS_FULL_STATE);
    vector<int> compressed_actions_executed;
    vector<vector<int>> backwards_plan;
    assert(num_subproblems == 1); // assume the plan we care about is the last/special one
    vector<int> compressed_initial_state;
    if (initial_state.size() == PDR::propositions.size()) compressed_initial_state = compress_state(initial_state, 0, COMPRESS_FULL_STATE);
    else                                                  compressed_initial_state = compress_state(initial_state, 0, COMPRESS_PARTIAL_STATE);
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
    } while (compressed_prev_state != compressed_initial_state); // if the previous state is not the initial state go again

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
}
