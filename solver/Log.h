#ifndef LOG_H
#define LOG_H

#include <mpi.h>

using namespace std;

int MPI_RANK();
string RANK_TEXT();

/*
#define LOG_LEVEL 3

#define LOG(LEVEL) cout << "LOG_" << #LEVEL << RANK_TEXT() << " :: FILE (" << __FILE__ << ":" << __LINE__ << ") :: FUNCTION (" << __FUNCTION__ << ") :: "

#if LOG_LEVEL >= 5
#define LOG_5 LOG(5)
#else
#define LOG_5 \\/\\/
#endif

#if LOG_LEVEL >= 4
#define LOG_4 LOG(4)
#else
#define LOG_4 \/\/
#endif

#if LOG_LEVEL >= 3
#define LOG_3 LOG(3)
#else
#define LOG_3 \/\/
#endif

#if LOG_LEVEL >= 2
#define LOG_2 LOG(2)
#else
#define LOG_2 \/\/
#endif

#if LOG_LEVEL >= 1
#define LOG_1 LOG(1)
#else
#define LOG_1 \/\/
#endif
*/

#define LOG cout << RANK_TEXT() << "FILE (" << __FILE__ << ":" << __LINE__ << ") :: FUNCTION (" << __FUNCTION__ << ") :: "

#endif
