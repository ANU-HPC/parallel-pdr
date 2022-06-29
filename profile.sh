#!/bin/bash -i
# Used by the author for benchmarking between versions
NAME=$(python hash.py | cut -c 1-20)

cat set
rm -r tests/profile_results
mkdir tests/profile_results
rm -f tests/DONE_profile_suite.sh
rm -f tests/TIMES_profile_suite.sh
batchp 4 tests/profile_suite.sh
rm tests/DONE_profile_suite.sh tests/TIMES_profile_suite.sh

echo $@ > ../measurements/profile/jsons/comments_$NAME.txt
python analyze.py tests/profile_results/* > ../measurements/profile/jsons/results_$NAME.json

