#! /bin/bash

process="sleep"
log="/var/watchdog.log"
while true; do
timestamp=$(date +"%Y-%m-%d_%H_%M_%S")
if ! pgrep -x "$process" > /dev/null; then 
echo "[$timestamp] $process not found Restarting..." >> $log
$process 60 &
echo "[$timestamp] $process restarted!!" >> $log
else 
echo "[$timestamp] $process is running fine." >> $log
fi
sleep 10
done 

