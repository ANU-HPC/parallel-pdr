echo Passed iff 8 lines of "FOUND A PLAN":
./run.sh ./tests/d1_sat.pddl ./tests/p1_sat.pddl ./premade_sets/set_single_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d1_sat.pddl ./tests/p1_sat.pddl ./premade_sets/set_single_decomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d1_sat.pddl ./tests/p1_sat.pddl ./premade_sets/set_dagster_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d1_sat.pddl ./tests/p1_sat.pddl ./premade_sets/set_dagster_decomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d4_sat.pddl ./tests/p4_sat.pddl ./premade_sets/set_single_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d4_sat.pddl ./tests/p4_sat.pddl ./premade_sets/set_single_decomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d4_sat.pddl ./tests/p4_sat.pddl ./premade_sets/set_dagster_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d4_sat.pddl ./tests/p4_sat.pddl ./premade_sets/set_dagster_decomposed 2>&1 | grep PLAN | grep -v REPORT

echo
echo Passed iff 10 lines of "NO PLAN EXISTS":
./run.sh ./tests/d2_unsat.pddl ./tests/p2_unsat.pddl ./premade_sets/set_single_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d2_unsat.pddl ./tests/p2_unsat.pddl ./premade_sets/set_single_decomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d2_unsat.pddl ./tests/p2_unsat.pddl ./premade_sets/set_dagster_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d2_unsat.pddl ./tests/p2_unsat.pddl ./premade_sets/set_dagster_decomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d3_unsat.pddl ./tests/p3_unsat.pddl ./premade_sets/set_single_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d3_unsat.pddl ./tests/p3_unsat.pddl ./premade_sets/set_dagster_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d5_unsat.pddl ./tests/p5_unsat.pddl ./premade_sets/set_single_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d5_unsat.pddl ./tests/p5_unsat.pddl ./premade_sets/set_single_decomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d5_unsat.pddl ./tests/p5_unsat.pddl ./premade_sets/set_dagster_nodecomposed 2>&1 | grep PLAN | grep -v REPORT
./run.sh ./tests/d5_unsat.pddl ./tests/p5_unsat.pddl ./premade_sets/set_dagster_decomposed 2>&1 | grep PLAN | grep -v REPORT
