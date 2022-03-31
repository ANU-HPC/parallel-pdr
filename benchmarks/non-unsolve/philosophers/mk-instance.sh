#!/bin/bash

num=0
live=0
writesets=0

while getopts "lhs" c
do
    case $c in
    l) live=1;;
    s) writesets=1;;
    h) echo "$0 [-l] <num>"
       exit 1;;
    esac
done

shift $(($OPTIND - 1))

if [[ $# -lt 1 ]] ; then
  echo "$0 [-l] <num>"
  exit 1
fi

num=$1

if [[ $num -lt 2 ]] ; then
  echo "$0: number of philosophers must be at least 2"
  exit 1
fi

echo "(define (problem deadlock3)"
echo "  (:domain philosophers)"

echo "  (:objects"
i=1
while [[ $i -le $num ]]; do
    echo "  p$i - philosopher"
    echo "  f$i - fork"
    i=$((i+1))
done
echo "  )"

echo "  (:init"
if [[ $live -gt 0 ]]; then
    echo "   (left-of p1 f$num)"
    echo "   (right-of p1 f1)"
else
    echo "   (left-of p1 f1)"
    echo "   (right-of p1 f$num)"
fi

i=2
while [[ $i -le $num ]]; do
    j=$((i-1))
    echo "   (left-of p$i f$i)"
    echo "   (right-of p$i f$j)"
    i=$((i+1))
done

i=1
while [[ $i -le $num ]]; do
    echo "   (ph-state-6 p$i)"
    echo "   (free f$i)"
    echo "   (may-take f$i)"
    echo "   (may-return f$i)"
    i=$((i+1))
done
echo "   )"

echo -n "  (:goal (and"
i=1
while [[ $i -le $num ]]; do
    echo -n " (blocked p$i)"
    i=$((i+1))
done
echo "))"

if [[ $writesets -gt 0 ]]; then
    echo "(:set (ph-state-6 p1) (ph-state-3 p1) (ph-state-4 p1) (ph-state-5 p1) (blocked p1) (taken f1) (free f1) (may-take f1) (may-return f1))"

    i=2
    while [[ $i -le $num ]]; do
	j=$((num + 2 - i))
	echo "(:set (ph-state-6 p$i) (ph-state-3 p$i) (ph-state-4 p$i) (ph-state-5 p$i) (blocked p$i) (taken f$j) (free f$j) (may-take f$j) (may-return f$j))"
	i=$((i+1))
    done
fi

# end problem
echo " )"
