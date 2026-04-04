#!/bin/bash

LOG_DIR="/var/log"
ARCHIVE_DIR="/var/log/archive"
MAX_AGE_DAYS=3
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOGFILE="/var/log/cleaner.log"

mkdir -p "$ARCHIVE_DIR"

echo "[$TIMESTAMP] Starting log cleaner.." >> "$LOGFILE"

find "$LOG_DIR" -maxdepth 1 -type f -mtime +$MAX_AGE_DAYS | while read FILE; do
FILENAME=$(basename "$FILE")
tar -czf "$ARCHIVE_DIR/${FILENAME}_${TIMESTAMP}.tar.gz" "$FILE"
rm "$FILE"
echo "[$TIMESTAMP] Archived: $FILENAME" >> "$LOGFILE"
done

echo "[$TIMESTAMP] Done." >> "$LOGFILE"

