#!/bin/bash

print_log(){
	cd utils;
	./log.sh $1 $2;
	cd -;
}

if [ -f logs/latest.log ]; then
	rm logs/latest.log
	touch logs/latest.log
else
	touch logs/latest.log
fi

date=$(date)

screen_name="core"

if ! screen -list | grep -q "core"; then
	screen -d -m -S $screen_name
fi

# opening gnome terminal (just for scene)
gnome-terminal -- /bin/bash -c 'screen -x core; read;'
screen -S core -p 0 -X stuff $'clear^M\ntail -f logs/latest.log^M'

print_log "green" "Starting core on $date"
print_log "green" "Core has been started"
