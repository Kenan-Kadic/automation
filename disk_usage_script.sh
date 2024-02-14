#!/bin/bash

# Set the threshold for disk usage (e.g., 80%)
THRESHOLD=80

# Set the partition to monitor, for example, '/' for the root partition
PARTITION="/"

# Get the current disk usage percentage for the partition, removing the '%' sign
CURRENT_USAGE=$(df -h "$PARTITION" | grep -v Filesystem | awk '{ print $5 }' | sed 's/%//g')

# Compare current disk usage with the threshold
if [ "$CURRENT_USAGE" -gt "$THRESHOLD" ]; then
    echo "Disk usage alert for $PARTITION: Current usage is at $CURRENT_USAGE%"
    # Here you could add a command to send an email, log this event, or perform some cleanup
else
    echo "Disk usage for $PARTITION is within acceptable limits: $CURRENT_USAGE%"
fi
