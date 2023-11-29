#!/bin/bash

# Log file
log_file="/mnt/synology_backup.log"

# Source directories
source_directories=(
    "/mnt/prod/db_backups"
    "/mnt/prod/explorer_data"
    "/mnt/prod/symbiodiniaceaeDB"
)

# Destination directories
destination_base_dir="/mnt/diskstation/symportal_machine"
db_backups_dir="${destination_base_dir}/db_backups_backups"
explorer_data_dir="${destination_base_dir}/explorer_data_backups"
symbiodiniaceaeDB_dir="${destination_base_dir}/symbiodiniaceaeDB_backups"
user_rawdata_dir="${destination_base_dir}/user_rawdata_backups"

# Echo statements
echo "Creating destination directories if they don't exist..."
mkdir -p "${db_backups_dir}" && echo "Created ${db_backups_dir}"
mkdir -p "${explorer_data_dir}" && echo "Created ${explorer_data_dir}"
mkdir -p "${symbiodiniaceaeDB_dir}" && echo "Created ${symbiodiniaceaeDB_dir}"
mkdir -p "${user_rawdata_dir}" && echo "Created ${user_rawdata_dir}"

# Create or append to the log file
touch "${log_file}"

# Loop through each source and destination pair for db_backups, explorer_data, and symbiodiniaceaeDB
for source_dir in "${source_directories[@]}"; do
    destination_dir="${destination_base_dir}/$(basename "${source_dir}")_backups"

    # Echo before creating archive
    echo "Creating archive for ${source_dir}..." >> "${log_file}"

    # Create archive
    archive_name="${destination_dir}/$(basename ${source_dir})_$(date +"%Y%m%d").tar.gz"
    tar -czf "${archive_name}" -C "$(dirname ${source_dir})" "$(basename ${source_dir})" && echo "Created archive: ${archive_name}"

    # Log backup information
    echo "$(date +"%Y-%m-%d %H:%M:%S"): Backup of ${source_dir} completed. Archive saved to ${archive_name}" >> "${log_file}"
done

# Echo before creating archive for the rest of the content in /mnt/prod
echo "Creating archive for the rest of the content in /mnt/prod..." >> "${log_file}"
user_rawdata_archive_name="${user_rawdata_dir}/user_rawdata_backup_$(date +"%Y%m%d").tar.gz"
tar -czf "${user_rawdata_archive_name}" --exclude="${source_directories[*]}" -C /mnt/prod . && echo "Created archive: ${user_rawdata_archive_name}"

# Log backup information
echo "$(date +"%Y-%m-%d %H:%M:%S"): Backup of user_rawdata in /mnt/prod completed. Archive saved to ${user_rawdata_archive_name}" >> "${log_file}"

echo "Backup process completed. Log file: ${log_file}"
