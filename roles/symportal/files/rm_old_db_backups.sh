#!/bin/bash

# Define the directory to start the search
base_dir="/mnt/prod/db_backups"

# Find files with names starting with "backup" that are older than 7 days and remove them
find "$base_dir" -type f -name 'backup-*' -mtime +7 -exec rm -f {} \;
