
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <cmath>
#include <cassert>
#include <cerrno>
#include <pthread.h>
#include <time.h>

#include "../../utilities.cpp"
#include "../../Cnf.cpp"
#include "../ReversableIntegerMap.h"
#include "../ReversableIntegerMap.cc"
#include "../gnovelty.cc"

using namespace std;
clock_t tStart;

void *run(void* filename) {
  srandom(genRandomSeed());
  Cnf* cnf = new Cnf((const char*)filename);
  Gnovelty *gnovelty = new Gnovelty_updateClauseWeights_NULL(cnf, 0, 5, 0);
  while (gnovelty->step(1, true) == 0);
  int* solution = gnovelty->processSolution();
  for (int i=0; solution[i]!=0; i++)
    printf("%i ",solution[i]);
  free(solution);
  delete gnovelty;
  printf("\nTime taken: %.5fs\n", (double)(clock() - tStart)/CLOCKS_PER_SEC);
printf("flipped %i\n",gnovelty->flip);
  return NULL;
}


int main(int argc,char *argv[]) {
  if (argc != 3) {
    printf("must pass two parameters <filename> <num_threads>\n");
    return 1;
  }
  int numThreads = atoi(argv[2]);
  if (numThreads <= 0) {
    printf("must pass >0 integer for num_threads\n");
    return 1;
  }
  
  tStart = clock();
  for (int i=1; i<numThreads; i++) {
    pthread_t thread;
    if(pthread_create(&thread, NULL, run, argv[1] )){
      printf("failed to create thread\n");
      exit(1);
    }
  }
  run(argv[1]);

  return 0;
}




