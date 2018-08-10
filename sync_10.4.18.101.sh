#!/bin/bash
#OPTIONS='-rv'
OPTIONS='-avz'

rsync "$OPTIONS" ~/tmps/ -e ssh oracle@10.4.18.101:tmps #--delete
rsync "$OPTIONS" ~/tmps/ -e ssh oracle@10.4.18.114:tmps #--delete
rsync "$OPTIONS" ~/tmps/ -e ssh oracle@10.4.18.113:tmps #--delete

max=10000
log="/home/oracle/sync.log" # Absolute path required

touch "$log"
count=$(wc -l "$log" | cut -d " " -f1)
if [[ "$count" -ge "$max" ]] ; then
	tail -n "$max" "$log" > "$log"
fi
