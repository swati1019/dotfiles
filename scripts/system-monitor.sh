#!/bin/bash

echo "===== SYSTEM MONITOR ====="
echo ""

echo "--- CPU Usage ---"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " $2 "%"}'

echo ""
echo "--- Memory Usage ---"
free -h | awk '/^Mem/ {print "Total: " $2 "  Used: " $3 "  Free: " $4}'

echo ""
echo "--- Disk Space ---"
df -h / | awk 'NR==2 {print "Total: " $2 "  Used: " $3 "  Free: " $4 "  Usage: " $5}'

echo ""
echo "--- Top 5 Processes ---"
ps aux --sort=-%cpu | awk 'NR<=6 {print $1, $2, $3"%", $11}'

echo ""
echo "=========================="
