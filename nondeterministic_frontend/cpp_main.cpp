
#include <stdlib.h> 
#include <string>
#include <sstream>
#include <cstdlib>
#include <iterator>
#include <iomanip>
#include <string>
#include <sstream>
#include <iostream>

extern "C" {
  #include "main.h"
}

using namespace std;

int main(int argc, char** argv) {
  cout << "CPP main" << endl;
  frontend_entry(argc, argv);
  return 0;
}
