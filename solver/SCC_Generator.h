#ifndef SCC_GENERATOR
#define SCC_GENERATOR

using namespace std;

#include <unordered_set>
#include <vector>
#include <iostream>
#include <utility>
#include <set>
#include <cassert>

#include "State_Action_Graph.h"
#include "Compressed_State.h"

class SCC_Generator {
  public:
    SCC_Generator(State_Action_Graph* base_graph);
    vector<unordered_set<int>*> run();
  private:
    void strong_connect(const int state);
    State_Action_Graph* _base_graph;

    int _index = 0;
    unordered_set<int> _unordered_stack;
    vector<int> _stack;

    int* _state_to_index_value;
    int* _state_to_index_exists;
    int* _state_to_lowlink;

    vector<unordered_set<int>*> _sccs;
};

#endif
