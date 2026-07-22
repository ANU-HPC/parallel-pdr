#ifndef UTILS_H
#define UTILS_H

#include <string>
#include <vector>
#include <unordered_set>

#include "Global.h"
#include "Log.h"

using namespace std;

class Utils {
  public:
    // TODO only for testing/debugging
    static int worker_to_steps(int worker);

    static vector<int> inflate_only_true_to_all(const vector<int>& only_true, const vector<int>& all);
    static string to_string(vector<int> x);
    static string to_string(set<int> x);
    static string to_string(int* data, int size);

    static void get_as_MPI_message(int* data, int start, vector<int> x);
    static int MPI_message_size(vector<int> x);
    static vector<int> get_from_MPI_message(int* data, int start, int stop);

    static int tilde(int lit, int amount);
    static vector<int> tilde(const vector<int>& clause, int amount);

    static bool in(const set<int>& container, int element);
    static bool in(const unordered_set<int>& container, int element);

    static size_t hash(const vector<int>& hashee);

    static string hash_string(size_t hash);

    static bool abs_comp(const int a, const int b);
    static bool is_abs_sorted(const vector<int>& x);
};
#endif
