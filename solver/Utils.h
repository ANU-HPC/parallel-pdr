#ifndef UTILS_H
#define UTILS_H

#include <string>

using namespace std;

class Utils {
  public:
    static vector<int> inflate_only_true_to_all(const vector<int>& only_true, const vector<int>& all);
    static string to_string(vector<int> x);
    static string to_string(int* data, int size);
};

#endif
