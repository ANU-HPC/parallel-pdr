#ifndef MPI_COMMUNICATABLE_H
#define MPI_COMMUNICATABLE_H

using namespace std;

class MPI_Communicatable {
  public:
    MPI_Communicatable();
    MPI_Communicatable(int* data, int start, int stop);
    int* get_as_MPI_message();
    virtual void get_as_MPI_message(int* data, int start);
    virtual int MPI_message_size();
    virtual int MPI_message_tag();
  private:
    virtual void constructor(int* data, int start, int stop); // can't be called virtual directly
};

#endif
