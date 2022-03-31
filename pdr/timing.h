#include <stdlib.h>
#include <cassert>
#include <vector>
#include <set>
#include <algorithm>
#include <map>
#include <iostream>

using namespace std;

class Timing {
  public:
    void dagster_start(int subproblem);
    void dagster_stop(bool result);
    void lingeling_start(int subproblem);
    void lingeling_stop(bool result);
    void print();
  private:
    // subproblem to cumulative time of sat/unsat
    vector<vector<clock_t>> dagster_times; 
    vector<vector<clock_t>> lingeling_times;

    // subproblem to call count
    vector<vector<int>> dagster_counts;
    vector<vector<int>> lingeling_counts; 

    clock_t dagster_start_time = 0;
    clock_t lingeling_start_time = 0;

    int dagster_subproblem = -1;
    int lingeling_subproblem = -1;

    string string_float(float number);
    float float_time(clock_t time);
};
