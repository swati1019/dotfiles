#! /bin/bash

process="sleep"
log="/var/watchdog.log"
timestamp=$(date +"%Y-%m-%d_%H_%M_%S")
while true; do
if ! pgrep -x "$process" > /dev/null; then 
echo "[$timestamp] $process not fount Restarting..." >> $log
$process 60 &
echo "[$timestamp] $process restarted!!" >> $log
else 
echo "[$timestamp] $process is running fine." >> $log
fi
sleep 10
done 

