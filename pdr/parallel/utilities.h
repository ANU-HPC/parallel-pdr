
#ifndef UTILITIES_HH
#define UTILITIES_HH

#include <iostream>
#include <iterator>
#include <deque>
#include <set>
#include <vector>

#include <ctime>
#include <unistd.h>
#include <sys/time.h>
#include <sys/times.h>

using namespace std;

int genRandomSeed();
int compareAbsInts(const void *a, const void *b);
bool compareAbs(int a, int b);
bool isSubset(int *, int, int *, int);
bool litInClause(int, int *, int);
bool isClauseOverlap(int *inClauseArray1, int inClauseLength1, int *inClauseArray2, int inClauseLength2);
void resolve_sorted_vectors(vector<int> &result, vector<vector<int>> &inputs);

template<typename T>
std::ostream& operator<<(std::ostream& strm, const std::set<T> &v) {
  strm<<"{ ";
  std::copy(v.begin(), v.end(), std::ostream_iterator<int>(strm, " "));
  strm<<"} ";
  return strm;
}

template <typename T>
std::ostream &operator<<(std::ostream &strm, const std::vector<T> &v) {
  std::copy(v.begin(), v.end(), std::ostream_iterator<int>(strm, " "));
  return strm;
}

template <typename T>
std::ostream &operator<<(std::ostream &strm, const std::deque<T> &v) {
  std::copy(v.begin(), v.end(), std::ostream_iterator<int>(strm, " "));
  return strm;
}

#define STR(s) #s
#define XSTR(s) STR(s)

#define FLIP(A,B) { \
  auto temp = B; \
  B = A; \
  A = temp; \
} \

#endif

