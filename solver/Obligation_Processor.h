#ifndef MPI_OBLIGATION_PROCESSOR_H
#define MPI_OBLIGATION_PROCESSOR_H

#include <vector>
#include <tuple>
#include <cassert>

#include "Global.h"
#include "Obligation.h"
#include "Success.h"
#include "Reason_From_Orchestrator.h"
#include "Reason_From_Worker.h"
#include "Lingeling.h"
#include "Compressed_Actions.h"
#include "Compressed_State.h"
#include "State_ID_Manager.h"

using namespace std;

class Obligation_Processor {
  public:
    Obligation_Processor(int layer_steps);

    void process_obligation(const Obligation& obl, const bool open_children);
    void add_reason_deterministic(const Reason_From_Orchestrator& reason);
    void add_reason_nondeterministic(const Reason_From_Orchestrator& reason);

    bool last_interaction_was_a_success();
    Success last_interactions_success();
    Reason_From_Worker last_interactions_reason();

    void reset_nondeterministic_solvers_for_new_k(int k, bool keep_non_goal_layers);
  private:
    // calculate results from the solver
    // void set_success_open_children_unsat(const Obligation& original_obligation);
    int set_success_from_solver_nondeterministic(const Obligation& original_obligation, int end_reasons_layer);
    void set_success_from_solver_deterministic(const Obligation& original_obligation, int end_reasons_layer);
    void set_reason_from_solver(const Obligation& original_obligation, int end_reasons_layer);

    // add reasons to solver
    void add_reason_interleaved_layers(const Reason_From_Orchestrator& reason);
    void add_reason_no_interleaved_layers(const Reason_From_Orchestrator& reason);

    // internally keeping track
    int get_solver_to_send_to(const Obligation& obl, int steps);
    void ensure_solver_exists_for_end_reason_layer(int end_reasons_layer);
    bool _last_interaction_was_a_success;
    Success _success;
    Reason_From_Worker _reason;

    // the second index is the layer of the reasons, what to do with that is a bit of a different story
    vector<Lingeling*> _end_reasons_layer_to_solver;
    Lingeling* _base_solver;

    // nondeterminism - to see what layers outcomes should be at
    int get_lowest_satisfying_layer(const Compressed_State& state, int upper_known_satisfying_layer);

    vector<Lingeling*> _layer_to_consistency_solver;

    int _total_sub_steps;
    int _sub_steps_per_internal_layer_step;
    int _layer_steps;
    int _largest_constrained_layer = 0;

    int _iteration = 0;

    // nondeterministic chosen
    vector<vector<vector<int>>> end_layer_to_chosen_outcome_added_clauses;
    int _k = 0;
};

#endif
