#ifndef STOPWATCH_H
#define STOPWATCH_H

#include <iostream>
#include <cstdio>
#include <ctime>
#include <unordered_map>
#include "Log.h"

#define ENABLE true

using namespace std;

class Stopwatch {
  public:
    void start();
    void stop();
    double seconds();
    static unordered_map<string, Stopwatch> store;
    static void print_store();
  private:
    clock_t _summation;
    clock_t _last_stop;
};

#endif
