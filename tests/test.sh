echo SHOULD ALL BE SAT:
#diagnosis good
./run.sh -d 0 -r 0 -p 0 -n 0 ./tests/d1_sat.pddl ./tests/p1_sat.pddl set 2>&1 | grep PLAN
./run.sh -d 0 -r 0 -p 1 -n 0 ./tests/d1_sat.pddl ./tests/p1_sat.pddl set 2>&1 | grep PLAN
./run.sh -d 1 -r 0 -p 0 -n 0 ./tests/d1_sat.pddl ./tests/p1_sat.pddl set 2>&1 | grep PLAN
./run.sh -d 1 -r 0 -p 1 -n 0 ./tests/d1_sat.pddl ./tests/p1_sat.pddl set 2>&1 | grep PLAN

# pegsol good
./run.sh -d 0 -r 0 -p 0 -n 0 ./tests/d4_sat.pddl ./tests/p4_sat.pddl set 2>&1 | grep PLAN
./run.sh -d 0 -r 0 -p 1 -n 0 ./tests/d4_sat.pddl ./tests/p4_sat.pddl set 2>&1 | grep PLAN
./run.sh -d 1 -r 0 -p 0 -n 0 ./tests/d4_sat.pddl ./tests/p4_sat.pddl set 2>&1 | grep PLAN
./run.sh -d 1 -r 0 -p 1 -n 0 ./tests/d4_sat.pddl ./tests/p4_sat.pddl set 2>&1 | grep PLAN

# over-rovers (hard)
#./run.sh -d 1 -r 0 -p 0 -n 0 ./tests/d6_sat.pddl ./tests/p6_sat.pddl ../set 2>&1 | grep PLAN
#./run.sh -d 1 -r 0 -p 1 -n 0 ./tests/d6_sat.pddl ./tests/p6_sat.pddl ../set 2>&1 | grep PLAN
#./run.sh -d 0 -r 0 -p 0 -n 0 ./tests/d6_sat.pddl ./tests/p6_sat.pddl ../set 2>&1 | grep PLAN
#./run.sh -d 0 -r 0 -p 1 -n 0 ./tests/d6_sat.pddl ./tests/p6_sat.pddl ../set 2>&1 | grep PLAN

echo
echo SHOULD ALL BE UNSAT:
#diagnosis
./run.sh -d 0 -r 0 -p 0 -n 0 ./tests/d2_unsat.pddl ./tests/p2_unsat.pddl set 2>&1 | grep PLAN
./run.sh -d 0 -r 0 -p 1 -n 0 ./tests/d2_unsat.pddl ./tests/p2_unsat.pddl set 2>&1 | grep PLAN
./run.sh -d 1 -r 0 -p 0 -n 0 ./tests/d2_unsat.pddl ./tests/p2_unsat.pddl set 2>&1 | grep PLAN
./run.sh -d 1 -r 0 -p 1 -n 0 ./tests/d2_unsat.pddl ./tests/p2_unsat.pddl set 2>&1 | grep PLAN

#pegsol good
./run.sh -d 0 -r 0 -p 0 -n 0 ./tests/d3_unsat.pddl ./tests/p3_unsat.pddl set 2>&1 | grep PLAN
./run.sh -d 0 -r 0 -p 1 -n 0 ./tests/d3_unsat.pddl ./tests/p3_unsat.pddl set 2>&1 | grep PLAN


./run.sh -d 0 -r 0 -p 0 -n 0 ./tests/d5_unsat.pddl ./tests/p5_unsat.pddl set 2>&1 | grep PLAN
./run.sh -d 0 -r 0 -p 1 -n 0 ./tests/d5_unsat.pddl ./tests/p5_unsat.pddl set 2>&1 | grep PLAN
./run.sh -d 1 -r 0 -p 0 -n 0 ./tests/d5_unsat.pddl ./tests/p5_unsat.pddl set 2>&1 | grep PLAN
./run.sh -d 1 -r 0 -p 1 -n 0 ./tests/d5_unsat.pddl ./tests/p5_unsat.pddl set 2>&1 | grep PLAN
