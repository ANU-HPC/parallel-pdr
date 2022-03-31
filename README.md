# Dagparser

A tool to solve PDDL problems using variations of PDR. Can perform PS-PDR, PD-PDR, PDR-P and a serial PDR baseline.

Uses the tool Madagascar for parsing available from: https://users.aalto.fi/~rintanj1/software.html
Uses the tool dagster from https://github.com/ANU-HPC/dagster

# Setup
MPI, GLOG, and CUDD are required. These can all be installed by the script at summer1819/nodocker.sh

Once cloned run:

./setup.sh && make

# Running
An example invocation script can be found at examples.sh
PS-PSR can be benchmarked by running pspdr_benchmarks.sh, this script can be modified to benchmark other solvers, as explained below.
The -r option determines if a plan is generated. This needs to be set to "1" when using PD-PDR for correctness.

## PDR-P
To run PDR-P, change pdr/main.cpp line 54 from:

    #define PORTFOLIO_QUEUE 0

to:

    #define PORTFOLIO_QUEUE 1

Then run:

    make pdr

To run PDR-P with N>1 processes (1 orchestrator and N-1 workers, each corresponding to a simulated parallel PDR process), replace N in:

    time ./run.sh -d 0 -r 1 -p 1 -n N ./benchmarks/non-unsolve/rovers/domain.pddl ./benchmarks/non-unsolve/rovers/p04.pddl set_no_decomposition

To swap to a different solver, revert the changes to pdr/main.cpp, then re-run:

    make pdr

## PS-PDR

To run PS-PDR with N>1 processes (1 orchestrator and N-1 workers), replace N in:

    time ./run.sh -d 0 -r 1 -p 1 -n N ./benchmarks/non-unsolve/rovers/domain.pddl ./benchmarks/non-unsolve/rovers/p24.pddl set_no_decomposition

## PD-PDR

    time ./run.sh -d 1 -r 1 -p 0 -n 0 ./benchmarks/non-unsolve/rovers/domain.pddl ./benchmarks/non-unsolve/rovers/p24.pddl set_decomposition

## Serial PDR

    time ./run.sh -d 0 -r 1 -p 0 -n 0 ./benchmarks/non-unsolve/rovers/domain.pddl ./benchmarks/non-unsolve/rovers/p24.pddl set_no_decomposition

# Author

Marshall Clifton marshall.clifton@anu.edu.au
