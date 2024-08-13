#ifndef INT_ITERABLE_BITMAP_MAP_H
#define INT_ITERABLE_BITMAP_MAP_H

#include "Int_Iterable_Bitmap.h"
#include "Log.h"

using namespace std;

template <typename T> class Int_Iterable_Bitmap_Map {
  public:
    ~Int_Iterable_Bitmap_Map();
    void clear();
    void set(int key, T* value);
    T* get(int key);
    void erase(int key);
    void make_iterable();
    int iterate_index_get(int index); // gives keys
    int size();
    bool contains(int key);
  private:
    unordered_map<int, T*> _base;
    vector<int> _iterate_keys;



    //Int_Iterable_Bitmap _bitmap;
    //vector<T*> _map;
};

/*
template <typename T> Int_Iterable_Bitmap_Map<T>::~Int_Iterable_Bitmap_Map() {
  make_iterable();
  for (int i=0; i<size(); i++) {
    int key = iterate_index_get(i);
    delete get(key);
  }
}

template <typename T> void Int_Iterable_Bitmap_Map<T>::clear() {
  make_iterable();
  for (int i=0; i<size(); i++) {
    int key = iterate_index_get(i);
    delete get(key);
  }
  _bitmap.clear();
}

template <typename T> void Int_Iterable_Bitmap_Map<T>::set(int key, T* value) {
  if (key>=_map.size()) _map.resize(_map.size()+1000);

  if (value == NULL) {
    LOG << "WARNING, setting null" << endl;
  }

  _map[key] = value;
}

template <typename T> T* Int_Iterable_Bitmap_Map<T>::get(int key) {
  if (!_bitmap.contains(key)) {
    set(key, new T);
  }
  return _map[key];
}

template <typename T> void Int_Iterable_Bitmap_Map<T>::erase(int key) {
  delete _map[key];
  _bitmap.erase(key);
}

template <typename T> void Int_Iterable_Bitmap_Map<T>::make_iterable() {
  _bitmap.make_iterable();
}

// gives key
template <typename T> int Int_Iterable_Bitmap_Map<T>::iterate_index_get(int index) {
  return _bitmap.iterate_index_get(index);
}

template <typename T> int Int_Iterable_Bitmap_Map<T>::size() {
  return _bitmap.size();
}

template <typename T> bool Int_Iterable_Bitmap_Map<T>::contains(int key) {
  return _bitmap.contains(key);
}

*/







template <typename T> Int_Iterable_Bitmap_Map<T>::~Int_Iterable_Bitmap_Map() {
  cout << "ERROR, BROKEN " << endl;
}

template <typename T> void Int_Iterable_Bitmap_Map<T>::clear() {
  _base.clear();
  _iterate_keys.clear();
}

template <typename T> void Int_Iterable_Bitmap_Map<T>::set(int key, T* value) {
  if (value == NULL) exit(4);
  _base[key] = value;
}

template <typename T> T* Int_Iterable_Bitmap_Map<T>::get(int key) {
  if (_base[key] == NULL) {
    _base[key] = new T;
  }

  return _base[key];
}

template <typename T> void Int_Iterable_Bitmap_Map<T>::erase(int key) {
  _base.erase(key);
}

template <typename T> void Int_Iterable_Bitmap_Map<T>::make_iterable() {
  _iterate_keys.clear();
  for (auto pair : _base) {
    _iterate_keys.push_back(pair.first);
  }
}

// gives key
template <typename T> int Int_Iterable_Bitmap_Map<T>::iterate_index_get(int index) {
  assert(_iterate_keys.size() == _base.size());
  return _iterate_keys[index];
}

template <typename T> int Int_Iterable_Bitmap_Map<T>::size() {
  return _base.size();
}

template <typename T> bool Int_Iterable_Bitmap_Map<T>::contains(int key) {
  return _base.find(key) != _base.end();
}

#endif
