#ifndef STATE_ACTIONS_H
#define STATE_ACTIONS_H

#include "property_directed_reachability.h"
#include <fstream>

namespace property_directed_reachability {
  // Class for tracking which actions lead to which states
  class State_Actions {
    public:
      void set_final_state(const vector<int>& state, const int in_subproblem);
      void add_state(const vector<int>& succ_state, const vector<int>& prev_state, const vector<int>& actions, const int state_subproblem, const int succ_state_layer);
      void remove_state(const vector<int>& succ_state);
      void write_empty_plan();
      void print_write_path(const vector<int>& final_state, int subproblem);
      void print_write_path_final_state();
      // Map from states -> previous_state, actions
      map<vector<int>, tuple<vector<int>, vector<int>, int > > data;
    private:
      vector<int> final_state;
      int subproblem = -1;
  };

  extern State_Actions state_actions;
}

#endif
