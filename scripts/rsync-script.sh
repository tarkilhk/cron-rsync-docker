#!/bin/sh

# Path to the lock file
LOCKFILE=/tmp/rsync.lock

# Check if the lock file exists
if [ -e "${LOCKFILE}" ]; then
    # The lock file exists, so exit
    echo "Another instance is already running"
    exit 1
else
    # The lock file doesn't exist, so create it and continue running
    touch "${LOCKFILE}"

    # Perform the rsync operation here
    # Replace the following line with your actual rsync command
    rsync -avz $SOURCE_DIR/ $DEST_DIR >> /dev/stdout

    # Delete the lock file
    rm "${LOCKFILE}"
fi
