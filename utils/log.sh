#!/bin/bash

escape_key=""

get_key(){
	case $1 in
		red) result='[0;31;1m'
		;;
		green) result='[0;32;1m'
		;;
		*) result='[0;30;1m'
		;;
	esac
}

full=$@
color=$1
built_string=${full/$color/}

if [ ${#@} -gt 1 ]; then
	if [[ $1 == "get" ]]; then
		get_key "$2"
		color=$2
		built_string=${full/$color/}
		built_string=${built_string/get/}
		reduced=${built_string#?}
		echo $escape_key$result${reduced#?}
	else
		get_key "$1"
		echo $escape_key$result${built_string#?} >> ../logs/latest.log
	fi
else
	echo $1 >> ../logs/latest.log
fi
