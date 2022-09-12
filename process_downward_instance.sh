TMP_DIR=$1
cat $TMP_DIR/tmp_downward_instance.txt | grep CLAUSE | cut -f 2- -d' ' > $TMP_DIR/tmp_regular_without_header.cnf
cat $TMP_DIR/tmp_downward_instance.txt | grep FOR_PYTHON | cut -f 2- -d' ' > $TMP_DIR/tmp_for_python.txt
cat $TMP_DIR/tmp_downward_instance.txt | grep MAPPING | cut -f 2- -d' ' > $TMP_DIR/tmp_mapping.txt

# Handle the header for the CNF
NUM_CLAUSES=`wc -l $TMP_DIR/tmp_regular_without_header.cnf | cut -f 1 -d' '`
NUM_SAT_VARIABLES=`cat $TMP_DIR/tmp_downward_instance.txt | grep NUM_SAT_VARIABLES | cut -f 2 -d' '`
echo p cnf $NUM_SAT_VARIABLES $NUM_CLAUSES > $TMP_DIR/tmp_regular.cnf
cat $TMP_DIR/tmp_regular_without_header.cnf >> $TMP_DIR/tmp_regular.cnf
rm $TMP_DIR/tmp_regular_without_header.cnf


cp $TMP_DIR/tmp_regular.cnf $TMP_DIR/tmp_regular_1.cnf
