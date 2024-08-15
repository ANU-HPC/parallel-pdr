#include "Int_Bitmap.h"

void Int_Bitmap::insert(int element) {
  if (element >= _bitmap.size()) {
    _bitmap.resize(element+1000);
  }

  if (!_bitmap[element]) {
    _bitmap[element] = true;
    _size++;
  }
}

void Int_Bitmap::erase(int element) {
  if (element >= _bitmap.size()) return;

  if (_bitmap[element]) {
    _bitmap[element] = false;
    _size--;
  }
}

bool Int_Bitmap::contains(int element) {
  if (element >= _bitmap.size()) return false;
  return _bitmap[element];
}

int Int_Bitmap::size() {
  return _size;
}

void Int_Bitmap::clear() {
  _bitmap.clear();
  _size = 0;
}
