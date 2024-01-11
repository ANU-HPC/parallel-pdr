#include "Compressed_Actions.h"

Compressed_Actions::Compressed_Actions() { }

Compressed_Actions::Compressed_Actions(const vector<int>& actions, int subproblem) {
  for (auto it=actions.begin(); it!=actions.end(); it++) {
    if ((*it)>0) _raw.push_back(*it);
  }
  _subproblem = subproblem;
}

Compressed_Actions::Compressed_Actions(int* data, int start, int stop) {
  _subproblem = data[start];
  
  for (int i=start+1; i<stop; i++) {
    _raw.push_back(data[i]);
  }
}

string Compressed_Actions::to_string() const {
  return Utils::to_symbols_string(_raw);
}

vector<int> Compressed_Actions::get_actions() const {
  return _raw;
  //return Utils::inflate_only_true_to_all(_raw, Global::problem.subproblem_to_propositions[_subproblem]);
}

void Compressed_Actions::get_as_MPI_message(int* data, int start) const {
  data[start] = _subproblem;

  for (int i=0; i<_raw.size(); i++) {
    data[start+1+i] = _raw[i];
  }
}

int Compressed_Actions::MPI_message_size() const {
  return 1 + _raw.size();
}

vector<Compressed_Actions> Compressed_Actions::vector_compressed_actions(int* data, int start, int stop) {
  vector<Compressed_Actions> ret_val;
  const int num_compressed_actions = data[start];
  int read_from = start+1;
  for (int i=0; i<num_compressed_actions; i++) {
    const int mpi_size = data[read_from];
    ret_val.push_back(Compressed_Actions(data, read_from+1, read_from+1+mpi_size));
    read_from += 1 + mpi_size;
  }
  return ret_val;
}

void Compressed_Actions::vector_get_as_MPI_message(vector<Compressed_Actions> compressed_actions, int* data, int start) {
  data[start] = compressed_actions.size();
  int write_from = start+1;
  for (auto it=compressed_actions.begin(); it!=compressed_actions.end(); it++) {
    const int mpi_size = it->MPI_message_size();
    data[write_from] = mpi_size;
    it->get_as_MPI_message(data, write_from+1);
    write_from += 1 + mpi_size;
  }
}

int Compressed_Actions::vector_MPI_message_size(vector<Compressed_Actions> compressed_actions) {
  int size = 1;
  for (auto it=compressed_actions.begin(); it!=compressed_actions.end(); it++) {
    size += it->MPI_message_size() + 1; 
  }
  return size;
}
