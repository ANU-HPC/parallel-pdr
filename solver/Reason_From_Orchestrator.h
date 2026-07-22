#ifndef REASON_FROM_ORCHESTRATOR_H
#define REASON_FROM_ORCHESTRATOR_H

#include <string>
#include <iostream>

#include "Contextless_Reason.h"
#include "Obligation.h"
#include "MPI_Interface.h"
#include "Utils.h"

using namespace std;

class Reason_From_Orchestrator {
  public:
    Reason_From_Orchestrator();
    Reason_From_Orchestrator(const Contextless_Reason& contextless_reason, const int add_from_layer);
    Reason_From_Orchestrator(int* data, int start, int stop);
    bool operator==(const Reason_From_Orchestrator& other) const;
    size_t hash() const;
    string to_string() const;
    Contextless_Reason contextless_reason() const;
    int add_from_layer() const;

    int* get_as_MPI_message() const;
    void get_as_MPI_message(int* data, int start) const;
    int MPI_message_size() const;
    int MPI_message_tag() const;
  private:
    Contextless_Reason _contextless_reason;
    int _add_from_layer;
};

struct Reason_From_Orchestrator_Hash {
  std::size_t operator () (Reason_From_Orchestrator const &reason) const
  {
    return reason.hash();
  }
};

#endif

