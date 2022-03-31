#ifndef RIM_HH
#define RIM_HH

// an easy lookup list of integers. map stores sequential list of positive integers upto a specified number
// and reverse_map stores the position on the list that any specific integer occurs on.
class ReversableIntegerMap {
private:
  int size;
public:
  unsigned int* map;
  unsigned int* reverse_map;
  unsigned int map_size;

  ReversableIntegerMap(unsigned int size);
  ReversableIntegerMap(unsigned int* map, int map_size);
  ReversableIntegerMap(ReversableIntegerMap *m);
  ~ReversableIntegerMap();

  void append(unsigned int c);
  void remove(unsigned int c);
  void resize(unsigned int new_size);
  void increase_size(unsigned int additional_size);
  inline int get_forward_map(int v);
  inline int get_reverse_map(int v);
  void reset();

  void print();
};

#endif
