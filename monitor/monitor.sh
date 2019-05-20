#!/bin/bash

temp=""

print_log(){
	cd /home/colasuonno/Desktop/Dev/general_project/Core/utils;
	if [ ${#@} -gt 2 ]; then
		temp=`./log.sh $1 $2 $3`
	else
		./log.sh $1 $2
	fi
	cd -
}

print_log "white" "Waiting for monitor response..."
sleep 3
print_log "get" "green" "OK"
print_log "Core Status.. $temp"