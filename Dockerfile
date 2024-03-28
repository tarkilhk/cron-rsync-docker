# Use the Alpine base image
FROM alpine:latest

# Install cron, rsync, and bash
RUN apk add --no-cache rsync bash

# Copy the rsync script and the start-cron script into the Docker image
COPY scripts/rsync-script.sh /scripts/rsync-script.sh
COPY scripts/start-cron.sh /scripts/start-cron.sh

# Make the scripts executable
RUN chmod +x /scripts/rsync-script.sh /scripts/start-cron.sh

# piped logfile into PID 1 in order to see log content in docker logs
RUN touch /var/log/cron.log
RUN ln -sf /proc/1/fd/1 /var/log/cron.log

# Run the start-cron script when the container starts
CMD ["/scripts/start-cron.sh"]