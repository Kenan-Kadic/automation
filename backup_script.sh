#!/bin/bash

#Make a backup of a directory with a time stamp

# Prompt user for directories
read -p "Enter the source directory path: " SOURCE_DIRECTORY
read -p "Enter the backup directory path: " BACKUP_DIRECTORY

# Create a timestamp
TIMESTAMP=$(date +%Y%m%d%H%M%S)

# Create a backup name with the timestamp
BACKUP_NAME="backup-${TIMESTAMP}"

# Copy the directory to the backup location
cp -a "${SOURCE_DIRECTORY}" "${BACKUP_DIRECTORY}/${BACKUP_NAME}"

#print out text stating backup has been created
echo "Backup of ${SOURCE_DIRECTORY} was created at ${BACKUP_DIRECTORY}/${BACKUP_NAME}"

