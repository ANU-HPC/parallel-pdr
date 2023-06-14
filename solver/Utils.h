#ifndef UTILS_H
#define UTILS_H

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
#include <algorithm>

using namespace std;

class Utils {
  public:
    static vector<int> inflate_only_true_to_all(const vector<int>& only_true, const vector<int>& all);
};

#endif
