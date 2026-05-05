#! /bin/bash

SOURCE="/home/swati"
BACKUP_DIR="/var/backup"
LOG="/var/log/backup.log"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

mkdir -p $BACKUP_DIR

echo "[$TIMESTAMP] BACKUP STARTED" >> $LOG
rsync -av --exclude='.git' $SOURCE $BACKUP_DIR >> $LOG 2>&1

echo "[$TIMESTAMP] BACKUP FINISHED" >> $LOG
echo "DONE CHECK $LOG FOR DETAILS"
