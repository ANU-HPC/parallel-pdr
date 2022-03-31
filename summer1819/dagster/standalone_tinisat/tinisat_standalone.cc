
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <cmath>
#include <cassert>
#include <cerrno>
#include <time.h>

#include "../Cnf.h"
#include "../Cnf.cpp"
#include "../CnfManager.h"
#include "../CnfManager.cpp"
#include "../SatSolver.h"
#include "../SatSolver.cpp"
#include "../utilities.h"
#include "../utilities.cpp"
#include "../strengthener/Work.h"
#include "../strengthener/Work.cc"
#include "../strengthener/MpiBuffer.h"
#include "../strengthener/MpiBuffer.cc"
#include "../ReversableIntegerMap.h"
#include "../ReversableIntegerMap.cc"
#include "../ScoredReversableIntegerMap.h"
#include "../ScoredReversableIntegerMap.cc"

using namespace std;

int main(int argc,char *argv[]) {
  if (argc != 2) {
    printf("must pass CNF file <filename>\n");
    return 1;
  }
  std::string str ("Test string");
  clock_t tStart = clock();
  srandom(genRandomSeed());
  Cnf* cnf = new Cnf((const char*)argv[1]);
  SatSolver* solver = new SatSolver(cnf, 5, 5, NULL, NULL, true, false, str, 0);
  while (solver->run() == 2);
  for (int i=0; i<solver->cnf->vc; i++)
    printf("%i %i\n",i,solver->vars[i].value);
  delete solver;
  delete cnf;
  printf("\nTime taken: %.5fs\n", (double)(clock() - tStart)/CLOCKS_PER_SEC);
  return 0;
}




