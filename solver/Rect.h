#ifndef RECT_H
#define RECT_H

#include "Shape.h"

class Rect : public Shape {
  public:
    Rect();
    int get_side_length();
  private:
    int _side_length = 4;
};

#endif
