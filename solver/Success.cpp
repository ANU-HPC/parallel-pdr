#include "Success.h"
#include "Compressed_Actions.h"
#include "MPI_Interface.h"

Success::Success() { }

Success::Success(Obligation original_obligation, vector<Compressed_Actions> actions, vector<Obligation> successor_obligations) {
  _original_obligation = original_obligation;
  _actions = actions;
  _successor_obligations = successor_obligations;
}

string Success::to_short_string() const {
  string actions_string = "[";
  for (auto it=_actions.begin(); it!=_actions.end(); it++) {
    actions_string += "[" + Utils::to_string(it->get_actions()) + "]";
  }
  actions_string += "]";

  string successors_string = "[";
  for (auto it=_successor_obligations.begin(); it!=_successor_obligations.end(); it++) {
    successors_string += it->to_short_string();
  }
  successors_string += "[";

  return "{SUCCESS ORIGINAL: " + _original_obligation.to_short_string()
    + " ACTIONS: " + actions_string
    + " SUCCESSORS: " + successors_string + "}";
}

string Success::to_string() const {
  string ret_val = "{Success, original: " + _original_obligation.to_string() + " actions: (" + std::to_string(_actions.size()) + ") ";
  
  for (auto it=_actions.begin(); it!=_actions.end(); it++) {
    ret_val += it->to_string() + ", "; 
  }

  ret_val += "successors: (" + std::to_string(_successor_obligations.size()) + ") ";

  for (auto it=_successor_obligations.begin(); it!=_successor_obligations.end(); it++) {
    ret_val += it->to_string() + ", "; 
  }
  ret_val += "}";
  return ret_val;
}

Obligation Success::original_obligation() const {
  return _original_obligation;
}

vector<Compressed_Actions> Success::actions() const {
  return _actions;
}

vector<Obligation> Success::successor_obligations() const {
  return _successor_obligations;
}

Success::Success(int* data, int start, int stop) {
  const int a = data[start];
  const int b = data[start+1];
  const int c = data[start+2];

  const int stop_a = start+3+a;
  const int stop_b = start+3+a+b;
  const int stop_c = start+3+a+b+c;

  _original_obligation = Obligation(data, start+3, stop_a);

  _actions = Compressed_Actions::vector_compressed_actions(data, stop_a, stop_b);
  _successor_obligations = Obligation::vector_obligation(data, stop_b, stop_c);
}

bool Success::operator==(const Success& other) const {
  if (!(_original_obligation == other.original_obligation())) return false;

  if (_actions.size() != other.actions().size()) return false;

  if (_successor_obligations.size() != other.successor_obligations().size()) return false;

  const int forward = _successor_obligations.size();

  for (int i=0; i<forward; i++) {
    if (!(_successor_obligations[i] == other.successor_obligations()[i])) return false;
  }

  return true;
}

size_t Success::hash() const {
  return 0;
}


int* Success::get_as_MPI_message() const {
  int* data = new int[MPI_message_size()];

  const int a = _original_obligation.MPI_message_size();
  const int b = Compressed_Actions::vector_MPI_message_size(_actions);
  const int c = Obligation::vector_MPI_message_size(_successor_obligations);

  const int start_a = 3;
  const int start_b = 3+a;
  const int start_c = 3+a+b;

  data[0] = a;
  data[1] = b;
  data[2] = c;

  _original_obligation.get_as_MPI_message(data, start_a);
  Compressed_Actions::vector_get_as_MPI_message(_actions, data, start_b);
  Obligation::vector_get_as_MPI_message(_successor_obligations, data, start_c);

  return data;
}

int Success::MPI_message_size() const {
  const int a = _original_obligation.MPI_message_size();
  const int b = Compressed_Actions::vector_MPI_message_size(_actions);
  const int c = Obligation::vector_MPI_message_size(_successor_obligations);

  return 3+a+b+c;
}

int Success::MPI_message_tag() const {
  return MPI_Interface::MESSAGE_TAG_SUCCESS;
}
