#ifndef MESSAGE_H_
#define MESSAGE_H_

#include "Cnf.h"

#include <iostream>
#include <iterator>
#include <vector>
#include <deque>
#include "utilities.h"

class Message {
public:
  std::vector<int> assignments; // a list of literal assignments for the message
  int to;                                     // the node destination of the message
  int from;                                   // the node origin of the message
  int id;
  int reduce;
  Cnf* additional_clauses;	// a Cnf structure (which may be NULL) holding any additional clauses
  Message(int new_to, int new_from);
  Message(Message *m);
  Message();
  Message(int* data);
  ~Message();

  int get_dehydrated_size();
  int dehydrate(int *data);      // turn the message into a newly created series of ints
  void print();            // output message contents to shell
  void set(Message *m);    // set this message to duplicate provided message
  void set_additional_clauses(int** clauses);

  void purge_variables(RangeSet &r);
private:
  int hydrate(int* data); // turn a series of ints into a coherent message
};

std::ostream &operator<<(std::ostream &strm, const Message &msg);

#endif // MESSAGE_H_


