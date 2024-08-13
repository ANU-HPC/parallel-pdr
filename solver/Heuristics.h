#ifndef HEURISTICS_H
#define HEURISTICS_H

#include "Obligation.h"
#include "unordered_set"
#include "unordered_map"

using namespace std;

class Heuristics {
  public:
    static int get_cost(int heuristic, const Obligation& obligation);

    // need to be in order, stating at 0, with an accurate sum
    const static int NONE = 0;
    const static int H_ADD = 1;
    const static int NOVELTY = 2;
    const static int RANDOM = 3;

    const static int NUM_HEURISTICS = 4;
  private:
    // Default
    static int get_cost_none(const Obligation& obligation);

    //H^+
    static unordered_map<int, int> _h_add_h_function_memo; // MUST BE CLEARED BETWEEN EACH H_ADD CALL
    static unordered_set<int> _h_add_h_function_open;
    static int get_cost_h_add(const Obligation& obligation);

    // Novelty
    static unordered_set<int> _novelty_single_seen;
    static unordered_map<int, unordered_set<int>> _novelty_pair_seen;
    static int get_cost_novelty(const Obligation& obligation);

    // Random
    static int get_cost_random(const Obligation& obligation);
};

#endif
