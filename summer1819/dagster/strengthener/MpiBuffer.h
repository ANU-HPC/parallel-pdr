#ifndef REDUCER_MPI_BUFFER_H_
#define REDUCER_MPI_BUFFER_H_
#include <algorithm>
#include <cassert>
#include <iterator>
#include <stdlib.h>
#include <unistd.h>
#include <vector>

#include <mpi.h>

const int MAX_BUFFER_SIZE = 1024;

/** 
 * The actual values in buffers are padded by 3, to fit:
 * - phase
 * - litPool 
 * - litPoolPos
 */
const int PADDING = 3;

struct ClauseWithPos {
  std::vector<int> clause;
  int litPool = -1;
  int litPoolPos = -1;
};

class MpiBuffer {
public:
  ~MpiBuffer();
  MpiBuffer(MPI_Comm *communicator, int phase, int partnerRank, int inwardClauseTag, int outwardClauseTag);

  bool readyToSend();

  ClauseWithPos *getClause();
  void pushClause(int *, int);
  void pushClauseNoAutoSend(int *, int);
  void tryMpiSend();

  int getRemainingOutSpace();
  bool getWillThisClauseEverFit(int);

  void printClause(int *, int);
  void printBuffer(int *, int);

protected:
  // for debugging
  char *version;
  int print;

  MPI_Comm *communicator;

  const int CONST_ONE = 1;
  const int litPoolStorageOffset = 1000000; // as litPool and litPoolPos indicies can be 0, offset them so they are not (0 is used as a seperator)

  int sizeIn;
  int sizeOut;

  int numProcesses; // MPI num processes count set in constructor

  int partnerRank;
  int inwardClauseTag;
  int outwardClauseTag;

  MPI_Request inwardClauseRequests[2];
  MPI_Request outwardClauseRequests[2];

  /**
   * A separate MPIBuffer is used for each phase of communication.
   * Any data from a previous phase is automatically discarded.
   */
  int phase;

  int bufferIn;
  int bufferOut;

  int buffersOutNextData[2];
  bool buffersOutCycledData[2];

  /** Allocated memory for all buffers, both in and out */
  int *buffer;

  int *buffersIn[2];
  int *buffersOut[2];

  bool testAndSwitchBufferIn();
  bool testAndSwitchBufferOut();

  int buffersInNext();
  int buffersInEnd();
  int buffersOutNext();
  bool buffersOutCycled();

  void sendBufferOut();
  void clearBufferOut();

  int getClauseLength(int *);
  void increaseBuffersInNext(int);
  void increaseBuffersOutNext(int);
  //int mpiRequestComplete(MPI_Request* );
};

#endif // REDUCER_MPI_BUFFER_H_
