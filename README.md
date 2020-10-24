# Raspberry Pi Live Backup  
  
This is a simple bash script to create a live backup of your Raspberry Pi SD card.  
I have also included basic instructions for setting up a CRON job for automated backups.  

## Considerations:  
There are concerns that you should be aware of when you create a live backup of your running system, but I am not going to cover those here. I figure if you're here looking for a live backup script, you have also taken a look at and understand what you're getting yourself into. If you haven't researched the possible issues, I recommend you do so before using this script.  

## Permissions
This script needs to be owned by root and run as root. If you're using CRON to automate the backup process, you need to insert it into the root crontab file.  

## Where I store my root scripts  
This script and others like it are stored in `/opt/scripts`  

## Creating the file
If you don't want to worry about changingg file permissions, you can create an empty file shell with `sudo touch backup_sd.sh  
Then, using the editor of your choice, open the file and paste in the code from the backup_sd.sh file.  
Save and test as desired   

## CRON
If you want to add a CRON job to automate running this script, open the root user's crontab with: `sudo crontab -e`  
Scroll to the bottom of the file and add the following line:  
`50 23 1 * *   /opt/scripts/backup_sd.sh >/dev/null 2>&1`  
With the above statement, the script will run at 11:50pm on the first of each month

Enjoy! If you have questions, let me know.
