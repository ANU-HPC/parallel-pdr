#ifndef PLAN_BUILDER_H
#define PLAN_BUILDER_H

#include <unordered_map>
#include <vector>
#include <fstream>

#include "Compressed_Actions.h"
#include "Compressed_State.h"
#include "Success.h"
#include "Obligation.h"
#include "Global.h"

using namespace std;

class Plan_Builder {
  public:
    void register_success(const Success& success);
    void write_plan(const Success& success);
  private:
    unordered_map<Compressed_State, tuple<Compressed_Actions, Compressed_State>, Compressed_State_Hash> _tree; // from successor state to previous state and the actions in between
};

#endif
