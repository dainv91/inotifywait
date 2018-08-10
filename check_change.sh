#!/bin/bash
# Added 20180810 - DaiNV

_MONITOR_FOLDER="/home/oracle/tmps" # Using absolute path
_LOG_FILE="monitor.log"

check_log_file() {
	max=10000
	log="$_LOG_FILE"

	#touch "$log"

	count=$(wc -l "$log" | cut -d " " -f1)
	if [ "$count" -ge "$max" ]; then
        	tail -n "$max" "$log" > "$log"
	fi
}

monitor() {
	folder="$1"
	inotifywait -m --exclude "$_LOG_FILE" -r -e create,delete,delete_self,modify,moved_to --format "%w%f" "$folder" |
	while read NEW_FILE; do
		now=$(date +%Y%m%d_%H%M%S)
        	echo "$now: File $NEW_FILE created or changed"

		check_log_file

		~/sync_10.4.18.101.sh >> ~/sync.log
	done
}

touch "$_LOG_FILE"
monitor "$_MONITOR_FOLDER" > "$_LOG_FILE" 2>&1 &
