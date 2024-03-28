#!/bin/sh

# Write a new crontab file
echo "${CRON_FREQUENCY} /scripts/rsync-script.sh >> /proc/1/fd/1 2>&1" | crontab -

# Start the cron service
crond -l 2 -f