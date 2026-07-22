#include "Stats.h"

// wrap each function in the compile time variable because this could get expensive

void Stats::count(string name) {
#if USE_STATS
  count(name, 1);
#endif
}

void Stats::count(string name, int amount) {
#if USE_STATS
  _counts[name] += amount;
#endif
}

void Stats::print() {
#if USE_STATS
  LOG << " === counts ===" << endl;

  for (auto it=_counts.begin(); it!=_counts.end(); it++) {
    const string name = it->first; 
    const int count = it->second;
    LOG << name << "  \t" << count << endl;
  }
  LOG << " === end stats ===" << endl;
  LOG << endl;
#endif
}
