#ifndef STATE_ID_MANGER_H
#define STATE_ID_MANGER_H

using namespace std;

#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <iostream>
#include <utility>
#include <set>

#include "Compressed_State.h"
//#include "Compressed_State.h"

// one tree is full of states and actions, mapping the execution of PDR

// state -> actions applied in the tree
// (state, action) -> 
class State_ID_Manager {
  public:
    // converting to/from id
    static Compressed_State state_id_to_state(int state_id);
    static int state_to_state_id(const Compressed_State& state);

    static void set_initial_state(const Compressed_State& state);
    static int initial_state_id();

    // TODO for now don't do this trimming
    /*
    // registering global changes
    set<int> register_goal_state(const Compressed_State& state); // returns state id's to remove from the obligation queue
    void register_state_action_to_outcome_states(const Compressed_State& original_state, const int action, const vector<Compressed_State>& successor_states);

    // registering PDR iteration specific changes
    set<int> register_state_id_iteration_unprogressable(int state_id); // dropping a state when even after OR, it is unprogressable, so a failed obligation at k, or removed from the queue completely. return other states to kick
    void register_new_iteration();
    */


    /*
    // constrain the search when looking for another applicable action
    set<int> state_id_to_open_actions(int state_id);
    */


    //void write_solution(); // or something



  private:
    static int _initial_state_id;

    // converting to/from id
    static unordered_map<int, Compressed_State> _state_id_to_state_map;
    static unordered_map<Compressed_State, int, Compressed_State_Hash> _state_to_state_id_map;

    /*
    // down the tree
    unordered_map<int, unordered_set<int>> state_id_to_actions;
    unordered_map<pair<int,int>, unordered_set<int>, Int_Pair_Hash> state_id_action_pair_to_outcomes;

    // up the tree
    unordered_map<int, unordered_set<pair<int, int>, Int_Pair_Hash>> state_id_to_producing_state_id_action_pairs;

    // global tree properties
    unordered_map<int, int> goal_reaching_state_id_to_reaching_action;
    */

    // PDR iteration tree properties
    //unordered_map<int, set<int> state_id_to_iteration_open_actions_map; // here OPEN means we know they are applicable, we don't know if they are dead ends or not, so don't bother applying them again
    // do we need this? unordered_set<int> state_ids_which_cannot_reach_the_goal;
};

#endif
