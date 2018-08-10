# inotifywait
Execute rsync when file changed

## Prerequisites

Please install inotifywait (https://linux.die.net/man/1/inotifywait) first


## Getting started

1. Create folder **/home/oracle/tmps**

2. Put script **sync_10.4.18.101.sh** in to home directory (~)

3. Running inotifywait
```bash
	./check_change.sh
```
4. Script **sync_10.4.18.101.sh** will be executed when you change anything in folder **~/tmps** 

5. Have fun.