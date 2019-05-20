#!/bin/bash

function prop {
    grep "${1}" info.properties|cut -d'=' -f2
}

# Just getting app state
state=$(prop 'status')

invalid_synax(){
	echo Error: Syntax Error
}

if [ ${#@} -gt 0 ]; then
	case $1 in
		"check") echo $state
	;;
		"set")
			if [ ${#@} -gt 1 ]; then
				sed -i "/status=/ s/=.*/=${2}/" info.properties
				echo "done"
			else
				invalid_synax
			fi 
	;;
		*) invalid_synax
	;;
	esac		
else
	invalid_synax
fi