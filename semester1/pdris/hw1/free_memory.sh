#!/bin/bash

regex="(?<=_).*?(?=\.)"
logsdir="$pwd/logs/"
pidfilename="pid.txt"

if [ $1 == "START" ]; then 
	if [ ! -d "logs" ]; then
		mkdir logs
	fi

	if [ ! -f "$pidfilename" ]; then
		touch "$pidfilename"
	fi

	bash start.sh &

elif [ $1 == "STATUS" ]; then 

	if [ ! -f "$pidfilename" ]; then
		echo "The script is not running"
	elif [ -s "$pidfilename" ]; then 
		lastpid=$(cat "$pidfilename")
		echo "PID: $lastpid is running"
	else
		echo "The script is not running"
	fi

elif [ $1 == "STOP" ]; then 

	if [ -z "$(ls -A "logs")" ]; then
		echo "Process was not started!!!"
	else
		lastpid=$(cat "$pidfilename")
		kill -9 $lastpid
		#echo -n > "$pidfilename"
		#echo "" >> "$pidfilename"
		echo "PID: $lastpid was killed"
	fi
	
else
	echo "Invalid command"
fi
 