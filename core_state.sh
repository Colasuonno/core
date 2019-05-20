#!/bin/bash

function prop {
    cd /home/colasuonno/Desktop/Dev/general_project/Core
    grep "${1}" info.properties|cut -d'=' -f2
    cd -
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
