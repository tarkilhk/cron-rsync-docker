#!/bin/sh

# Write a new crontab file
echo "${CRON_FREQUENCY} /path/to/rsync-script.sh >> /var/log/cron.log 2>&1" > /etc/crontab

# Start the cron service
cron -f