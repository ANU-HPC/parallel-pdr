#include "ID_Generator.h"

int ID_Generator::pop() {
  int ret_val;
  if (pool.empty()) {
    ret_val = largest_never_assigned;
    largest_never_assigned++;
  } else {
    ret_val = *pool.rbegin();
    pool.pop_back();
  }
  return ret_val;
}

void ID_Generator::push(int id) {
  pool.push_back(id);
}
