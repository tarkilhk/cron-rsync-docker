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

    echo "Starting rsync operation" | logger

    # Perform the rsync operation here
    rsync -avz $SOURCE_DIR/ $DEST_DIR 2>&1 | logger

    echo "Finished rsync operation" | logger

    # Delete the lock file
    rm "${LOCKFILE}"
fi
