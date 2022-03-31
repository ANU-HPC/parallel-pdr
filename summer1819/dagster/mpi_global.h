#ifndef __MPI_GLOBAL_H
#define __MPI_GLOBAL_H

#define PREFIX_TAG 2
#define COMPLETE_TAG 4
#define SLS_SOLUTION_TAG 5
#define CNF_FILENAME_LENGTH_TAG 99
#define CNF_FILENAME_TAG 100
#define TINISAT_ONLY 1

#include<mpi.h>


#define MPI_TAG_NEW_CLAUSES 82115
#define MPI_TAG_DONE_ADDING 34453

#define MPI_TAG_SOLUTION 1
#define MPI_TAG_NEW_ASSIGNMENT 4
#define MPI_TAG_REQUEST_FOR_ASSIGNMENT 5
#define MPI_TAG_ADDITIONAL_CLAUSES 6
#define MPI_TAG_KILL 9
#define MPI_TAG_POLL_FOR_REASSIGNMENT 10
#define MPI_TAG_CNF_SEND 11
#define MPI_TAG_DAG_SEND 12

#define TINISAT_RANK 0
#define REDUCER_RANK 1
#define TINISAT_TO_REDUCER_CLAUSE_TAG 0
#define REDUCER_TO_TINISAT_CLAUSE_TAG 1
#define TINISAT_TO_REDUCER_ASK_TAG 2
#define REDUCER_TO_TINISAT_ASK_TAG 3

#include <iostream>

#define BOMB(ERROR) { \
  int rank;								\
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);				\
  std::cerr<<"UNRECOVERABLE ERROR OCCURRED :: RANK ("<<rank		\
  <<") :: LINE ("<<__LINE__						\
  <<") :: FUNCTION ("<<__FUNCTION__<<") :: WHERE ("<< #ERROR <<") \n";				\
  MPI_Abort(MPI_COMM_WORLD,1);							\
  exit(1);							\
} \

#define BOMB_NO_MPI(ERROR) { \
  std::cerr<<"UNRECOVERABLE ERROR OCCURRED :: LINE ("<<__LINE__						\
  <<") :: FUNCTION ("<<__FUNCTION__<<") :: WHERE ("<< #ERROR <<") \n";				\
  exit(1);							\
} \

#define TEST_NOT_NULL(ERROR) {	\
  if (0 == (ERROR)) {							\
    int flag; \
    MPI_Initialized(&flag); \
    if (flag==1) \
      BOMB(ERROR) \
    else \
      BOMB_NO_MPI(ERROR) \
  }									\
}									\


#endif
