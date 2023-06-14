#include <vector>
#include <map>
#include <unordered_map>
#include <set>
#include <unordered_set>
#include <list>
#include <cassert>
#include <iostream>
#include <stdlib.h> 
#include <string>
#include <sstream>
#include <cstdlib>
#include <iterator>
#include <algorithm>

#include "Utils.h"

using namespace std;

vector<int> Utils::inflate_only_true_to_all(const vector<int>& only_true, const vector<int>& all) {
  assert(is_sorted(only_true.begin(), only_true.end()));
  assert(is_sorted(all.begin(), all.end()));
    
  auto full_current = all.begin();
  const auto full_end = all.end();
  auto only_true_current = only_true.begin()+2;
  const auto only_true_end = only_true.end();

  vector<int> result;

  while (only_true_current != only_true_end) {
    if (abs(*full_current) == *only_true_current) {
      result.push_back(*full_current);
      full_current++;
      only_true_current++;
    } else {
      result.push_back(-(*full_current));
      full_current++;
    }
  }

  while (full_current != full_end) {
    result.push_back(-(*full_current));
    full_current++;
  }

  return result;
}

string Utils::to_string(vector<int> x) {
  // give by copy
  string ret_val = "";
  for (int i=0; i<x.size(); i++) {
    if (x[i] > 0) {
      ret_val += "  \033[38;5;10m";
      ret_val += std::to_string(x[i]);
    } else {
      ret_val += " \033[38;5;9m";
      ret_val += std::to_string(x[i]);
    }
    ret_val += "\033[0m";
  }
  return ret_val;
}

string Utils::to_string(int* data, int size) {
  string ret_val = "";
  for (int i=0; i<size; i++) {
    ret_val += std::to_string(data[i]) + " ";
  }
  return ret_val;
}
