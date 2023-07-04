#ifndef LAYERS_H
#define LAYERS_H

using namespace std;

#include "Worker_Interface.h"
#include "Reason.h"
#include "Log.h"

class Layers {
  public:
    bool add_reason(const Reason& reason); // trimming the queue, adding to workers is done outside this function
    unordered_set<Reason, Reason_Hash>* reasons_not_in_next_layer(int layer);
    bool same_as_previous(int layer);
    void print_sizes();
  private:
    void make_layer_exist(int layer);

    // make this simpler than last time.

    // have a collection of all the reasons, store it in a set and have it "searchable" by a contextless reason, just to check it it is in there, then if it is, get it it out and see its reason
    unordered_set<Reason, Reason_Hash_Contextless, Reason_Equal_Contextless> _all_reasons_contextless_set;

    // also have a collection of reasons for each layer
    vector<unordered_set<Reason, Reason_Hash>> _layer_to_reasons_last_appearing_here;
};

#endif
