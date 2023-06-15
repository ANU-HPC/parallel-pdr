#ifndef UTILS_H
#define UTILS_H

#include <string>
#include <vector>

using namespace std;

class Utils {
  public:
    static vector<int> inflate_only_true_to_all(const vector<int>& only_true, const vector<int>& all);
    static string to_string(vector<int> x);
    static string to_string(int* data, int size);

    static void get_as_MPI_message(int* data, int start, vector<int> x);
    static int MPI_message_size(vector<int> x);
    static vector<int> get_from_MPI_message(int* data, int start, int stop);
};

#endif
