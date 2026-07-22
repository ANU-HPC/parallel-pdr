#ifndef INT_BITMAP_H
#define INT_BITMAP_H

#include <vector>
#include "Log.h"
#include "Utils.h"

using namespace std;

class Int_Bitmap {
  public:
    void insert(int element);
    void erase(int element);
    bool contains(int element);
    int size();
    void clear();
    void print();
  private:
    vector<bool> _bitmap;
    int _size = 0;
};

#endif
