
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <cmath>
#include <cassert>
#include <cerrno>
#include <time.h>

#include "../../utilities.cpp"
#include "../../Cnf.cpp"
#include "../ReversableIntegerMap.h"
#include "../ReversableIntegerMap.cc"
#include "../gnovelty.cc"

using namespace std;
clock_t tStart;

void *run(void* filename, void* output_filename) {
  srandom(genRandomSeed());
  printf("Gnovelty loading CNF %s\n",(const char*)filename);
  Cnf* cnf = new Cnf((const char*)filename);
  Gnovelty *gnovelty = new Gnovelty_updateClauseWeights_NULL(cnf, 0, 5, 0);
  printf("Gnovelty solving...");
  while (gnovelty->step(1, true) == 0);
  int* solution = gnovelty->processSolution();
  printf(" Solved\n");
  if (output_filename == NULL) {
    for (int i=0; solution[i]!=0; i++)
      printf("%i ",solution[i]);
    printf("\n");
  } else {
    FILE* f = fopen((const char*)output_filename,"w");
    for (int i=0; solution[i]!=0; i++)
      fprintf(f,"%i ",solution[i]);
    fclose(f);
  }
  free(solution);
  delete gnovelty;
  printf("Gnovelty Time taken: %.5fs \tflipped %i\n", (double)(clock() - tStart)/CLOCKS_PER_SEC,gnovelty->flip);
  return NULL;
}


int main(int argc,char *argv[]) {
  if ((argc != 2) && (argc != 3)) {
    printf("must pass atleast one parameters <CNF_filename> [solution_file]\n");
    return 1;
  }
  tStart = clock();
  auto output_filename = (argc==3?argv[2]:NULL);
  run(argv[1],output_filename);

  return 0;
}




