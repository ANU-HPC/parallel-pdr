#ifndef STATS_H
#define STATS_H

#define USE_STATS 1

#include <string>
#include <map>

#include "Log.h"
#include "MPI_Interface.h"

using namespace std;

class Stats {
  public:
    void count(string name);
    void count(string name, int amount);
    void print();
  private:
    map<string, int> _counts;
    MPI_Interface _mpi_interface;
};

#endif
