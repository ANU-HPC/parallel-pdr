echo SHOULD ALL BE SAT 8:
#diagnosis good
./run.sh ./tests/d1_sat.pddl ./tests/p1_sat.pddl ./tests/set_single_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d1_sat.pddl ./tests/p1_sat.pddl ./tests/set_single_decomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d1_sat.pddl ./tests/p1_sat.pddl ./tests/set_dagster_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d1_sat.pddl ./tests/p1_sat.pddl ./tests/set_dagster_decomposed 2>&1 | grep PLAN | grep -v REPORT

# pegsol
./run.sh ./tests/d4_sat.pddl ./tests/p4_sat.pddl ./tests/set_single_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d4_sat.pddl ./tests/p4_sat.pddl ./tests/set_single_decomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d4_sat.pddl ./tests/p4_sat.pddl ./tests/set_dagster_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d4_sat.pddl ./tests/p4_sat.pddl ./tests/set_dagster_decomposed 2>&1 | grep PLAN | grep -v REPORT

# over-rovers (hard)
#./run.sh  ./tests/d6_sat.pddl ./tests/p6_sat.pddl ../set 2>&1 | grep PLAN
#./run.sh  ./tests/d6_sat.pddl ./tests/p6_sat.pddl ../set 2>&1 | grep PLAN
#./run.sh  ./tests/d6_sat.pddl ./tests/p6_sat.pddl ../set 2>&1 | grep PLAN
#./run.sh  ./tests/d6_sat.pddl ./tests/p6_sat.pddl ../set 2>&1 | grep PLAN

echo
echo SHOULD ALL BE UNSAT 8:
#diagnosis
./run.sh ./tests/d2_unsat.pddl ./tests/p2_unsat.pddl ./tests/set_single_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d2_unsat.pddl ./tests/p2_unsat.pddl ./tests/set_single_decomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d2_unsat.pddl ./tests/p2_unsat.pddl ./tests/set_dagster_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d2_unsat.pddl ./tests/p2_unsat.pddl ./tests/set_dagster_decomposed 2>&1 | grep PLAN | grep -v REPORT

#pegsol
./run.sh ./tests/d3_unsat.pddl ./tests/p3_unsat.pddl ./tests/set_single_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d3_unsat.pddl ./tests/p3_unsat.pddl ./tests/set_dagster_nodecomposed 2>&1 | grep PLAN | grep -v REPORT

./run.sh ./tests/d5_unsat.pddl ./tests/p5_unsat.pddl ./tests/set_single_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d5_unsat.pddl ./tests/p5_unsat.pddl ./tests/set_dagster_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
