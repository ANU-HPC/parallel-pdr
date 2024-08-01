#ifndef STATE_ACTION_TO_STATEACTION_H
#define STATE_ACTION_TO_STATEACTION_H

#include <vector>
#include <map>
#include <cassert>
#include "Log.h"

using namespace std;

class State_Action_To_Stateaction {
  public:
    static int get_stateaction(int state, int action);
    static int get_state(int stateaction);
    static int get_action(int stateaction);
  private:
    static int set_new(int state, int action);
    static vector<int> stateaction_to_state;
    static vector<int> stateaction_to_action;
    static vector<map<int, int>> state_action_to_stateaction;
    static int max_stateaction;
};

#endif
