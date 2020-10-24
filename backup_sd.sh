#!/bin/bash

# This will backup the active boot Micro SD card to the external hard drive

# This script is stored in /opt/scripts
# The file needs to be owned and run as root
# Create the empty file shell with `sudo touch backup_sd.sh
# Edit the script as root and paste in the contents of this file
# Save and test as desired
# If you want to add a CRON job to automate running this script, open the root user's crontab with:
# `sudo crontab -e`
# Scroll to the bottom of the file and add the following line:
# 50 23 1 * *   /opt/scripts/backup_sd.sh >/dev/null 2>&1
# The statement will run the script at 11:50pm on the first of each month
#Enjoy

# Backup script starts here:
# Set up a variable to store the current date
 dte=$(date +%Y%m%d)

echo "$dte"
echo

# Create the filename for the backup file, inserting date variable
# Naming convention has host name as the initial part of the name to enable easy sorting and finding
fname="/mnt/10tb/RPiBak/rpi4.$dte.img.gz"
echo "$fname"

# Maybe not needed, but I change to the root directory because I was getting an error initially.
cd /

echo
# The next line is the original statement that would be used to create a compressed backup file
# You could also do this without compressing, but I wanted to save the space
# sudo dd if="/dev/mmcblk0" | gzip -1 - | sudo dd of="$fname"
dd if="/dev/mmcblk0" | gzip -1 - | dd of="$fname"

# This is a bit of cleanup to get rid of extra backups that are older than I think I need to keep
# Because I have the CRON job set to run each month, I keep only the last 90 days.
# This Pi doesn't change much and I back up data other ways

if [ $result = 0 ]; then
#   echo "Successful backup, previous backup files will be deleted."
    #Delete old backups first to ensure there is a backup done afterward
    sudo find /mnt/10tb/RPiBak/* -mtime +90 -exec rm {} \;
   exit 0
# Else remove attempted backup file
else
   echo "Backup failed! Previous backup files untouched."
   echo "Please check there is sufficient space on the HDD."
   exit 1
fi
