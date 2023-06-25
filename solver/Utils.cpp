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
  cout << "inflate_only_true_to_all" << endl;
  cout << "only true: " << Utils::to_string(only_true) << endl;
  cout << "all: " << Utils::to_string(all) << endl;
  assert(is_sorted(only_true.begin(), only_true.end()));
  assert(is_sorted(all.begin(), all.end()));
    
  auto full_current = all.begin();
  const auto full_end = all.end();
  auto only_true_current = only_true.begin();
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
  string ret_val = "{";
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
  return ret_val + " }";
}

string Utils::to_string(int* data, int size) {
  string ret_val = "";
  for (int i=0; i<size; i++) {
    ret_val += std::to_string(data[i]) + " ";
  }
  return ret_val;
}

void Utils::get_as_MPI_message(int* data, int start, vector<int> x) {
  for (int i=0; i<x.size(); i++) {
    data[start+i] = x[i];
  }
}

int Utils::MPI_message_size(vector<int> x) {
  return x.size();
}

vector<int> Utils::get_from_MPI_message(int* data, int start, int stop) {
  vector<int> ret_val;
  for (int i=start; i<stop; i++) {
    ret_val.push_back(data[i]);
  }
  return ret_val;
}

int Utils::tilde(int lit, int amount) {
  assert(lit != 0);
  if (lit > 0) return lit + amount * Global::problem.total_per_timestep;
  else         return lit - amount * Global::problem.total_per_timestep;
}

vector<int> Utils::tilde(const vector<int>& clause, int amount) {
  vector<int> ret_val(clause.size());
  for (int i=0; i<clause.size(); i++) {
    ret_val[i] = tilde(clause[i], amount);
  }
  return ret_val;
}

bool Utils::in(const set<int>& container, int element) {
  return container.find(element) != container.end();
}


/*
bool in_pos_vector(int x, const vector<int>& vec) {
  return binary_search(vec.begin(), vec.end(), x);
}

bool in_abs_sorted_vector(int x, const vector<int>& vec) {
  for (auto it=vec.begin(); it!=vec.end(); it++) {
    if (*it == x) {
      return true;
    }
  }
  return false;
}
*/
