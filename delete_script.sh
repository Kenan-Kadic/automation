#!/bin/bash

# Prompt user for the directory to clean and file age
read -p "Enter the directory to clean: " DIRECTORY
read -p "Enter the file age in days to delete: " FILE_AGE_DAYS

# Ensure user provided a directory
if [[ -z "$DIRECTORY" ]]; then
  echo "Directory is required. Exiting."
  exit 1
fi

# Ensure user provided a valid number for file age
if ! [[ "$FILE_AGE_DAYS" =~ ^[0-9]+$ ]]; then
  echo "File age must be a valid number. Exiting."
  exit 1
fi

# Find and delete files older than the specified number of days
find "${DIRECTORY}" -type f -mtime +"${FILE_AGE_DAYS}" -exec rm -f {} \;

echo "Files older than ${FILE_AGE_DAYS} days have been deleted from ${DIRECTORY}."
