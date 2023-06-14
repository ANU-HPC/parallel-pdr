#ifndef COMPRESSED_ACTIONS_H
#define COMPRESSED_ACTIONS_H

#include <vector>

#include "Utils.h"
#include "Global.h"
#include "Compressed_State_Or_Actions.h"
#include "MPI_Interface.h"

using namespace std;

class Compressed_Actions : public Compressed_State_Or_Actions {
  public:
    vector<int> get_actions();
    int MPI_message_tag();
};

#endif
