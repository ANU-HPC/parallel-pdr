#ifndef SRIM_HH
#define SRIM_HH

#include <assert.h>
#include "ReversableIntegerMap.h"

// an easy lookup list of integers. map stores sequential list of positive integers
// and reverse_map stores the position on the list that any specific integer occurs on.
// manipulations keep the map sored in order of score
class ScoredReversableIntegerMap : public ReversableIntegerMap {
protected:
  void flip_forward(unsigned int a, unsigned int b);
public:
  int* scores;

  ScoredReversableIntegerMap(unsigned int size);
  ~ScoredReversableIntegerMap();

  void append(unsigned int c);	// add a variable to the container, defaults to score of zero. breaks variable order
  void append_with_score(unsigned int c, int score); // add a variable to the container with score <score>, inserts in correct order.
  void remove(unsigned int c); // removes an element from the container, maintains sorted order.
  void resize(unsigned int new_size); // redimensions the underlying arrays
  void increase_size(unsigned int additional_size); // redimensions the underlying arrays
  void reset(); // clears all
  void print(); // prints to console

  void sort(); // bubble sort map order according to score
  void update_score(unsigned int v, int score); // change the score of a variable
  void unsafe_update_score(unsigned int v, int score);

  inline int get_variable_at_position(unsigned int i);
  inline int get_position_of_variable(unsigned int v);
  inline int get_num_variables();
};

// more descriptive accessor method, given an index, get the variable at that index
// normally variables are indexed according to their score
inline int ScoredReversableIntegerMap::get_variable_at_position(unsigned int i) {
  assert(i<map_size);
  return map[i];
}

// more descriptive accessor method, given a variable, get the index it is at
// normally variables are indexed according to their score
inline int ScoredReversableIntegerMap::get_position_of_variable(unsigned int v) {
  assert(v<size);
  unsigned int val = reverse_map[v];
  assert(val!=-1);
  return val;
}

// more descriptive acessor method, get the number of variables held in the container
inline int ScoredReversableIntegerMap::get_num_variables() {
  return map_size;
}


#endif
