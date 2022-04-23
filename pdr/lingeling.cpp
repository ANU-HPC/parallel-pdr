// A wrapper for Lingeling for convenient use
// TODO destructors
#include "lingeling.h"

using namespace std;

void set_seed(LGL *solver) {
  // Uncomment to actually randomize the seed
  // const int seed = getpid();
  // lglsetopt (solver, "seed", seed);	// set option value
}

// constructors
Lingeling::Lingeling() {
  solver = lglinit();
  set_seed(solver);
}

Lingeling::Lingeling(Lingeling *other_instance) {
  solver = lglclone(other_instance->solver);
  set_seed(solver);
}

Lingeling::Lingeling(const char *fname) {
  solver = lglinit();
  set_seed(solver);
  load_DIMACS_Cnf(fname);
}

Lingeling::~Lingeling() {
  // TODO destructors
  lglrelease(solver);
}

void Lingeling::flush_cache() {
  lglflushcache(solver); // flush all learned clauses
}

Lingeling Lingeling::clone() {
  assert(0); // TODO causes problems.. look into it
  // return Lingeling(lglclone(solver));
  return Lingeling();
}

// Taken from tinisat
void Lingeling::load_DIMACS_Cnf(const char *fname) {
  FILE *ifp;
  TEST_NOT_NULL(ifp = fopen(fname, "r"));
  cc = 0;
  vc = 0;
  int max_clause_len = 1024, max_clause_count = 1024, *literals;
  TEST_NOT_NULL(literals = (int *)malloc(max_clause_len * sizeof(int)))
  char line[100000];
  size_t len = 100000;
  char c;

  // search for and read the header
  int header_vc, header_cc;
  while ((c = getc(ifp)) != EOF) {
    if (isspace(c))
      continue;
    else
      ungetc(c, ifp);
    char *UNUSED = fgets(line, len, ifp);
    if (c == 'p') {
      if (sscanf(line, "p cnf %d %d", &header_vc, &header_cc) == 2)
        break;
      else
        throw ParsingException(" Invalid CNF file\n");
    }
  }
  // allocate original data buffers
  TEST_NOT_NULL(clauses = (int **)calloc(max_clause_count, sizeof(int *)))
  TEST_NOT_NULL(cl = (unsigned *)calloc(max_clause_count, sizeof(unsigned)))

  // for each line
  while ((c = getc(ifp)) != EOF) {
    if (isspace(c))
      continue;
    else
      ungetc(c, ifp);
    // search for the first non-whitespace character
    if ((c == '-') || isdigit(c)) {
      int literal_input_count;
      int literal_input;
      int j = -1;
      // scan the line into the literals buffer one character at a time, until
      // the zero is scanned
      do {
        j++;
        literal_input_count = fscanf(ifp, "%d", &literal_input);
        if (literal_input_count == 0)
          throw ParsingException("Invalid CNF file - cnf lines must involve "
                                 "digits and terminate with zero\n");
        if (j == max_clause_len) {
          max_clause_len *= 2;
          TEST_NOT_NULL(
              literals = (int *)realloc(literals, max_clause_len * sizeof(int)))
        }
        literals[j] = literal_input;
        if (abs(literal_input) > vc)
          vc = abs(literal_input);
      } while (literal_input != 0);
      // allocate room for the new clause
      TEST_NOT_NULL(clauses[cc] = (int *)calloc(j + 1, sizeof(int)))
      // load the new clause in checking for duplicate and contradicting
      // literals
      for (int k = 0; k <= j; k++) {
        for (int x = 0; x < k; x++) {
          if (literals[x] == literals[k]) {
            for (int pri = 0; pri <= j; pri++) {
              printf("%d ", literals[pri]);
            }
            printf("\n");
            printf("duplicate lit %d\n", literals[x]);
            throw ParsingException(
                "duplicate literals in clause in CNF file \n");
          } else if (literals[x] + literals[k] == 0)
            throw ParsingException(
                "contradicting literals in clause in CNF file \n");
        }
        clauses[cc][k] = literals[k];

        // == THE ONLY CHANGE ========
        lgladd(solver, literals[k]);
        if (literals[k])
          lglfreeze(solver, literals[k]);
        // ===========================
      }
      // set the clause length, increment the clause count, and expand buffers
      // as nessisary
      cl[cc] = j;
      cc++;
      if (cc + 1 >= max_clause_count) {
        max_clause_count *= 2;
        TEST_NOT_NULL(clauses = (int **)realloc(clauses, max_clause_count *
                                                             sizeof(int *)))
        TEST_NOT_NULL(
            cl = (unsigned *)realloc(cl, max_clause_count * sizeof(unsigned)))
      }
    }
    // get a new line
    char *UNUSED = fgets(line, len, ifp);
  }
  clauses[cc] = NULL;
  // cl[cc] = NULL; // TODO Makes some data structures wrong
  if ((header_vc != vc) || (header_cc != cc))
    throw ParsingException("CNF has header that dosnt match its body - bad "
                           "variable count or clause count \n");
  free(literals);
  free(clauses);
  fclose(ifp);
}

void Lingeling::add_clause(const vector<int> &inClause) {
  for (int i = 0; i < inClause.size(); i++) {
    lgladd(solver, inClause[i]);
    lglfreeze(solver, inClause[i]);
  }
  lgladd(solver, 0);
}

void Lingeling::add_clauses(const vector<vector<int>> &inClauses) {
  for (int j = 0; j < inClauses.size(); j++) {
    for (int i = 0; i < inClauses[j].size(); i++) {
      lgladd(solver, inClauses[j][i]);
      lglfreeze(solver, inClauses[j][i]);
    }
    lgladd(solver, 0);
  }
}

bool Lingeling::solve(const vector<int> &assumptions) {
  last_assumptions = assumptions;
  for (int i = 0; i < assumptions.size(); i++) {
    lglassume(solver, assumptions[i]);
    lglfreeze(solver, assumptions[i]);
  }
  int rawOutput = lglsat(solver);
  if (rawOutput == 10)
    return true;
  if (rawOutput == 20)
    return false;
  assert(0);
}

// have a second set of assumptions which are not mentioned in
// "used_assumptions"
bool Lingeling::solve_unmentioned_assumptions(
    const vector<int> &assumptions,
    const vector<int> &unmentioned_assumptions) {
  last_unmentioned_assumptions = unmentioned_assumptions;
  last_assumptions = assumptions;
  for (int i = 0; i < assumptions.size(); i++) {
    lglassume(solver, assumptions[i]);
    lglfreeze(solver, assumptions[i]);
  }
  for (int i = 0; i < unmentioned_assumptions.size(); i++) {
    lglassume(solver, unmentioned_assumptions[i]);
    lglfreeze(solver, unmentioned_assumptions[i]);
  }
  // cout << "start actual solving" << endl;
  int rawOutput = lglsat(solver);
  // cout << "end actual solving" << endl;
  if (rawOutput == 10)
    return true;
  if (rawOutput == 20)
    return false;
  assert(0);
}

vector<int> Lingeling::get_model(int lowest, int largest) {
  // include the smallest and largest variable wanted
  vector<int> assignments;
  for (int i = lowest; i <= largest; i++) {
    assignments.push_back(lglderef(solver, i) * i); // as deref gives +1/-1
  }
  return assignments;
}

vector<int> Lingeling::get_model() {
  const int vars = lglmaxvar(solver);
  vector<int> assignments(vars);
  for (int i = 1; i <= vars; i++) {
    assignments[i - 1] =
        lglderef(solver, i) *
        i; //.push_back(lglderef(solver, i) * i); // as deref gives +1/-1
  }
  return assignments;
}

vector<int> Lingeling::used_assumptions() {
  vector<int> return_assumptions;
  for (int i = 0; i < last_assumptions.size(); i++) {
    if (lglfailed(solver, last_assumptions[i])) {
      return_assumptions.push_back(last_assumptions[i]);
    }
  }
  return return_assumptions;
}

void Lingeling::set_important(const vector<int> &variables) {
  for (auto it = variables.begin(); it != variables.end(); it++) {
    lglsetimportant(solver, *it);
  }
}
