#HPCRUN_EVENT_LIST=CPUTIME@0.1
#!/bin/sh
cd `dirname "$0"` # moves to the directory in which this script is held (root of parallel-pdr)

START_TIME=`date +%s`

# To make MPI behave correctly
export OMPI_MCA_btl=self,tcp

red_text() { tput setaf 1; cat; tput sgr0; }
green_text() { tput setaf 2; cat; tput sgr0; }

DOMAIN=$1
PROBLEM=$2
SET=$3

# Change this value to pretend the isolate subproblem method is being performed on a computer with as many cores as wanted. The simulated runtime will be calculated and reported
ISOLATE_SUBPROBLEM_SIMULATED_CORES=0
ISOLATE_SUBPROBLEM_SIMULATED_TOTAL_TIME=0
ISOLATE_SUBPROBLEM_SIMULATED_START_STOPWATCH=$(date +%s.%N)
ISOLATE_SUBPROBLEM_SIMULATED_TIMEOUT=1800

if [ $ISOLATE_SUBPROBLEM_SIMULATED_CORES -eq "0" ]
then 
    NUM_PDR_CORES=999999999
else
    NUM_PDR_CORES=$((ISOLATE_SUBPROBLEM_SIMULATED_CORES-1))
fi

DECOMPOSED=`grep decomposed $SET | awk '{print $2}'`
REPORT_PLAN=`grep report_plan $SET | awk '{print $2}'`
DAGSTER=`grep dagster $SET | awk '{print $2}'`
MPI_NODES=`grep mpi_nodes $SET | awk '{print $2}'`
isolate_subproblems=`grep isolate_subproblems $SET | grep 1 | wc -l`
backwards=`grep backwards $SET | grep 1 | wc -l`
USE_FD_HEURISTIC=`cat pdr/options.h | grep "#define USE_FD_HEURISTIC 1" | wc -l`
USE_FD_PARSER=`cat pdr/options.h | grep "#define USE_FD_PARSER 1" | wc -l`
NONDETERMINISTIC=`grep nondeterministic $SET | awk '{print $2}'`

DAGPARSER_ROOT=`dirname "$0"` 
echo `readlink -f $DAGPARSER_ROOT/run.sh` $@
echo HOSTNAME: `cat /proc/sys/kernel/hostname`
echo GIT_COMMIT: `git rev-parse HEAD`

echo START_EXTRA_SETTINGS
cat $SET
cat pdr/options.h | grep \^\#define | grep -v OPTIONS_H | cut -d\  -f2-
echo STOP_EXTRA_SETTINGS

TMP_DIR=`pwd`/tmp/tmp_`python3 get_tmp_name.py`
mkdir $TMP_DIR
echo TMP_DIR: $TMP_DIR

echo domain: $DOMAIN
echo problem: $PROBLEM
echo extra_settings: $SET

echo $DOMAIN $PROBLEM > $TMP_DIR/domain_problem

if [ "$(cat /proc/sys/kernel/hostname)" = "goedel" ]
then
    USED_PYTHON="/usr/bin/python3"
else
    USED_PYTHON="python3"
fi

DOMAIN_NO_COMMENTS=$TMP_DIR/tmp_commentless_domain.pddl
cat $DOMAIN | sed -e 's/;.*$//' > $DOMAIN_NO_COMMENTS

VAL_DOMAIN=$TMP_DIR/tmp_cleaned_domain.pddl
$USED_PYTHON extract/clean_domain_for_val.py $DOMAIN_NO_COMMENTS > $VAL_DOMAIN
#DOMAIN=$ORIGINAL_DOMAIN

if [ $USE_FD_PARSER -eq "1" ]
then 
    echo WARNING - FD PARSING NOT SET UP FOR GENERAL USE
    base=$(pwd)
    cd $TMP_DIR
    echo Parse PDDL into SAS file
    $USED_PYTHON $base/pddl-parser-fd/downward/fast-downward.py --translate --keep-sas-file $DOMAIN $PROBLEM 
    #pypy3 $base/pddl-parser-fd/downward/fast-downward.py --translate --keep-sas-file $DOMAIN $PROBLEM 

    echo Finding H^2 Invariants:
    mv output.sas original_output.sas
    cat original_output.sas | $base/h2-fd-preprocessor/builds/release32/bin/preprocess

    echo Process SAS file with mutex into SAT
    $USED_PYTHON $base/pddl-parser-fd/downward/fast-downward.py output.sas --satprune 1 > $TMP_DIR/tmp_downward_instance.txt
    $base/process_downward_instance.sh $TMP_DIR
    cd $base
fi

if [ $NONDETERMINISTIC -eq "1" ]
then
    # use the modified direct madagascar parser
    ./nondeterministic_frontend/pfronten $DOMAIN $PROBLEM -l $TMP_DIR

    tail -n 1 $TMP_DIR/tmp_transition_unordered.cnf > $TMP_DIR/tmp_transition.cnf
    echo "" >> $TMP_DIR/tmp_transition.cnf
    grep -v "p " $TMP_DIR/tmp_transition_unordered.cnf >> $TMP_DIR/tmp_transition.cnf

    rm $TMP_DIR/tmp_transition_unordered.cnf
else
    # use the python wrapper extractor
    cd extract

    PYTHON_START_TIME=$(date +%s.%N)
    $USED_PYTHON main.py -d $DECOMPOSED -s 2 -e $SET $DOMAIN $PROBLEM $TMP_DIR -f 1 # used when using FD to test heuristics > $TMP_DIR/madagascar_output
    MAIN_PYTHON_EXIT_CODE=$?

    if [ $isolate_subproblems -eq "1" ]
    then
        PYTHON_TIME_NUMBER="_0"
    else
        PYTHON_TIME_NUMBER=
    fi

    echo PYTHON_TIME$PYTHON_TIME_NUMBER: $(awk "BEGIN {print ($(date +%s.%N)-$PYTHON_START_TIME)}")

    if [ $MAIN_PYTHON_EXIT_CODE -ne "0" ]
    then 
        exit 0 
    fi

    # If using heuristic values from FD, set up for that
    if [ $USE_FD_HEURISTIC -eq "1" ]
    then 
        cd ..
        base=$(pwd)
        cd $TMP_DIR
        python3 ../../../exploring_systems/comp4550-project/downward/fast-downward.py --keep-sas-file $DOMAIN $PROBLEM --satprune 0 --search "lazy_greedy([lmcut(),hmax(),pdb(),cpdbs(),cegar()], bound=1)" > /dev/null
        cd ../..
        python fd/set_up_fd_heuristic.py $TMP_DIR
        mkdir fd/cached_heuristics
        mkdir fd/cached_heuristics/$(python fd/hash_domain_problem.py $DOMAIN $PROBLEM)
        cd pdr
    fi
    cd ..
fi

cd solver

CPP_START_TIME=$(date +%s.%N)
if [ $isolate_subproblems -eq "1" ]
then
    ISOLATE_ITERATION=0
    RUN_THROUGH_ISOLATE_SUBPROBLEMS_AGAIN=1
    while [ $RUN_THROUGH_ISOLATE_SUBPROBLEMS_AGAIN -ne "0" ]
    do
        all_subproblems=`grep num_subproblems $TMP_DIR/tmp_dagster_info.json | awk '{print $2}' | awk -F, '{print $1}'`
        if [ $all_subproblems -eq "1" ] # only one subproblem, just go straight to monolyth
        then
            max_subproblem_to_complete=0
            num_isolate_instances=1
        else
            max_subproblem_to_complete=`expr $all_subproblems - 2`
            num_isolate_instances=`expr $all_subproblems - 1`
        fi

        if [ $num_isolate_instances -eq 1 ] && [ $ISOLATE_ITERATION -eq 0 ]
        then 
            echo NOT SUSCEPTIBLE TO DECOMPOSITION - Created one subproblem on the first iteration
            exit 0
        fi

        # Uncomment to stop at monolyth
        #if [ $num_isolate_instances -eq 1 ]
        #then 
        #    echo just the monolyth - dont bother
        #    exit 0
        #fi

        echo isolate_subproblem_iteration: $ISOLATE_ITERATION number_isolated_instances: $num_isolate_instances
    
        # As moving from serial mode to simulated parallel, pause the main stopwatch
        ISOLATE_SUBPROBLEM_SIMULATED_DURATION=$(awk "BEGIN {print ($(date +%s.%N)-$ISOLATE_SUBPROBLEM_SIMULATED_START_STOPWATCH)}")
        ISOLATE_SUBPROBLEM_SIMULATED_TOTAL_TIME=$(awk "BEGIN {print ($ISOLATE_SUBPROBLEM_SIMULATED_TOTAL_TIME+$ISOLATE_SUBPROBLEM_SIMULATED_DURATION)}")
        ISOLATE_SUBPROBLEM_SIMULATED_DURATION="not a number - just a check so this number is not used again"

        echo PERIODIC_ISOLATE_SUBPROBLEM_SIMULATED_TOTAL_TIME $ISOLATE_SUBPROBLEM_SIMULATED_TOTAL_TIME
        ISOLATE_SUBPROBLEM_SIMULATED_REMAINING_TIME=$(($ISOLATE_SUBPROBLEM_SIMULATED_TIMEOUT - ${ISOLATE_SUBPROBLEM_SIMULATED_TOTAL_TIME%%.*}))
        echo Timeout to add to PDR batch $ISOLATE_SUBPROBLEM_SIMULATED_REMAINING_TIME

        for subproblem in `echo 0 && seq $max_subproblem_to_complete`
        do
            if [ $DAGSTER -eq "1" ] # parallel
            then
                mpirun -n $MPI_NODES ./parallel-pdr $REPORT_PLAN $DAGSTER $TMP_DIR $SET $START_TIME $subproblem 2>&1 > $TMP_DIR/isolate_subproblems_log_$subproblem &
            else
                echo timeout -s2 $ISOLATE_SUBPROBLEM_SIMULATED_REMAINING_TIME ./parallel-pdr $REPORT_PLAN $DAGSTER $TMP_DIR $SET $START_TIME $subproblem 2\>\&1 \> $TMP_DIR/isolate_subproblems_log_$subproblem >> $TMP_DIR/isolate_subproblems_todo_iteration_$ISOLATE_ITERATION
            fi
        done

        # Actually run the PDR instances, possibly we care about the simulated time, so we calculate it here
        python3 ../isolate_subproblems/batch.py $NUM_PDR_CORES $TMP_DIR/isolate_subproblems_todo_iteration_$ISOLATE_ITERATION

        # FInd the max time of a pdr instance, then add that time to the total accrued time
        ISOLATE_SUBPROBLEM_SIMULATED_DURATION=$(cat $TMP_DIR/TIMES_isolate_subproblems_todo_iteration_$ISOLATE_ITERATION | awk '{print $1}' | sort -g | tail -n 1)
        ISOLATE_SUBPROBLEM_SIMULATED_TOTAL_TIME=$(awk "BEGIN {print ($ISOLATE_SUBPROBLEM_SIMULATED_TOTAL_TIME+$ISOLATE_SUBPROBLEM_SIMULATED_DURATION)}")
        ISOLATE_SUBPROBLEM_SIMULATED_DURATION="not a number - just a check so this number is not used again"

        echo PERIODIC_ISOLATE_SUBPROBLEM_SIMULATED_TOTAL_TIME $ISOLATE_SUBPROBLEM_SIMULATED_TOTAL_TIME
        ROUNDED=${ISOLATE_SUBPROBLEM_SIMULATED_TOTAL_TIME%%.*}
        if [ "$ROUNDED" -gt "$ISOLATE_SUBPROBLEM_SIMULATED_TIMEOUT" ]
        then 
            echo Simulated time greater than wanted timeout
            exit 0
        fi

        # Start the regular stopwatch again
        ISOLATE_SUBPROBLEM_SIMULATED_START_STOPWATCH=$(date +%s.%N)
    
        num_partial_plans=`ls -l $TMP_DIR/ | grep partial_plan | wc -l`
        if [ $num_isolate_instances -eq $num_partial_plans ]
        then
            echo FOUND A COMBINED PLAN
            python3 ../isolate_subproblems/combine_partial_plans.py $TMP_DIR/partial_plan* > $TMP_DIR/plan
            ALL_SUBPROBLEMS_SAT=1
            ../VAL/build/linux64/release/bin/Validate $VAL_DOMAIN $PROBLEM $TMP_DIR/plan > $TMP_DIR/itermediate_val_out
            FOUND_SUCCESFUL_COMBINED_PLAN=`cat $TMP_DIR/itermediate_val_out | grep --color "Plan valid" | wc -l`
        else
            ALL_SUBPROBLEMS_SAT=0
            FOUND_SUCCESFUL_COMBINED_PLAN=0
        fi

        # Evaluate if need to/should run again - only run again if have many instances and don't have a valid plan

        #if [ $num_isolate_instances -eq "1" ] && [ $ALL_SUBPROBLEMS_SAT -eq "1" ] && [ $FOUND_COMBINED_PLAN -eq "0" ]
        #then
            #echo One monolythinc problem, that pdr reported SAT, but VAL says is invalid. So there is a fault with PDR

        if [ $num_isolate_instances -ne "1" ] && [ $FOUND_SUCCESFUL_COMBINED_PLAN -eq "0" ]
        then
            echo could not find a succesful combined plan with multiple subproblems - merging...
            # Set up some information so that the next time around SCCs are combined
            # At this point, either some are unsat:
            #   For the unsat ones, make it so SCC are combined
            # or the components are all sat (but there are multiple subproblems, and their combination does not make a valid overall plan)
            #   Find the fault in the plan, find all corresponding subproblems and combine as before

            VAL_ADVICE=`../VAL/build/linux64/release/bin/Validate -v $VAL_DOMAIN $PROBLEM $TMP_DIR/plan | grep Advice -A 999999 | grep " to "`

            $USED_PYTHON ../isolate_subproblems/combine_subproblems.py $TMP_DIR $num_isolate_instances $ALL_SUBPROBLEMS_SAT $VAL_ADVICE >> $TMP_DIR/tmp_merging_advice.txt
            echo MERGING ADVICE:
            cat $TMP_DIR/tmp_merging_advice.txt

            base=$(pwd)
            cd $TMP_DIR
            grep PLAN *log*
            rm *plan*
            rm *log*
            cd $base

            cd ../extract
            ISOLATE_ITERATION=$((ISOLATE_ITERATION+1))
            PYTHON_START_TIME=$(date +%s.%N)
            $USED_PYTHON main.py -d $DECOMPOSED -s 2 -e $SET $DOMAIN $PROBLEM $TMP_DIR -f 0
            PYTHON_TIME_NUMBER="_"$ISOLATE_ITERATION
            echo PYTHON_TIME$PYTHON_TIME_NUMBER: $(awk "BEGIN {print ($(date +%s.%N)-$PYTHON_START_TIME)}")
            cd ../pdr
            RUN_THROUGH_ISOLATE_SUBPROBLEMS_AGAIN=1

        else
            echo 1 isolated subproblem OR found a succesful plan, not going to merge again...
            RUN_THROUGH_ISOLATE_SUBPROBLEMS_AGAIN=0
        fi
    done
else # not isolate_parallel
    if [ $DAGSTER -eq "1" ] # parallel
    then
        echo mpirun -n $MPI_NODES ./parallel-pdr $REPORT_PLAN $DAGSTER $TMP_DIR $SET $START_TIME 2>&1
        mpirun -n $MPI_NODES ./parallel-pdr $REPORT_PLAN $DAGSTER $TMP_DIR $SET $START_TIME 2>&1
        #mpirun -n $MPI_NODES valgrind ./parallel-pdr $REPORT_PLAN $DAGSTER $TMP_DIR $SET $START_TIME 2>&1
        #mpirun -np $MPI_NODES xterm -e gdb --args ./parallel-pdr $REPORT_PLAN $DAGSTER $TMP_DIR $SET $START_TIME

    else
        echo ./parallel-pdr $REPORT_PLAN $DAGSTER $TMP_DIR $SET $START_TIME 2>&1
        #./parallel-pdr $REPORT_PLAN $DAGSTER $TMP_DIR $SET $START_TIME 2>&1
        gdb --args ./parallel-pdr $REPORT_PLAN $DAGSTER $TMP_DIR $SET $START_TIME 2>&1
        #valgrind ./parallel-pdr $REPORT_PLAN $DAGSTER $TMP_DIR $SET $START_TIME 2>&1
    fi
fi
echo CPP_TIME: $(awk "BEGIN {print ($(date +%s.%N)-$CPP_START_TIME)}")

cd ..

if [ $backwards -eq "1" ]
then
    python3 reverse_plan.py $TMP_DIR/plan > $TMP_DIR/reversed_plan 2> /dev/null
    if [ $? -eq 0 ]; then
        # If successfully reversed a plan
        cp $TMP_DIR/reversed_plan $TMP_DIR/plan
    fi
fi

# Check resulting plan
echo ./VAL/build/linux64/release/bin/Validate $VAL_DOMAIN $PROBLEM $TMP_DIR/plan
./VAL/build/linux64/release/bin/Validate $VAL_DOMAIN $PROBLEM $TMP_DIR/plan > $TMP_DIR/val_out

plan_valid=`cat $TMP_DIR/val_out | grep --color "Plan valid" | wc -l`

if [ $plan_valid -eq "1" ]
then 
    #export GREP_COLORS='ms=01;32'
    cat $TMP_DIR/val_out | grep "Plan valid" | green_text
else
    #export GREP_COLORS='ms=01;31'
    cat $TMP_DIR/val_out | red_text
fi

ISOLATE_SUBPROBLEM_SIMULATED_DURATION=$(awk "BEGIN {print ($(date +%s.%N)-$ISOLATE_SUBPROBLEM_SIMULATED_START_STOPWATCH)}")
ISOLATE_SUBPROBLEM_SIMULATED_TOTAL_TIME=$(awk "BEGIN {print ($ISOLATE_SUBPROBLEM_SIMULATED_TOTAL_TIME+$ISOLATE_SUBPROBLEM_SIMULATED_DURATION)}")
ISOLATE_SUBPROBLEM_SIMULATED_DURATION="not a number - just a check so this number is not used again"
echo FINAL_ISOLATE_SUBPROBLEM_SIMULATED_TOTAL_TIME $ISOLATE_SUBPROBLEM_SIMULATED_TOTAL_TIME

exit 0
