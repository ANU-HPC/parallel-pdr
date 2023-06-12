#ifndef LAYERS_H
#define LAYERS_H

#define DEBUG_WARNING_REPEATED_REASON 0

#include "Set_Trie.h"
#include "Lingeling.h"

// Layer objects
class Layers {
  public:
    // A direct implementation - one for each layer type
    virtual void solver_add_reason(const vector<int>& reason, int layer, int subproblem)=0; 
    virtual void make_layer_exist(int layer)=0;

    void print_reasons_size();
    void print_reasons();
    void check();
    void add_reason(const vector<int>& reason, int layer, int subproblem);
    set<vector<int>> get_reasons_not_in_next_layer(int layer, int subproblem);
    bool same_as_previous(int nextLayer, set<int> subproblems_to_check);
    int get_first_empty_layer();
    void push_nonfinal_up_to_layer(int desired_just_empty_layer);
    set<tuple<int, vector<int>>> seen_before; // for debugging
    vector<vector<Set_Trie>> reasons; // the REASONS that are unique in this layer
};

class Dagster_Layers : public Layers {
  public:
    void make_layer_exist(int layer);
  private:
    // upper layer to add to, this function adds to all less also
    void solver_add_reason(const vector<int>& reason, int layer, int subproblem);
};

class Single_Layers : public Layers {
  public:
    ~Single_Layers();
    void make_layer_exist(int layer);
    vector<vector<Lingeling*>> layer_to_steps_solvers;
  private:
    // upper layer to add to, this function adds to all less also
    void solver_add_reason(const vector<int>& reason, const int layer, const int subproblem);
};

#endif
