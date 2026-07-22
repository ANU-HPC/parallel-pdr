// A wrapper for Lingeling for convenient use
// TODO destructors
#include "Lingeling.h"

using namespace std;

void set_seed(LGL* solver) {
  // Uncomment to actually randomize the seed
  //const int seed = getpid();
  //lglsetopt (solver, "seed", seed);	// set option value
}

// constructors
Lingeling::Lingeling() {
  solver = lglinit();
  set_seed(solver);
}

Lingeling::Lingeling(Lingeling* other_instance) {
  solver = lglclone(other_instance->solver);
  set_seed(solver);
}

Lingeling::Lingeling(const char* fname) {
  solver = lglinit();
  set_seed(solver);

  FILE *ifp;
  ifp = fopen(fname, "r");
  if (ifp == 0) {
    cerr << "Parsing Error";
    exit(1);
  }

  int lines = 0;
  int max_var = 0;

  lglparsefile(solver, ifp, 0, &lines, &max_var);

  for (int i=1; i<=max_var; i++) {
    lglfreeze(solver, i);
  }
}

Lingeling::~Lingeling() {
  // TODO destructors
  lglrelease(solver);
}

void Lingeling::flush_cache() {
  lglflushcache (solver);			// flush all learned clauses
}

Lingeling Lingeling::clone() {
  exit(1);
  assert(0); // TODO causes problems.. look into it
  //return Lingeling(lglclone(solver));
  return Lingeling();
}

void Lingeling::test_non_null(int* x) {
  if (x==NULL) {
    cerr << "Parsing Error";
    exit(1);
  }
}

void Lingeling::add_clause(const vector<int>& inClause) {
  for (int i=0; i<inClause.size(); i++) {
    lgladd(solver, inClause[i]);
    lglfreeze(solver, inClause[i]);
  }
  lgladd(solver, 0);
}

void Lingeling::add_clauses(const vector<vector<int>>& inClauses) {
  for (int j=0; j<inClauses.size(); j++){
    for (int i=0; i<inClauses[j].size(); i++) {
      lgladd(solver, inClauses[j][i]);
      lglfreeze(solver, inClauses[j][i]);
    }
    lgladd(solver, 0);
  }
}

bool Lingeling::solve(const vector<int>& assumptions) {
  last_assumptions = assumptions;
  for (int i=0; i<assumptions.size(); i++){
  //for (int i=assumptions.size()-1; i>=0; i--){
    lglassume(solver, assumptions[i]);
    lglfreeze(solver, assumptions[i]);
  }
  int rawOutput = lglsat(solver);
  if (rawOutput == 10) return true;
  else if (rawOutput == 20) return false;
  else {
    cerr << "ERROR in using SAT solver interface" << endl;
    exit(1);
  }
}

// have a second set of assumptions which are not mentioned in "used_assumptions" 
bool Lingeling::solve_unmentioned_assumptions(const vector<int>& assumptions, const vector<int>& unmentioned_assumptions) {
  last_unmentioned_assumptions = unmentioned_assumptions;
  last_assumptions = assumptions;
  for (int i=0; i<assumptions.size(); i++){
  //for (int i=assumptions.size()-1; i>=0; i--){
    lglassume(solver, assumptions[i]);
    lglfreeze(solver, assumptions[i]);
  }
  for (int i=0; i<unmentioned_assumptions.size(); i++){
    lglassume(solver, unmentioned_assumptions[i]);
    lglfreeze(solver, unmentioned_assumptions[i]);
  }
  //cout << "start actual solving" << endl;
  int rawOutput = lglsat(solver);
  //cout << "end actual solving" << endl;
  if (rawOutput == 10) return true;
  else if (rawOutput == 20) return false;
  else {
    cerr << "ERROR in using SAT solver interface" << endl;
    exit(1);
  }
}


vector<int> Lingeling::get_model(int lowest, int largest) {
  // include the smallest and largest variable wanted
  vector<int> assignments;
  for(int i=lowest; i<=largest; i++){
    assignments.push_back(lglderef(solver, i) * i); // as deref gives +1/-1
  }
  return assignments;
}

vector<int> Lingeling::get_model() {
  const int vars = lglmaxvar(solver);
  vector<int> assignments(vars);
  for(int i=1; i<=vars; i++){
    assignments[i-1] = lglderef(solver,i) * i; //.push_back(lglderef(solver, i) * i); // as deref gives +1/-1
  }
  return assignments;
}

vector<int> Lingeling::used_assumptions() {
  /*
  int pos_lit;
  int num_pos_lits = 0;
  for (auto it=last_unmentioned_assumptions.begin(); it!=last_unmentioned_assumptions.end(); it++) {
    if (*it>0) {
      num_pos_lits++;
      pos_lit = *it;
    }
  }
  assert(num_pos_lits);
  if (num_pos_lits == 1) {
    assert(lglfailed(solver, pos_lit));
  }
  */

  vector<int> return_assumptions;
  for (int i=0; i < last_assumptions.size(); i++){
    if (lglfailed(solver, last_assumptions[i])){
      return_assumptions.push_back(last_assumptions[i]);
    }
  }
  return return_assumptions;
}

void Lingeling::set_important(const vector<int>& variables) {
  for (auto it = variables.begin(); it != variables.end(); it++) {
    lglsetimportant(solver, *it);
  }
}
