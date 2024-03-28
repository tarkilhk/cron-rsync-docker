FROM alpine:latest

# Install rsync and cron
RUN apk update && apk add rsync dcron

# Add crontab file in the cron directory
ADD crontab /etc/crontabs/root

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Install your script
ADD rsync-script.sh /rsync-script.sh
RUN chmod +x /rsync-script.sh

# Run the command on container startup
CMD crond && tail -f /var/log/cron.log