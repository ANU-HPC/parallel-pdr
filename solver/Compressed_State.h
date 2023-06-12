#include <vector>

#include "Utils.h"
#include "Global.h"

using namespace std;

class Compressed_State {
  public:
    Compressed_State();
    Compressed_State(const vector<int>& state, const int subproblem);
    vector<int> get_state();
    // something about matches reason?
  private:
    vector<int> _compressed_state = vector<int>();
    int _subproblem; // for compression
};
