#include "Int_Iterable_Bitmap.h"

void Int_Iterable_Bitmap::insert(int element) {
  if (!_bitmap.contains(element)) {
    _bitmap.insert(element);
    _untrimmed_elements.push_back(element);
  }
}

void Int_Iterable_Bitmap::erase(int element) {
  _bitmap.erase(element);
  // an example of how _untrimmed_elements gets out of sync
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

void Int_Iterable_Bitmap::clear() {
  _bitmap.clear();
  _untrimmed_elements.clear();
}

void Int_Iterable_Bitmap::make_iterable() {
  // first clean up the _untrimmed_elements if needed
  if (_untrimmed_elements.size() != _bitmap.size()) {
    // go through them all removing duplicates, and removing those which refer to elements that have themself been removed
    Int_Bitmap seen;
    deque<int> trimmed_elements;
    for (int element : _untrimmed_elements) {
      if ((!seen.contains(element)) & (_bitmap.contains(element))) {
        trimmed_elements.push_back(element);
        seen.insert(element);
      }
    }
    _untrimmed_elements = trimmed_elements;
    assert(_untrimmed_elements.size() == _bitmap.size());
  }
}

int Int_Iterable_Bitmap::iterate_index_get(int index) {
  assert(_bitmap.size() == _untrimmed_elements.size());
  return _untrimmed_elements[index];
}

void Int_Iterable_Bitmap::print() {
  _bitmap.print();
  LOG << Utils::to_string(_untrimmed_elements) << endl;
}
