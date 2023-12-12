#!/bin/bash

# Define the directories to start the search
directories=(
  "/mnt/diskstation/symportal_machine/explorer_data_backups"
  "/mnt/diskstation/symportal_machine/symbiodiniaceaeDB_backups"
  "/mnt/diskstation/symportal_machine/user_rawdata_backups"
)

# Iterate through each directory and find files with the pattern "*.tar.gz" that are older than 7 days, then remove them
for dir in "${directories[@]}"; do
  find "$dir" -type f -name '*.tar.gz' -mtime +3 -exec rm -f {} \;
done
