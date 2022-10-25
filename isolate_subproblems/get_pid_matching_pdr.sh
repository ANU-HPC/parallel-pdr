# takes the directory of the instance files as the argument

user_id=`id -u`
all_user_PIDs=`ps -u $user_id | grep pdrDagster | awk '{print $1}'`
#echo $all_user_PIDs

for PID in `ps -aux | grep $1 | grep pdrDagster | grep -v "T    " | awk '{print $2}'`
do
    for user_PID in $all_user_PIDs
    do
        if [ $user_PID -eq $PID ]
        then
            echo $PID
        fi
    done
done
