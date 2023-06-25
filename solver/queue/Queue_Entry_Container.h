#ifndef COAT_CHECK_H
#define COAT_CHECK_H

#include <iostream>
#include <vector>
#include <cstdlib>
#include <string>
#include <stdexcept>

#include "Queue_Entry.h"

using namespace std;

class Queue_Entry_Container {
  public:
    int insert(Queue_Entry element);
    int next_slot();
    Queue_Entry retrieve(int slot);
    Queue_Entry* peek(int slot);
    int size();
  private:
    int _size = 0;
    vector<Queue_Entry> _elements;
    vector<int> _pool = vector<int>();
    int _largest_never_assigned = 0;
};

#endif
