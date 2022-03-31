#HPCRUN_EVENT_LIST=CPUTIME@0.1
#!/bin/bash

# $2 decomposed
# $4 report plan
# $6 parallel (use dagster)
# $8 num mpi nodes
# $9 domain
# $10 problem
# $11 extra_settings

echo ./run.sh $@

python3 check_arguments.py $@
if [[ $? -ne 0 ]]; then
    exit 1
fi

echo START_EXTRA_SETTINGS
cat ${11}
echo STOP_EXTRA_SETTINGS

TMP_DIR=`pwd`/tmp/tmp_`python3 hash.py`
echo $TMP_DIR
mkdir $TMP_DIR

echo domain: ${9}
echo problem: ${10}

echo ${9} ${10} > $TMP_DIR/domain_problem

export GLOG_v=0 # verbose glog logging at level 5 (0 is least verbose)
export GLOG_logtostderr=true # otherwise all logging goes to /tmp/appname.hostname.username.log.INFO.date.pid

cd extract

python3 main.py -d $2 -s 2 -e ../${11} ../$9 ../${10} $TMP_DIR 
#/usr/bin/python3 main.py -d $2 -s 2 -e ../${11} ../$9 ../${10} $TMP_DIR

cd ../pdr
isolate_subproblems=`grep isolate_subproblems ../${11} | grep 1 | wc -l`

if [ $isolate_subproblems -eq "1" ]
then
    all_subproblems=`grep num_subproblems $TMP_DIR/tmp_dagster_info.json | awk '{print $2}' | awk -F, '{print $1}'`
    if [ $all_subproblems -eq "1" ] # only one subproblem, just go straight to monolyth
    then
        max_subproblem_to_complete=0
        num_isolate_instances=1
    else
        max_subproblem_to_complete=`expr $all_subproblems - 2`
        num_isolate_instances=`expr $all_subproblems - 1`
    fi

    echo number_isolated_instances: $num_isolate_instances

    for subproblem in `echo 0 && seq $max_subproblem_to_complete`
    do
        if [ $6 -eq "1" ] # parallel
        then
            echo mpirun -n $8 ./pdrDagster $4 $6 $TMP_DIR 2>&1
            #{ ulimit -v 8000000; mpirun -n $8 ./pdrDagster $4 $6 $TMP_DIR ../${11} $subproblem 2>&1; }&
            mpirun -n $8 ./pdrDagster $4 $6 $TMP_DIR ../${11} $subproblem 2>&1 &
        else
            echo ./pdrDagster $4 $6 $TMP_DIR 2>&1
            #{ ulimit -v 8000000; ./pdrDagster $4 $6 $TMP_DIR ../${11} $subproblem 2>&1; }&
            ./pdrDagster $4 $6 $TMP_DIR ../${11} $subproblem 2>&1 &
        fi
    done

    echo done setting up jobs

    sleep 2 # HACKY - MAY GIVE RISE TO ERRORS give time for them all to start up - especially if they are parallel runs. Note this sleep only slows down the checker, so will only slow down very short runs

    # These are done in parallel, so wait until they are all finished
    while [ `../get_pid_matching_pdr.sh $TMP_DIR | wc -l` -ne "0" ]
    do
        sleep 0.1
    done

    num_partial_plans=`ls -l $TMP_DIR/ | grep partial_plan | wc -l`
    if [ $num_isolate_instances -eq $num_partial_plans ]
    then
        echo FOUND A COMBINED PLAN
        python3 ../combine_partial_plans.py $TMP_DIR/partial_plan* > $TMP_DIR/plan
    else
        echo UNKNOWN
    fi
else # not isolate_parallel
    if [ $6 -eq "1" ] # parallel
    then
        echo mpirun -n $8 ./pdrDagster $4 $6 $TMP_DIR 2>&1
        #{ ulimit -v 8000000; mpirun -n $8 ./pdrDagster $4 $6 $TMP_DIR ../${11} 2>&1; }
        mpirun -n $8 ./pdrDagster $4 $6 $TMP_DIR ../${11} 2>&1
    else
        echo ./pdrDagster $4 $6 $TMP_DIR 2>&1
        #{ ulimit -v 8000000; ./pdrDagster $4 $6 $TMP_DIR ../${11} 2>&1; }
        ./pdrDagster $4 $6 $TMP_DIR ../${11} 2>&1
    fi
fi

cd ..
echo ./VAL/build/linux64/release/bin/Validate $9 ${10} $TMP_DIR/plan 
echo number_isolated_instances: $num_isolate_instances

./VAL/build/linux64/release/bin/Validate $9 ${10} $TMP_DIR/plan > $TMP_DIR/val_out
export GREP_COLORS='ms=01;32'
cat $TMP_DIR/val_out | grep --color "Plan valid" -A 100 -B 100
export GREP_COLORS='ms=01;31'
cat $TMP_DIR/val_out | grep --color "Plan invalid" -A 100 -B 100

#cat $TMP_DIR/val_out | grep -v valid
