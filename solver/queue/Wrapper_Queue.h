#ifndef WRAPPER_QUEUE_H
#define WRAPPER_QUEUE_H

#include "Global.h"
#include "Obligation.h"
#include "Success.h"
#include "Default_Queue.h"
#include "Open_States_Tracking_Queue.h"
#include "Reason_From_Worker.h"

class Wrapper_Queue {
  public:
    void register_goal_reaching_state(const Compressed_State& state);
    void push_initial(const Obligation& obligation, int k);
    void register_success(const Success& success);
    Obligation pop(int heuristic);
    bool available_work();
    bool fully_empty();
    int size();
    void register_reason(const Reason_From_Worker& reason, int obligation_rescheduling_upper_layer);
    int lowest_layer_with_content();
  private:
    Default_Queue _deterministic;
    Open_States_Tracking_Queue _nondeterministic;
};

#endif
