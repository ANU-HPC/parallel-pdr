#ifndef REASON_FROM_WORKER_H
#define REASON_FROM_WORKER_H

#include <string>
#include <iostream>

#include "Contextless_Reason.h"
#include "Obligation.h"
#include "MPI_Interface.h"
#include "Utils.h"

using namespace std;

class Reason_From_Worker {
  public:
    Reason_From_Worker();
    Reason_From_Worker(const Contextless_Reason& contextless_reason, const Obligation& originating_obligation);
    Reason_From_Worker(int* data, int start, int stop);
    bool operator==(const Reason_From_Worker& other) const;
    size_t hash() const;
    string to_string() const;
    Contextless_Reason contextless_reason() const;
    Obligation originating_obligation() const;

    int* get_as_MPI_message() const;
    void get_as_MPI_message(int* data, int start) const;
    int MPI_message_size() const;
    int MPI_message_tag() const;
  private:
    Contextless_Reason _contextless_reason;
    Obligation _originating_obligation;
};

struct Reason_From_Worker_Hash {
  std::size_t operator () (Reason_From_Worker const &reason) const
  {
    return reason.hash();
  }
};

#endif
