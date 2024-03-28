FROM ubuntu:latest

# Install rsync and cron
RUN apt-get update && apt-get install -y rsync cron

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/rsync-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/rsync-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Install your script
ADD rsync-script.sh /rsync-script.sh
RUN chmod +x /rsync-script.sh

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log