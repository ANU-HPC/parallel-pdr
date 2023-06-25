#ifndef DEFAULT_QUEUE_H
#define DEFAULT_QUEUE_H

#include <vector>

#include "Obligation.h"
#include "Reason.h"
#include "Single_Layer_Of_Queue.h"

using namespace std;

class Default_Queue {
  public:
    void push(const Obligation& obligation);
    Obligation pop(int heuristic);
    bool empty();
    int size();
    void trim(const Reason& reason, int obligation_rescheduling_upper_layer);
  private:
    vector<Single_Layer_Of_Queue> _layers;
    void make_layer_exist(int layer);
    int _size = 0;
    int _lowest_layer_with_content = INT_MAX;
};

#endif
