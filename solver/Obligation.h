#include "Compressed_State.h"

using namespace std;

class Obligation {
  public:
    //Obligation(const vector<int>& state, const int layer, const int subproblem);
    Obligation(const Compressed_State& compressed_state, const int layer, const int subproblem);
    int layer();
    int subproblem();
    Compressed_State compressed_state();
  private:
    Compressed_State _compressed_state;
    int _layer;
    int _subproblem;
};
