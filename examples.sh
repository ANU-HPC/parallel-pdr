# To perform PDR-P, follow the instructions in README.md
#echo Example PDR-P
#time ./run.sh -d 0 -r 1 -p 1 -n 6 ./benchmarks/non-unsolve/rovers/domain.pddl ./benchmarks/non-unsolve/rovers/p04.pddl set_no_decomposition

echo Example PS-PDR
time ./run.sh -d 0 -r 1 -p 1 -n 6 ./benchmarks/non-unsolve/rovers/domain.pddl ./benchmarks/non-unsolve/rovers/p26.pddl set_no_decomposition

echo Example PD-PDR
time ./run.sh -d 1 -r 1 -p 0 -n 0 ./benchmarks/non-unsolve/rovers/domain.pddl ./benchmarks/non-unsolve/rovers/p26.pddl set_decomposition

echo Example Serial PDR
time ./run.sh -d 1 -r 1 -p 0 -n 0 ./benchmarks/non-unsolve/rovers/domain.pddl ./benchmarks/non-unsolve/rovers/p26.pddl set_no_decomposition
