#!/bin/bash

if [ $1 == "START" ]; then 
	cpuUsage=$(top -bn1 | awk '/Cpu/{print $2}')
	memUsage=$(free -m | awk '/Mem/{print$3}')
	echo "$(date +%s); $cpuUsage; $memUsage;" >> log.csv
elif [ $1 == "STATUS" ]; then 
	echo "Command is $1"
elif [ $1 == "STOP" ]; then 
	echo "Command is $1"
else
	echo "WRONG COMMAND"
fi
 