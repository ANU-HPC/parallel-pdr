#!/bin/bash
# To be called from pdr directory

echoerr() { test; }
#echoerr() { echo "$@" 1>&2; }

echoerr HOWDY! starting a new get heuristic
# args: TMP_DIR WANTED_HEURSITIC var1 var2 ...
TMP_DIR=$1
echoerr $(cat $TMP_DIR/domain_problem)
echoerr $(cat $TMP_DIR/domain_problem | cut -d" " -f1)
DOMAIN=$(cat $TMP_DIR/domain_problem | cut -d" " -f1)
wanted_heuristic=$2
HASH=$3
echoerr wanted heuristic: $wanted_heuristic
state=$(echo $@ | cut -d" " -f4-)
DOMAIN_PROBLEM=$(cat $TMP_DIR/domain_problem)
STATE_HASH_FILE=../fd/cached_heuristics/$(python3 ../fd/hash_domain_problem.py $DOMAIN_PROBLEM)/$HASH

echoerr consistent hash: $STATE_HASH_FILE

echoerr start check if already exists
if test -f "$STATE_HASH_FILE"; then
    echoerr test says hash file exists...
fi
echoerr $(cat $STATE_HASH_FILE)

echoerr tp run: python3 ../fd/exists_and_is_valid.py "$STATE_HASH_FILE" $wanted_heuristic;
python3 ../fd/exists_and_is_valid.py "$STATE_HASH_FILE" $wanted_heuristic;
echoerr just run prelim, got result: $?
echoerr run again:


if python3 ../fd/exists_and_is_valid.py "$STATE_HASH_FILE" $wanted_heuristic; then
    echoerr Already exists! great, getting val from file:
    echoerr $STATE_HASH_FILE
    echoerr $(cat $STATE_HASH_FILE)
    wanted_bound=$(cat $STATE_HASH_FILE | grep $wanted_heuristic | cut -d" " -f2)
    echoerr actual bound to return: $wanted_bound
    echo $wanted_bound
    exit 0
else
    echoerr python says does not exist
fi

# Doesn't already exist, so lets find it, first generate custom SAS file
#TMP_SAS=$TMP_DIR/tmp_output.sas
#cat $TMP_DIR/output_before > $TMP_SAS
#python3 ../fd/generate_tmp_sas.py $TMP_DIR $state >> $TMP_SAS
#echoerr output from generate_tmp_sas: $(python3 ../fd/generate_tmp_sas.py $TMP_DIR $state) 
#cat $TMP_DIR/output_after >> $TMP_SAS

# generate replacement pddl problem
TMP_PDDL=$TMP_DIR/tmp_problem.pddl
TMP_SAS=$TMP_DIR/tmp_output.sas
echoerr about to create tmp_problem at $TMP_PDDL
python3 ../fd/generate_tmp_pddl.py $TMP_DIR $state > $TMP_PDDL

# get all results to a file


#merge_and_shrink(merge_strategy=merge_strategy=merge_precomputed(merge_tree=linear(variable_order=reverse_level)),shrink_strategy=shrink_fh(),label_reduction=exact(before_shrinking=false,before_merging=true),max_states=50000,verbosity=silent) 


echoerr python3 ../../exploring_systems/comp4550-project/downward/fast-downward.py --sas-file $TMP_SAS $DOMAIN $TMP_PDDL --satprune 0 --search "lazy_greedy([goalcount(),zopdbs(),cg(),cea(),lmcut(),hmax(),pdb(),cpdbs()], bound=1)"

# There are 2 commands below, one is for most the heuristics, the other is for most AND merge and shrink, but merge and shrink is for now too expensive
# Run this command instead if you want merge and shrink
#python3 ../../exploring_systems/comp4550-project/downward/fast-downward.py --sas-file $TMP_SAS $DOMAIN $TMP_PDDL --satprune 0 --search "lazy_greedy([merge_and_shrink(merge_strategy=merge_strategy=merge_precomputed(merge_tree=linear(variable_order=reverse_level)),shrink_strategy=shrink_fh(),label_reduction=exact(before_shrinking=false,before_merging=true),max_states=50000,verbosity=silent),goalcount(),zopdbs(),cg(),cea(),lmcut(),hmax(),pdb(),cpdbs()], bound=1)" | grep -F 'Initial heuristic' | cut -d" " -f8-9 > $STATE_HASH_FILE

# Run this command if you don't want merge and shrink
python3 ../../exploring_systems/comp4550-project/downward/fast-downward.py --sas-file $TMP_SAS $DOMAIN $TMP_PDDL --satprune 0 --search "lazy_greedy([goalcount(),zopdbs(),cg(),cea(),lmcut(),hmax(),pdb(),cpdbs()], bound=1)" | grep -F 'Initial heuristic' | cut -d" " -f8-9 > $STATE_HASH_FILE


echoerr B!!
max_bound=$(cat $STATE_HASH_FILE | cut -d" " -f2 | tr ' ' '\n' | sort -n  | tail -1)
echoerr c!!
echo max_of_others: $max_bound >> $STATE_HASH_FILE
echoerr d!!
#rm $TMP_SAS

# Now grab the wanted heuristic from that file
wanted_bound=$(cat $STATE_HASH_FILE | grep $wanted_heuristic | cut -d" " -f2)
echoerr now have calculated bound, to return $wanted_bound
echo $wanted_bound
