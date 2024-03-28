# Use the Alpine base image
FROM alpine:latest

# Install cron
RUN apk add --no-cache dcron

# Copy the rsync script and the start-cron script into the Docker image
COPY rsync-script.sh /path/to/rsync-script.sh
COPY start-cron.sh /start-cron.sh

# Make the scripts executable
RUN chmod +x /path/to/rsync-script.sh /start-cron.sh

# Run the start-cron script when the container starts
CMD ["/start-cron.sh"]