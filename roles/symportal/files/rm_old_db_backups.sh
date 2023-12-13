#!/bin/bash

# Log file
log_file="/mnt/synology_backup.log"

# Create or append to the log file
touch "${log_file}"

# Define the directory to start the search
base_dir="/mnt/diskstation/symportal_machine"

for folder in ${base_dir}/*_backups; do
    echo "$(date +"%Y-%m-%d %H:%M:%S"): Removing old backups in " ${folder} >> ${log_file}
    # Find files with names starting with "*.tar.gz" that are older than 3 days and remove them
    find $folder -type f -name '*.tar.gz' -mtime +3 -exec rm -fv {} \; >> ${log_file}
done
