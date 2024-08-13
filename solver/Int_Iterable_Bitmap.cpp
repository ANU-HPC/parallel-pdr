#include "Int_Iterable_Bitmap.h"

void Int_Iterable_Bitmap::insert(int element) {
  if (!_bitmap.contains(element)) {
    _bitmap.insert(element);
    _untrimmed_elements.push_back(element);
  }
}

void Int_Iterable_Bitmap::erase(int element) {
  _bitmap.erase(element);
}

bool Int_Iterable_Bitmap::contains(int element) {
  return _bitmap.contains(element);
}

int Int_Iterable_Bitmap::first() {
  while (true) {
    int potential_element = *_untrimmed_elements.begin();
    if (_bitmap.contains(potential_element)) {
      return potential_element;
    } else {
      // remove this then try again
      _untrimmed_elements.pop_front();
    }
  }
}

int Int_Iterable_Bitmap::size() {
  return _bitmap.size();
}

