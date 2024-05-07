#ifndef DEFAULT_QUEUE_H
#define DEFAULT_QUEUE_H

#include <unordered_map>
#include <vector>

#include "Global.h"
#include "Obligation.h"
#include "Contextless_Reason.h"
#include "Single_Layer_Of_Queue.h"
#include "Compressed_State.h"

using namespace std;

class Default_Queue {
  public:
    Default_Queue();
    void remove_and_ban_states_as_goal_reaching(const Compressed_State state);
    void push(const Obligation& obligation);
    Obligation pop(int heuristic);
    bool empty();
    int size();
    undordered_set<int> trim(const Contextless_Reason& reason, int obligation_rescheduling_upper_layer);
    int lowest_layer_with_content();
    void print_sizes();
  private:
    void update_lowest_layer_with_content();
    vector<Single_Layer_Of_Queue> _layers; // have one for 0 even though it will always be empty, just for math simplicity
    void make_layer_exist(int layer);
    int _size = 0;
    int _lowest_layer_with_content = INT_MAX;
    unordered_set<Compressed_State, Compressed_State_Hash> _banned_states;
};

#endif
