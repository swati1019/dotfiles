#!/bin/bash

echo -e "\e[1;36m===== SYSTEM MONITOR =====\e[0m"
echo ""

echo "--- CPU Usage ---"
top -bn1 | awk '/%Cpu/{print "\033[32mCPU Usage: " $2 "%\033[0m"}'

echo ""
echo "--- Memory Usage ---"
free -h | awk '/^Mem/ {print "\033[32mTotal: " $2 "\033[0m \033[31mUsed: " $3 "\033[0m \033[32mFree: " $4"\033[0m"}'

echo ""
echo "--- Disk Space ---"
df -h / | awk 'NR==2 {print "Total: " $2 "  Used: " $3 "  Free: " $4 "  Usage: " $5}'

echo ""
echo "--- Top 5 Processes ---"
ps aux --sort=-%cpu | awk 'NR<=6 {print $1, $2, $3"%", $11}'

echo ""
echo "==========================="
