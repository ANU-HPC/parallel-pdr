# takes the directory of the instance files as the argument
# if multiple version of this script run, they can intersect, getting to processors first, leading the kill commands to fail

user_id=`id -u`
all_user_PIDs=`ps -u $user_id | grep pdrDagster | awk '{print $1}'`

for PID in `ps -aux | grep $1 | grep pdrDagster | awk '{print $2}'`
do
    for user_PID in $all_user_PIDs
    do
        if [ $user_PID -eq $PID ]
        then
            echo trying to kill $PID
            kill $PID
        fi
    done
done
