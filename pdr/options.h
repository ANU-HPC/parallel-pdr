// A header file just for some #define set options
#ifndef OPTIONS_H
#define OPTIONS_H

#include "constants.h"

// The FD options are only for experimenting with heuristics - the implementation is very slow
#define FD_HEURISTIC "hmax"
#define USE_FD_HEURISTIC 0
// "MAX_SOLVER_STEPS" is the number of steps (cnf) that is loaded
#define MAX_SOLVER_STEPS 1
#define MS_DEFAULT_STEPS_USED 1
// Only have the max number of solver steps - eg if set max to 4, only have 4, not 1,2,3,4
#define MS_ONLY_MAX_SOLVER_STEP 1
#define MULTI_STEP_REASON_CALCULATE_AT_ALL 0
#define MULTI_STEP_REASON_ACTUALLY_USE 0
#define MULTI_STEP_INTERLEAVED 0
#define PORTFOLIO_QUEUE 0
#define ALLOW_HEURISTIC_H_ADD 0
#define ALLOW_HEURISTIC_NOVELTY 0
#define ALLOW_HEURISTIC_RANDOM 0
// Specify an order, duplicates are allowed to increase frequency
#define HEURISTICS_TO_USE HEURISTIC_NONE
// WINNER! #define HEURISTICS_TO_USE HEURISTIC_NONE, HEURISTIC_H_ADD, HEURISTIC_NONE, HEURISTIC_H_ADD, HEURISTIC_NOVELTY, HEURISTIC_NONE, HEURISTIC_H_ADD, HEURISTIC_NONE, HEURISTIC_H_ADD, HEURISTIC_NOVELTY, HEURISTIC_RANDOM
#endif
