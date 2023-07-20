#ifndef STRATEGIES_H
#define STRATEGIES_H

using namespace std;

// every strategy has:
// a single worker interface
// reason or reasons
// queue or queues
// plan builder or plan builders??
// it gets messy so just let them each do it themself

class Strategies {
  public:
    static bool run_default();
};

#endif
