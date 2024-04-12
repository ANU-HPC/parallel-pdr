#ifndef LOG_H
#define LOG_H

#include <mpi.h>
#include <string>
#include <iomanip>
#include <sstream>
#include <ctime>

using namespace std;

class Log {
  public:
    static string RANK_TEXT();
    static string TIME_TEXT();
    static string COLOUR_START(string filename);
    static string COLOUR_END();
    static void inform_mpi_finalized();
    static void inform_colours_active(bool active);
  private:
    static bool _colours_active;
    static bool _mpi_finalized;
    static int MPI_RANK();
};

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

//#define LOG cout << Log::COLOUR_START(__FILE__) << Log::TIME_TEXT() << " :: " << Log::RANK_TEXT() << "FILE (" << __FILE__ << ":" << __LINE__ << ") :: FUNCTION (" << __FUNCTION__ << ") :: " << Log::COLOUR_END()
#define LOG cout << Log::COLOUR_START(__FILE__) << Log::TIME_TEXT() << " :: " << Log::RANK_TEXT() << __FILE__ << ":" << __LINE__ << " :: " << __FUNCTION__ << " :: " << Log::COLOUR_END()

#endif
