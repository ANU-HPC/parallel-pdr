#!/bin/bash

num=0
cycle=1
prio=1
writesets=0
nnp=0

while getopts "lpnsh" c
do
    case $c in
    l) cycle=0;;
    p) prio=0;;
    n) nnp=1;;
    s) writesets=1;;
    h) echo "$0 [-l] [-p] [-n] [-s] <num>"
       exit 1;;
    esac
done

shift $(($OPTIND - 1))

if [[ $# -lt 1 ]] ; then
  echo "$0 [-l] [-p] [-n] [-s] <num>"
  exit 1
fi

num=$1

if [[ $num -lt 2 ]] ; then
  echo "$0: number of stations must be at least 2"
  exit 1
fi

if [[ $line -gt 0 ]]; then
    echo "(define (problem opt-line-$num)"
else
    echo "(define (problem opt-cycle-$num)"
fi
echo "  (:domain optical-telegraph-ae)"


# object decl
echo "    (:objects"

i=1
while [[ $i -le $((num - 1 + cycle)) ]]; do
    echo "   stn-$i-dn - station"
    echo "   stn-$i-dn-recv - queue"
    echo "   stn-$i-ctl - queue"
    i=$((i+1))
done

i=$((2 - cycle))
while [[ $i -le $num ]]; do
    echo "   stn-$i-up - station"
    echo "   stn-$i-up-recv - queue"
    i=$((i+1))
done

if [[ $cycle -eq 0 ]]; then
    echo "   stn-$num-ctl - queue"
fi

echo "   )"


# init decl
echo "  (:init"

# topology
i=1
while [[ $i -le $((num - 1)) ]]; do
    j=$((i+1))
    echo "   (station-ctl-queue   stn-$i-dn stn-$i-ctl)"
    echo "   (station-read-queue  stn-$i-dn stn-$i-dn-recv)"
    echo "   (station-write-queue stn-$i-dn stn-$j-up-recv)"
    i=$((i+1))
done
i=2
while [[ $i -le $num ]]; do
    j=$((i-1))
    echo "   (station-ctl-queue   stn-$i-up stn-$i-ctl)"
    echo "   (station-read-queue  stn-$i-up stn-$i-up-recv)"
    echo "   (station-write-queue stn-$i-up stn-$j-dn-recv)"
    i=$((i+1))
done

# special handling of dn-$num and up-1 if cycle
if [[ $cycle -gt 0 ]]; then
    echo "   (station-ctl-queue   stn-$num-dn stn-$num-ctl)"
    echo "   (station-read-queue  stn-$num-dn stn-$num-dn-recv)"
    echo "   (station-write-queue stn-$num-dn stn-1-up-recv)"
    echo "   (station-ctl-queue   stn-1-up stn-1-ctl)"
    echo "   (station-read-queue  stn-1-up stn-1-up-recv)"
    echo "   (station-write-queue stn-1-up stn-$num-dn-recv)"
fi

# other inits
i=1
while [[ $i -le $((num - 1 + cycle)) ]]; do
    if [[ $prio -gt 0 ]]; then
	echo "   (has-priority stn-$i-dn)"
    fi
    echo "   (station-state-25 stn-$i-dn)"
    echo "   (queue-state-empty stn-$i-dn-recv)"
    if [[ $nnp -gt 0 ]]; then
	echo "   (not-queue-state-ctl stn-$i-dn-recv)"
	echo "   (not-queue-state-att stn-$i-dn-recv)"
	echo "   (not-queue-state-data stn-$i-dn-recv)"
	echo "   (not-queue-state-start stn-$i-dn-recv)"
	echo "   (not-queue-state-stop stn-$i-dn-recv)"
    fi
    echo "   (may-push-ctl      stn-$i-dn-recv)"
    echo "   (may-push-att      stn-$i-dn-recv)"
    echo "   (may-push-data     stn-$i-dn-recv)"
    echo "   (may-push-start    stn-$i-dn-recv)"
    echo "   (may-push-stop     stn-$i-dn-recv)"
    echo "   (may-pop           stn-$i-dn-recv)"
    i=$((i+1))
done

i=$((2 - cycle))
while [[ $i -le $num ]]; do
    if [[ $prio -gt 0 && $nnp -gt 0 ]]; then
	echo "   (not-has-priority stn-$i-up)"
    fi
    echo "   (station-state-25 stn-$i-up)"
    echo "   (queue-state-empty stn-$i-up-recv)"
    if [[ $nnp -gt 0 ]]; then
	echo "   (not-queue-state-ctl stn-$i-up-recv)"
	echo "   (not-queue-state-att stn-$i-up-recv)"
	echo "   (not-queue-state-data stn-$i-up-recv)"
	echo "   (not-queue-state-start stn-$i-up-recv)"
	echo "   (not-queue-state-stop stn-$i-up-recv)"
    fi
    echo "   (may-push-ctl      stn-$i-up-recv)"
    echo "   (may-push-att      stn-$i-up-recv)"
    echo "   (may-push-data     stn-$i-up-recv)"
    echo "   (may-push-start    stn-$i-up-recv)"
    echo "   (may-push-stop     stn-$i-up-recv)"
    echo "   (may-pop           stn-$i-up-recv)"
    i=$((i+1))
done

i=1
while [[ $i -le $num ]]; do
    echo "   (queue-state-empty stn-$i-ctl)"
    if [[ $nnp -gt 0 ]]; then
	echo "   (not-queue-state-ctl stn-$i-ctl)"
	echo "   (not-queue-state-att stn-$i-ctl)"
	echo "   (not-queue-state-data stn-$i-ctl)"
	echo "   (not-queue-state-start stn-$i-ctl)"
	echo "   (not-queue-state-stop stn-$i-ctl)"
    fi
    echo "   (may-push-ctl      stn-$i-ctl)"
    echo "   (may-push-att      stn-$i-ctl)"
    echo "   (may-push-data     stn-$i-ctl)"
    echo "   (may-push-start    stn-$i-ctl)"
    echo "   (may-push-stop     stn-$i-ctl)"
    echo "   (may-pop           stn-$i-ctl)"
    i=$((i+1))
done

echo "   )"


# goal decl
echo "  (:goal (and"
i=1
while [[ $i -le $((num - 1 + cycle)) ]]; do
    echo -n " (blocked stn-$i-dn)"
    i=$((i+1))
done
i=$((2 - cycle))
while [[ $i -le $num ]]; do
    echo -n " (blocked stn-$i-up)"
    i=$((i+1))
done
echo "))"

if [[ $writesets -gt 0 ]]; then
    if [[ $cycle -gt 0 ]]; then
	i=1;
	while [[ $i -le $num ]]; do
	    j=$((num + 1 - i))
	    k=$((j + 1))
	    if [[ $k -gt $num ]]; then
		k=$((k - num))
	    fi
	    echo "  (:set"
	    echo "    (station-state-2 stn-$i-dn)"
	    echo "    (station-state-3 stn-$i-dn)"
	    echo "    (station-state-5 stn-$i-dn)"
	    echo "    (station-state-8 stn-$i-dn)"
	    echo "    (station-state-11 stn-$i-dn)"
	    echo "    (station-state-12 stn-$i-dn)"
	    echo "    (station-state-14 stn-$i-dn)"
	    echo "    (station-state-15 stn-$i-dn)"
	    echo "    (station-state-17 stn-$i-dn)"
	    echo "    (station-state-20 stn-$i-dn)"
	    echo "    (station-state-23 stn-$i-dn)"
	    echo "    (station-state-24 stn-$i-dn)"
	    echo "    (station-state-25 stn-$i-dn)"
	    echo "    (blocked stn-$i-dn)"
	    echo "    (station-state-2 stn-$i-up)"
	    echo "    (station-state-3 stn-$i-up)"
	    echo "    (station-state-5 stn-$i-up)"
	    echo "    (station-state-8 stn-$i-up)"
	    echo "    (station-state-11 stn-$i-up)"
	    echo "    (station-state-12 stn-$i-up)"
	    echo "    (station-state-14 stn-$i-up)"
	    echo "    (station-state-15 stn-$i-up)"
	    echo "    (station-state-17 stn-$i-up)"
	    echo "    (station-state-20 stn-$i-up)"
	    echo "    (station-state-23 stn-$i-up)"
	    echo "    (station-state-24 stn-$i-up)"
	    echo "    (station-state-25 stn-$i-up)"
	    echo "    (blocked stn-$i-up)"
	    echo "    (queue-state-empty stn-$i-ctl)"
	    echo "    (queue-state-ctl stn-$i-ctl)"
	    echo "    (queue-state-att stn-$i-ctl)"
	    echo "    (queue-state-data stn-$i-ctl)"
	    echo "    (queue-state-start stn-$i-ctl)"
	    echo "    (queue-state-stop stn-$i-ctl)"
	    echo "    (may-push-ctl stn-$i-ctl)"
	    echo "    (may-push-att stn-$i-ctl)"
	    echo "    (may-push-data stn-$i-ctl)"
	    echo "    (may-push-start stn-$i-ctl)"
	    echo "    (may-push-stop stn-$i-ctl)"
	    echo "    (may-pop stn-$i-ctl) "
	    echo "    (queue-state-empty stn-$j-dn-recv)"
	    echo "    (queue-state-ctl stn-$j-dn-recv)"
	    echo "    (queue-state-att stn-$j-dn-recv)"
	    echo "    (queue-state-data stn-$j-dn-recv)"
	    echo "    (queue-state-start stn-$j-dn-recv)"
	    echo "    (queue-state-stop stn-$j-dn-recv)"
	    echo "    (may-push-ctl stn-$j-dn-recv)"
	    echo "    (may-push-att stn-$j-dn-recv)"
	    echo "    (may-push-data stn-$j-dn-recv)"
	    echo "    (may-push-start stn-$j-dn-recv)"
	    echo "    (may-push-stop stn-$j-dn-recv)"
	    echo "    (may-pop stn-$j-dn-recv)"
	    echo "    (queue-state-empty stn-$k-up-recv)"
	    echo "    (queue-state-ctl stn-$k-up-recv)"
	    echo "    (queue-state-att stn-$k-up-recv)"
	    echo "    (queue-state-data stn-$k-up-recv)"
	    echo "    (queue-state-start stn-$k-up-recv)"
	    echo "    (queue-state-stop stn-$k-up-recv)"
	    echo "    (may-push-ctl stn-$k-up-recv)"
	    echo "    (may-push-att stn-$k-up-recv)"
	    echo "    (may-push-data stn-$k-up-recv)"
	    echo "    (may-push-start stn-$k-up-recv)"
	    echo "    (may-push-stop stn-$k-up-recv)"
	    echo "    (may-pop stn-$k-up-recv)"
	    echo "   )"
	    i=$((i+1))
	done
    else
	i=1;
	while [[ $i -le $num ]]; do
	    # control channel
	    echo "  (:set"
	    echo "    (queue-state-empty stn-$i-ctl)"
	    echo "    (queue-state-ctl stn-$i-ctl)"
	    echo "    (queue-state-att stn-$i-ctl)"
	    echo "    (queue-state-data stn-$i-ctl)"
	    echo "    (queue-state-start stn-$i-ctl)"
	    echo "    (queue-state-stop stn-$i-ctl)"
	    echo "    (may-push-ctl stn-$i-ctl)"
	    echo "    (may-push-att stn-$i-ctl)"
	    echo "    (may-push-data stn-$i-ctl)"
	    echo "    (may-push-start stn-$i-ctl)"
	    echo "    (may-push-stop stn-$i-ctl)"
	    echo "    (may-pop stn-$i-ctl))"
	    if [[ $i -lt $num ]]; then
	        # station $i down operator
		echo "  (:set"
		echo "    (station-state-2 stn-$i-dn)"
		echo "    (station-state-3 stn-$i-dn)"
		echo "    (station-state-5 stn-$i-dn)"
		echo "    (station-state-8 stn-$i-dn)"
		echo "    (station-state-11 stn-$i-dn)"
		echo "    (station-state-12 stn-$i-dn)"
		echo "    (station-state-14 stn-$i-dn)"
		echo "    (station-state-15 stn-$i-dn)"
		echo "    (station-state-17 stn-$i-dn)"
		echo "    (station-state-20 stn-$i-dn)"
		echo "    (station-state-23 stn-$i-dn)"
		echo "    (station-state-24 stn-$i-dn)"
		echo "    (station-state-25 stn-$i-dn)"
		echo "    (blocked stn-$i-dn))"
		# channels to next station
		j=$((i+1))
		echo "  (:set"
		echo "    (queue-state-empty stn-$i-dn-recv)"
		echo "    (queue-state-ctl stn-$i-dn-recv)"
		echo "    (queue-state-att stn-$i-dn-recv)"
		echo "    (queue-state-data stn-$i-dn-recv)"
		echo "    (queue-state-start stn-$i-dn-recv)"
		echo "    (queue-state-stop stn-$i-dn-recv)"
		echo "    (may-push-ctl stn-$i-dn-recv)"
		echo "    (may-push-att stn-$i-dn-recv)"
		echo "    (may-push-data stn-$i-dn-recv)"
		echo "    (may-push-start stn-$i-dn-recv)"
		echo "    (may-push-stop stn-$i-dn-recv)"
		echo "    (may-pop stn-$i-dn-recv)"
		echo "    (queue-state-empty stn-$j-up-recv)"
		echo "    (queue-state-ctl stn-$j-up-recv)"
		echo "    (queue-state-att stn-$j-up-recv)"
		echo "    (queue-state-data stn-$j-up-recv)"
		echo "    (queue-state-start stn-$j-up-recv)"
		echo "    (queue-state-stop stn-$j-up-recv)"
		echo "    (may-push-ctl stn-$j-up-recv)"
		echo "    (may-push-att stn-$j-up-recv)"
		echo "    (may-push-data stn-$j-up-recv)"
		echo "    (may-push-start stn-$j-up-recv)"
		echo "    (may-push-stop stn-$j-up-recv)"
		echo "    (may-pop stn-$j-up-recv))"
	    fi
	    if [[ $i -gt 1 ]]; then
	        # station $i up operator
		echo "  (:set"
		echo "    (station-state-2 stn-$i-up)"
		echo "    (station-state-3 stn-$i-up)"
		echo "    (station-state-5 stn-$i-up)"
		echo "    (station-state-8 stn-$i-up)"
		echo "    (station-state-11 stn-$i-up)"
		echo "    (station-state-12 stn-$i-up)"
		echo "    (station-state-14 stn-$i-up)"
		echo "    (station-state-15 stn-$i-up)"
		echo "    (station-state-17 stn-$i-up)"
		echo "    (station-state-20 stn-$i-up)"
		echo "    (station-state-23 stn-$i-up)"
		echo "    (station-state-24 stn-$i-up)"
		echo "    (station-state-25 stn-$i-up)"
		echo "    (blocked stn-$i-up))"
	    fi
	    i=$((i+1))
	done
    fi
fi

# end of problem
echo " )"
