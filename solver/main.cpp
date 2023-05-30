#include "test_class.h"
#include "Problem.h"

#include <vector>
#include <map>
#include <unordered_map>
#include <set>
#include <unordered_set>
#include <list>
#include <cassert>
#include <stdlib.h> 
#include <string>
#include <sstream>
#include <cstdlib>
#include <iterator>
#include <iomanip>

using namespace std;

int main(int argc, char **argv) {
  // Parse in command line arguments, and problem specific attributes
  Problem problem(argc, argv);
  cout << "Finished loading in problem!!" << endl;

  return 0;
}
