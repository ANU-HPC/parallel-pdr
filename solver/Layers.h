#ifndef LAYERS_H
#define LAYERS_H

using namespace std;

#include "Contextless_Reason.h"
#include "Worker_Interface.h"
#include "Log.h"

class Layers {
  public:
    int add_reason(const Contextless_Reason& reason); // trimming the queue, adding to workers is done outside this function
    unordered_set<Contextless_Reason, Contextless_Reason_Hash>* reasons_not_in_next_layer(int layer);
    bool same_as_previous(int layer);
    void print_sizes();
    void print();
    void clear();
  private:
    void make_layer_exist(int layer);

    // make this simpler than last time.

    // have a collection of all the reasons, store it in a set and have it "searchable" by a contextless reason, just to check it it is in there, then if it is, get it it out and see its reason
    unordered_set<Contextless_Reason, Contextless_Reason_Hash_Just_Reason, Contextless_Reason_Equal_Just_Reason> _all_reasons_compare_just_reasons;

    // also have a collection of reasons for each layer
    vector<unordered_set<Contextless_Reason, Contextless_Reason_Hash>> _layer_to_reasons_last_appearing_here;
};

#endif
