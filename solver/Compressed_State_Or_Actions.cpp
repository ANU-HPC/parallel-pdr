#import "Compressed_State_Or_Actions.h"

Compressed_State_Or_Actions::Compressed_State_Or_Actions() {}

Compressed_State_Or_Actions::Compressed_State_Or_Actions(const vector<int>& state_or_actions, const int subproblem) {
  for (auto it=state_or_actions.begin(); it!=state_or_actions.end(); it++) {
    if ((*it)>0) _raw.push_back(*it);
  }
  _subproblem = subproblem;
}

Compressed_State_Or_Actions::Compressed_State_Or_Actions(int* data, int start, int stop) {
  _subproblem = data[start];
  
  for (int i=start+1; i<stop; i++) {
    _raw.push_back(data[i]);
  }
}

void Compressed_State_Or_Actions::get_as_MPI_message(int* data, int start) {
  data[start] = _subproblem;

  for (int i=0; i<_raw.size(); i++) {
    data[start+1+i] = _raw[i];
  }
}

int Compressed_State_Or_Actions::MPI_message_size() {
  return 1 + _raw.size();
}
