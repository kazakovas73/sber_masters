#!/bin/bash

echo "START script PID: $$"
regexpid="(?<=_).*?(?=\.)"
pwd=$(pwd)
logsdir="$pwd/logs/"
pidfilename="pid.txt"

if [ ! -s "$pidfilename" ]; then 
    echo -n "$$" >> "$pidfilename"
fi

while true
do
    cpuUsage=$(top -bn1 | awk '/Cpu/{print $2}')
    memUsage=$(free -m | awk '/Mem/{print $3}')

    if [ -z "$(ls -A $logsdir)" ]; then
        touch "$logsdir/log_0.csv"
    else
        filescnt=$(ls -l "logs" | grep ^- | wc -l)
        lastpid=$(grep "." $pidfilename | tail -1)

        #echo "$$ $lastpid"
        if [ $$ != $lastpid ]; then
            touch "$logsdir/log_$filescnt.csv"
            echo -n > "$pidfilename"
            echo -n "$$" >> "$pidfilename"
        fi
    fi
    name=$(ls "$logsdir" | sort -V | tail -n 1)

    echo "$(date +%s); $cpuUsage; $memUsage;" >> "$pwd/logs/$name"

    sleep 10
done
