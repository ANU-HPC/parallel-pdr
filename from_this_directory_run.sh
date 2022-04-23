#HPCRUN_EVENT_LIST=CPUTIME@0.1
#!/bin/sh

cd `dirname "$0"` # moves to the directory in which this script is held (root of dagparser)

DOMAIN=$1
PROBLEM=$2
SET=$3

DECOMPOSED=`grep decomposed $SET | awk '{print $2}'`
REPORT_PLAN=`grep report_plan $SET | awk '{print $2}'`
DAGSTER=`grep dagster $SET | awk '{print $2}'`
MPI_NODES=`grep mpi_nodes $SET | awk '{print $2}'`
isolate_subproblems=`grep isolate_subproblems $SET | grep 1 | wc -l`

DAGPARSER_ROOT=`dirname "$0"` 
echo `readlink -f $DAGPARSER_ROOT/run.sh` $@
echo HOSTNAME: `cat /proc/sys/kernel/hostname`


echo START_EXTRA_SETTINGS
cat $SET
echo STOP_EXTRA_SETTINGS

TMP_DIR=`pwd`/tmp/tmp_`python3 hash.py`
echo TMP_DIR: $TMP_DIR
mkdir $TMP_DIR

echo domain: $DOMAIN
echo problem: $PROBLEM
echo extra_settings: $SET

echo $DOMAIN $PROBLEM > $TMP_DIR/domain_problem

export GLOG_v=0 # verbose glog logging at level 5 (0 is least verbose)
export GLOG_logtostderr=true # otherwise all logging goes to /tmp/appname.hostname.username.log.INFO.date.pid

cd extract

python3 main.py -d $DECOMPOSED -s 2 -e $SET $DOMAIN $PROBLEM $TMP_DIR 
#/usr/bin/python3 main.py -d $DECOMPOSED -s 2 -e $SET $DOMAIN $PROBLEM $TMP_DIR

cd ../pdr

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
        if [ $DAGSTER -eq "1" ] # parallel
        then
            echo mpirun -n $MPI_NODES ./pdrDagster $REPORT_PLAN $DAGSTER $TMP_DIR 2>&1
            #{ ulimit -v 8000000; mpirun -n $MPI_NODES ./pdrDagster $REPORT_PLAN $DAGSTER $TMP_DIR ../$SET $subproblem 2>&1; }&
            mpirun -n $MPI_NODES ./pdrDagster $REPORT_PLAN $DAGSTER $TMP_DIR $SET $subproblem 2>&1 &
        else
            echo ./pdrDagster $REPORT_PLAN $DAGSTER $TMP_DIR 2>&1
            #{ ulimit -v 8000000; ./pdrDagster $REPORT_PLAN $DAGSTER $TMP_DIR ../$SET $subproblem 2>&1; }&
            ./pdrDagster $REPORT_PLAN $DAGSTER $TMP_DIR $SET $subproblem 2>&1 &
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
    if [ $DAGSTER -eq "1" ] # parallel
    then
        echo mpirun -n $MPI_NODES ./pdrDagster $REPORT_PLAN $DAGSTER $TMP_DIR 2>&1
        #{ ulimit -v 8000000; mpirun -n $MPI_NODES ./pdrDagster $REPORT_PLAN $DAGSTER $TMP_DIR ../$SET 2>&1; }
        mpirun -n $MPI_NODES ./pdrDagster $REPORT_PLAN $DAGSTER $TMP_DIR $SET 2>&1
    else
        echo ./pdrDagster $REPORT_PLAN $DAGSTER $TMP_DIR 2>&1
        #{ ulimit -v 8000000; ./pdrDagster $REPORT_PLAN $DAGSTER $TMP_DIR ../$SET 2>&1; }
        ./pdrDagster $REPORT_PLAN $DAGSTER $TMP_DIR $SET 2>&1
    fi
fi

cd ..
echo ./VAL/build/linux64/release/bin/Validate $DOMAIN $PROBLEM $TMP_DIR/plan 
echo number_isolated_instances: $num_isolate_instances

./VAL/build/linux64/release/bin/Validate $DOMAIN $PROBLEM $TMP_DIR/plan > $TMP_DIR/val_out
export GREP_COLORS='ms=01;32'
cat $TMP_DIR/val_out | grep --color "Plan valid" -A 100 -B 100
export GREP_COLORS='ms=01;31'
cat $TMP_DIR/val_out | grep --color "Plan invalid" -A 100 -B 100

#cat $TMP_DIR/val_out | grep -v valid
