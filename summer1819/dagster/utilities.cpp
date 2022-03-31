
#ifndef UTILITIES_CC
#define UTILITIES_CC

#include <ctime>
#include <unistd.h>
#include <sys/time.h>
#include <sys/times.h>
#include <stdlib.h>
#include "utilities.h"
#include "exceptions.h"
#include <limits.h>

int genRandomSeed() {
	struct timeval tv;
	struct timezone tzp;
	gettimeofday(&tv, &tzp);
	return ((( tv.tv_sec & 0x000007FF ) * 1000000) + tv.tv_usec);
}
int compareAbsInts(const void *a, const void *b) {
    int *va = (int *) a;
    int *vb = (int *) b;
    return ( abs(*va) - abs(*vb) );
}
bool compareAbs(int a, int b) {
    return ( abs(a) < abs(b) );
}
bool litInClause(int lit, int *inClauseArray, int inClauseLength) {
  for (int i = 0; i < inClauseLength; i++)
    if (inClauseArray[i] == lit)
      return true;
  return false;
}
bool isSubset(int *inClauseArray1, int inClauseLength1, int *inClauseArray2, int inClauseLength2) {
  for (int i = 0; i < inClauseLength1; i++) {
    bool found = litInClause(inClauseArray1[i],inClauseArray2,inClauseLength2);
    if (!found)
      return false;
  }
  return true;
}
bool isClauseOverlap(int *inClauseArray1, int inClauseLength1, int *inClauseArray2, int inClauseLength2) {
  for (int i = 0; i < inClauseLength1; i++) {
    bool found = litInClause(inClauseArray1[i],inClauseArray2,inClauseLength2);
    if (found)
      return true;
  }
  return false;
}

// take a series of sorted input vectors (by compareAbs), and resolve them together to be a result.
void resolve_sorted_vectors(vector<int> &result, vector<vector<int>> &inputs) {
	int input_size = inputs.size();
	vector<int> upto;
	upto.clear();
	upto.resize(input_size,0);
	result.clear();
	if (input_size == 0)
		return;
	int least = -1;
	int least_value = INT_MAX;
	int last_number_added = INT_MAX;
	while (true) {
		for (int i=0; i<input_size; i++) {
			if (upto[i]<inputs[i].size()) {
				if (compareAbs(inputs[i][upto[i]],least_value)) {
					least = i;
					least_value = inputs[i][upto[i]];
				}
			}
		}
		if (least!=-1) {
			if (least_value == -last_number_added)
				throw ConsistencyException(" trying to resolve together inconsistent messages\n");
			if (least_value != last_number_added) {
				result.push_back(least_value);
				last_number_added = least_value;
			}
			upto[least] += 1;
			least = -1;
			least_value = INT_MAX;
		} else
			break;
	}
}


#endif

