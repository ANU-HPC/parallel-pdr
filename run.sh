#!/bin/bash
# This is the main script to run, it checks that the arguments exist, then convert them to absolute paths to run with the "REAL" runscript in the dagparser directory
DAGPARSER_ROOT=`dirname "$0"` 
python3 $DAGPARSER_ROOT/check_arguments.py $@
if [[ $? -ne 0 ]]; then
    exit 1
fi

# All absolute paths
DOMAIN=`readlink -m $1`
PROBLEM=`readlink -m $2`
SET=`readlink -m $3`

{ time $DAGPARSER_ROOT/from_this_directory_run.sh $DOMAIN $PROBLEM $SET ; } 2>&1 
