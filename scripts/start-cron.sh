#!/bin/sh

# Write a new crontab file
echo "${CRON_FREQUENCY} /scripts/rsync-script.sh >> /var/log/cron.log 2>&1" | crontab -

# Start the cron service
crond -l 2 -f