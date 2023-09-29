#!/bin/bash

echo "START script PID: $$"
regexpid="(?<=_).*?(?=\.)"
pwd=$(pwd)
logsdir="$pwd/logs/"

while true
do
    cpuUsage=$(top -bn1 | awk '/Cpu/{print $2}')
    memUsage=$(free -m | awk '/Mem/{print $3}')

    if [ -z "$(ls -A $logsdir)" ]; then
        touch "$logsdir/log(0)_$$.csv"
    else
        filescnt=$(ls -l "logs" | grep ^- | wc -l)
        lastlogfilename=$(ls "logs" | sort -V | tail -n 1)
        lastpid=$(echo $lastlogfilename | grep -Po $regexpid)

        if [ "$$" != "$lastpid" ]; then
            touch "$logsdir/log($filescnt)_$$.csv"
        fi
    fi
    name=$(ls "$logsdir" | sort -V | tail -n 1)

    echo "$(date +%s); $cpuUsage; $memUsage;" >> "$pwd/logs/$name"

    sleep 10
done
