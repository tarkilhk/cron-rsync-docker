#!/bin/sh

# Write a new crontab file
echo "${CRON_FREQUENCY} /scripts/rsync-script.sh >> /proc/1/fd/1 2>&1" | crontab -

# Run the script once immediately
echo "Running initial sync..."
/scripts/rsync-script.sh >> /proc/1/fd/1 2>&1

# Start the cron service
echo "Starting cron daemon..."
crond -l 2 -f