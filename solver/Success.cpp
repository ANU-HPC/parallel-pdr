#include "Success.h"
#include "Compressed_Actions.h"
#include "MPI_Interface.h"

Success::Success() { }

Success::Success(Obligation original_obligation, Compressed_Actions actions, Obligation successor_obligation) {
  _original_obligation = original_obligation;
  _actions = actions;
  _successor_obligation = successor_obligation;
}

string Success::to_string() const {
  return "{Success, original: " + _original_obligation.to_string() + " actions: " + _actions.to_string() + " successor: " + _successor_obligation.to_string() + "}";
}

Obligation Success::original_obligation() const {
  return _original_obligation;
}

Compressed_Actions Success::actions() const {
  return _actions;
}

Obligation Success::successor_obligation() const {
  return _successor_obligation;
}

Success::Success(int* data, int start, int stop) {
  const int a = data[start];
  const int b = data[start+1];
  const int c = data[start+2];

  const int stop_a = start+3+a;
  const int stop_b = start+3+a+b;
  const int stop_c = start+3+a+b+c;

  _original_obligation = Obligation(data, start+3, stop_a);

  _actions = Compressed_Actions(data, stop_a, stop_b);
  _successor_obligation = Obligation(data, stop_b, stop_c);
}

int* Success::get_as_MPI_message() const {
  int* data = new int[MPI_message_size()];

  const int a = _original_obligation.MPI_message_size();
  const int b = _actions.MPI_message_size();
  const int c = _successor_obligation.MPI_message_size();

  const int start_a = 3;
  const int start_b = 3+a;
  const int start_c = 3+a+b;

  data[0] = a;
  data[1] = b;
  data[2] = c;

  _original_obligation.get_as_MPI_message(data, start_a);
  _actions.get_as_MPI_message(data, start_b);
  _successor_obligation.get_as_MPI_message(data, start_c);

  return data;
}

int Success::MPI_message_size() const {
  const int a = _original_obligation.MPI_message_size();
  const int b = _actions.MPI_message_size();
  const int c = _successor_obligation.MPI_message_size();

  return 3+a+b+c;
}

int Success::MPI_message_tag() const {
  return MPI_Interface::MESSAGE_TAG_SUCCESS;
}
