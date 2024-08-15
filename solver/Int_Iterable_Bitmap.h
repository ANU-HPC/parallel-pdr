#ifndef INT_ITERABLE_BITMAP_H
#define INT_ITERABLE_BITMAP_H

#include <deque>
#include <cassert>
#include "Int_Bitmap.h"

using namespace std;

class Int_Iterable_Bitmap {
  public:
    void insert(int element);
    void erase(int element);
    bool contains(int element);
    void make_iterable();
    int iterate_index_get(int index);
    int first();
    int size();
    void clear();
  private:
    Int_Bitmap _bitmap;
    deque<int> _untrimmed_elements; // might have duplicates, or mention elements that aren't really there, but WILL have all the element in it. really there => listed here, listed here => really there
};

#endif
