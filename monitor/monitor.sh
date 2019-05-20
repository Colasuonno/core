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
color="white"
status_core=`bash /home/colasuonno/Desktop/Dev/general_project/Core/core_state.sh check`
echo $status_core
if [[ $status_core  =~ "stop" ]]; then
	color="red"
else
	color="green"
fi
print_log "get" $color $status_core
print_log "Core Status.. $temp"
#print_log "green" "Loading usb connected.."
#sleep 2
#perl usb.pl getting usb info
