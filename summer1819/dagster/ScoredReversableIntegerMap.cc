#include "ScoredReversableIntegerMap.h"
#include "exceptions.h"
#include "stdio.h"
#include "mpi_global.h"
#include "utilities.h"

ScoredReversableIntegerMap::ScoredReversableIntegerMap(unsigned int size) : ReversableIntegerMap(size) {
  TEST_NOT_NULL(scores = (int*)calloc(sizeof(unsigned int),size))
}
ScoredReversableIntegerMap::~ScoredReversableIntegerMap() {
  free(scores);
}

// add an integer c to the map list, default with score zero
// NOTE: breaks sorted order
void ScoredReversableIntegerMap::append(unsigned int c) {
  if (c+1>size)
    increase_size(c+1-size);
  ReversableIntegerMap::append(c);
}

// add an integer c to the map list, set with score <score>
void ScoredReversableIntegerMap::append_with_score(unsigned int c, int score) {
  append(c);
  update_score(c,score);
}

// remove an item from the list, resorts.
void ScoredReversableIntegerMap::remove(unsigned int c) {
  assert(c<size);
  if (reverse_map[c] != -1)
    scores[reverse_map[c]] = scores[map_size-1];
  ReversableIntegerMap::remove(c);
  sort();
}

// increase the size of the underlying arrays
void ScoredReversableIntegerMap::resize(unsigned int new_size) {
  if (new_size>size)
    increase_size(new_size-size);
}

// add the the size of the underlying array
void ScoredReversableIntegerMap::increase_size(unsigned int additional_size) {
  if (additional_size<=0) return;
  TEST_NOT_NULL(scores = (int*)realloc(scores, sizeof(int)*(size+additional_size)))
  for (int i=size; i<size+additional_size; i++)
    scores[i] = 0;
  ReversableIntegerMap::increase_size(additional_size);
}

// private method that flips the variable at index a and b in the map.
void ScoredReversableIntegerMap::flip_forward(unsigned int a, unsigned int b) {
  FLIP(map[a],map[b])
  FLIP(scores[a],scores[b])
  FLIP(reverse_map[map[a]],reverse_map[map[b]])
}

// sorts the map
void ScoredReversableIntegerMap::sort() { // bubble sort
  bool bubbled;
  do {
    bubbled = false;
    for (int i=0; i<map_size-1; i++) {
      if (scores[i]<scores[i+1]) {
        flip_forward(i,i+1);
        bubbled = true;
      }
    }
  } while (bubbled == true);
}

// update the score of variable i with <score>, keep map sorted
void ScoredReversableIntegerMap::update_score(unsigned int v, int score) {
  assert(v<size);
  unsigned int i = reverse_map[v];
  assert(i!=-1);
  scores[i] = score;
  unsigned int j = i;
  while ((j>=1) && (scores[j-1]<scores[j])) {
    flip_forward(j-1,j);
    j--;
  }
  j = i;
  while ((j+1<map_size) && (scores[j]<scores[j+1])) {
    flip_forward(j,j+1);
    j++;
  }
}

// update the score of variable i with <score>, do not keep map sorted
void ScoredReversableIntegerMap::unsafe_update_score(unsigned int v, int score) {
  assert(v<size);
  unsigned int i = reverse_map[v];
  assert(i!=-1);
  scores[i] = score;
}

// reset all data
void ScoredReversableIntegerMap::reset() {
  ReversableIntegerMap::reset();
  for (int i=0; i<size; i++)
    scores[i] = 0;
}

// print map and scores to terminal
void ScoredReversableIntegerMap::print() {
  for (int i=0; i<map_size; i++)
    printf("%ith var: %i\tscore: %i\n",reverse_map[map[i]],map[i],scores[i]);
}






