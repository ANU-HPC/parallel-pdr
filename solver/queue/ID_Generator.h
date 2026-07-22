#include <vector>

using namespace std;

class ID_Generator {
  public:
    ID_Generator();
    int pop();
    void push(int id);
  private:
    vector<int> pool = vector<int>();
    int largest_never_assigned;
};
