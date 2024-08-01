#include "Stopwatch.h"

void Stopwatch::start() {
  if (!ENABLE) return;
  _last_stop = clock();
}

void Stopwatch::stop() {
  if (!ENABLE) return;
  _summation += clock() - _last_stop;
}

double Stopwatch::seconds() {
  if (!ENABLE) return 0;
  return _summation / ((double) CLOCKS_PER_SEC);
}

unordered_map<string, Stopwatch> Stopwatch::store;

void Stopwatch::print_store() {
  if (!ENABLE) {
    LOG << "stopwatch disabled" << endl;
    return;
  }

  for (auto it=store.begin(); it!=store.end(); it++) {
    LOG << it->first << " : " << it->second.seconds() << "s" << endl;
  }
}
