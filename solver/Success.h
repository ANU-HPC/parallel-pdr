#include "Obligation.h"
#include "Compressed_Actions.h"

using namespace std;

class Success {
  public:
    Success(Obligation original_obligation, Compressed_Actions actions, Obligation successor_obligation);
    Success(int* data, int size);
    Obligation original_obligation();
    Compressed_Actions action();
    Obligation successor_obligation();
    int* get_as_MPI_message();
    bool is_type_of_MPI_message(int* data);
  private:
    Obligation _original_obligation;
    Compressed_Actions _action;
    Obligation _successor_obligation;
}

