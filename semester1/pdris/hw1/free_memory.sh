#!/bin/bash

regex="(?<=_).*?(?=\.)"
logsdir="$pwd/logs/"

if [ $1 == "START" ]; then 
	if [ ! -d "logs" ]; then
		mkdir logs
	fi
	bash start.sh &

elif [ $1 == "STATUS" ]; then 
	lastlogfilename=$(ls "logs" | sort -V | tail -n 1)
	lastpid=$(echo $lastlogfilename | grep -Po $regex)

	if ps -p $lastpid > /dev/null
	then
		echo "PID: $lastpid is running"
	else
		echo "The script is not running"
	fi
elif [ $1 == "STOP" ]; then 

	if [ -z "$(ls -A "logs")" ]; then
		echo "Process was not started!!!"
	else
		lastlogfilename=$(ls "logs" | sort -V | tail -n 1)
		lastpid=$(echo $lastlogfilename | grep -Po $regex)
		kill -9 $lastpid
		echo "PID: $lastpid was killed"
	fi
	
else
	echo "Invalid command"
fi
 