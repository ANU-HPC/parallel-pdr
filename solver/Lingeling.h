#ifndef LINGELING_H
#define LINGELING_H

// Some code taken from Dagster/Tinisat

// TODO destructors
// A wrapper for Lingeling for convenient use
extern "C" {
#include "lglib.h" // Needs to be included from lingeling directory
}
#include <stdlib.h>
#include <cassert>
#include <vector>
#include <iostream>
#include <stdio.h>
#include <ctype.h>
#include <algorithm>
#include <unistd.h>
#include <string>
#include "Log.h"
#include "Utils.h"

using namespace std;

class Lingeling {
  public:
    Lingeling();
    Lingeling(Lingeling* other_instance);
    Lingeling(const char* fname);
    ~Lingeling();
    Lingeling clone();
    void load_deterministic_planning_problem(string directory, int timesteps);
    void load_nondeterministic_planning_problem(string directory);
    void flush_cache();
    void add_clause(const vector<int>& inClause);
    void add_clauses(const vector<vector<int>>& inClauses);
    bool solve(const vector<int>& assumptions);
    bool solve_unmentioned_assumptions(const vector<int>& assumptions, const vector<int>& unmentioned_assumptions);
    vector<int> get_model(int lowest, int largest);
    vector<int> get_model();
    vector<int> used_assumptions();
    void set_important(const vector<int>& variables);
    void set_name(string name);

  private:
    void load_with_copies(const char* fname, int iterations);
    void load_DIMACS_Cnf(const char* fname);
    vector<int> last_assumptions;
    vector<int> last_unmentioned_assumptions;
    LGL* solver = NULL;
    void test_non_null(int* x);

    string _name = "unnamed";

    // TODO refine these tinisat variables
    unsigned vc;	// var count
    unsigned cc;	// clause count
    int **clauses;	// 2-dim. array with entries same as in cnf file
    unsigned *cl;	// clause length
};
#endif
