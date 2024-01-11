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

int Utils::worker_to_steps(int worker) {
  return Global::problem.worker_to_transitions[worker];
}

vector<int> Utils::inflate_only_true_to_all(const vector<int>& only_true, const vector<int>& all) {
  //LOG << "only true: " << Utils::to_string(only_true) << endl;
  //LOG << "all: " << Utils::to_string(all) << endl;
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

string repeat(string s, int times) {
  if (times == 0) return "";
  else return s + repeat(s, times-1);
}

string Utils::to_symbols_string(int x) {
  const string pos = x>0 ? "" : "-";
  const int timestep = (abs(x)-1)/Global::problem.total_per_timestep;
  const int x_in_timestep = ((abs(x)-1)%Global::problem.total_per_timestep)+1;

  if (Global::problem.nondeterministic) {
    if (timestep > Global::problem.max_num_outcomes) {
      return pos + "AUX" + std::to_string(x_in_timestep);
    } else {

      if (in(Global::problem.actions_set, x_in_timestep) && timestep != 0) {
        return pos + "UA";
      } else {
        return pos + repeat("*", timestep) + Global::problem.symbols[x_in_timestep];
      }
    }
  }
}

string Utils::to_symbols_string(vector<int> x) {
  // give by copy

  string h = "[" + hash_string(Utils::hash(x)) + "]";

  string ret_val = "{" + h;
  for (int i=0; i<x.size(); i++) {
    if (x[i] > 0) {
      ret_val += "  \033[38;5;10m";
      ret_val += to_symbols_string(x[i]);
    } else {
      ret_val += " \033[38;5;9m";
      ret_val += to_symbols_string(x[i]);
    }
    ret_val += "\033[0m";
  }
  return ret_val + " }";
}

string Utils::to_symbols_string(set<int> x) {
  // give by copy

  string ret_val = "{ ";

  for (auto it=x.begin(); it!=x.end(); it++) {
    const int element = *it; 
    if (element > 0) {
      ret_val += "  \033[38;5;10m";
      ret_val += to_symbols_string(element);
    } else {
      ret_val += " \033[38;5;9m";
      ret_val += to_symbols_string(element);
    }
    ret_val += "\033[0m";
  }
  return ret_val + " }";
}

string Utils::to_string(vector<int> x) {
  // give by copy

  string h = "[" + hash_string(Utils::hash(x)) + "]";

  string ret_val = "{" + h;
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

string Utils::to_string(set<int> x) {
  // give by copy

  string ret_val = "{ ";

  for (auto it=x.begin(); it!=x.end(); it++) {
    const int element = *it; 
    if (element > 0) {
      ret_val += "  \033[38;5;10m";
      ret_val += std::to_string(element);
    } else {
      ret_val += " \033[38;5;9m";
      ret_val += std::to_string(element);
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

bool Utils::in(const unordered_set<int>& container, int element) {
  return container.find(element) != container.end();
}

size_t Utils::hash(const vector<int>& hashee) {
  size_t ret_val = 0;
  int offset = 0;
  for (auto i : hashee) {
    ret_val ^= i<<offset;
    ret_val ^= i<<(offset+8);
    offset += 3;
    offset = offset%16;
  }
  return ret_val + (ret_val<<32);
}

string Utils::hash_string(size_t hash) {
  const int lower = 33;
  const int upper = 126;
  const int mod = upper-lower;

  const int a = hash%mod+lower;
  const int b = (hash/mod)%mod+lower;
  const int c = (hash/(mod*mod))%mod+lower;
  const int d = (hash/(mod*mod*mod))%mod+lower;
  const int e = (hash/(mod*mod*mod*mod))%mod+lower;

  const string a_str = string(1, a);
  const string b_str = string(1, b);
  const string c_str = string(1, c);
  const string d_str = string(1, d);
  const string e_str = string(1, e);

  //string start = "\033[48;2;90;10;10;25m";

  const string start = "\033[38;5;200;48;5;87m";

  //string start = "\033[43;2;90;10;10;25m";
  const string end = "\033[0m";

  return start + a_str + b_str + c_str + d_str + e_str + end;
}

bool Utils::abs_comp(const int a, const int b) {
  return abs(a)<abs(b); 
}

bool Utils::is_abs_sorted(const vector<int>& x) {
  return is_sorted(x.begin(), x.end(), abs_comp);
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
