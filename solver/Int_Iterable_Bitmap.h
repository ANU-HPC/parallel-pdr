#ifndef INT_ITERABLE_BITMAP_H
#define INT_ITERABLE_BITMAP_H

#include <deque>
#include "Int_Bitmap.h"

using namespace std;

class Int_Iterable_Bitmap {
  public:
    void insert(int element);
    void erase(int element);
    bool contains(int element);
    int first();
    int size();
  private:
    Int_Bitmap _bitmap;
    deque<int> _untrimmed_elements;
};

#endif
