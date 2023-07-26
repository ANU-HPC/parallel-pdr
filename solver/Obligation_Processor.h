#ifndef MPI_OBLIGATION_PROCESSOR_H
#define MPI_OBLIGATION_PROCESSOR_H

#include <vector>
#include <tuple>
#include <cassert>

#include "Global.h"
#include "Obligation.h"
#include "Reason.h"
#include "Success.h"
#include "Reason.h"
#include "Lingeling.h"
#include "Compressed_Actions.h"
#include "Compressed_State.h"

using namespace std;

class Obligation_Processor {
  public:
    // TODO constructor with setup
    Obligation_Processor(int steps);
    void process_obligation(const Obligation& obl);
    void add_reason(const Reason& reason);
    bool last_interaction_was_a_success();
    Success last_interactions_success();
    Reason last_interactions_reason();
  private:
    void set_success_from_solver(const Obligation& original_obligation, int end_reasons_layer, int steps);
    void set_reason_from_solver(const Obligation& original_obligation, int end_reasons_layer, int steps);

    void add_reason_interleaved_layers(const Reason& reason);
    void add_reason_no_interleaved_layers(const Reason& reason);

    int get_solver_to_send_to(const Obligation& obl, int steps);
    int get_solver_to_send_to(const Reason& reason, int steps);
    void ensure_solver_exists_for_end_reason_layer(int end_reasons_layer);
    bool _last_interaction_was_a_success;
    Success _success;
    Reason _reason;

    // the second index is the layer of the reasons, what to do with that is a bit of a different story
    vector<vector<Lingeling*>> _end_reasons_layer_to_steps_to_solver;
    vector<Lingeling*> _steps_to_base_solver;
    int _max_steps;
};

#endif
