#include <vector>

#include "Utils.h"
#include "Global.h"

using namespace std;

class Compressed_Actions {
  public:
    Compressed_Actions();
    Compressed_Actions(const vector<int>& Actions, const int subproblem);
    vector<int> get_actions();
  private:
    vector<int> _compressed_actions = vector<int>();
    int _subproblem; // for compression
};
