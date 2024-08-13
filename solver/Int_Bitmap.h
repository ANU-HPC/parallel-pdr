#ifndef INT_BITMAP_H
#define INT_BITMAP_H

#include <vector>

using namespace std;

class Int_Bitmap {
  public:
    void insert(int element);
    void erase(int element);
    bool contains(int element);
    int size();
  private:
    vector<bool> _bitmap;
    int _size = 0;
};

#endif
