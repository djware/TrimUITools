#!/bin/sh


# The script requires root privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Log the reboot action
LOG_FILE="/path/to/your/logfile.log" # replace with the path to your log file
echo "Rebooting the machine at $(date)" >> "$LOG_FILE"

# Use the 'reboot' command to restart the machine
reboot
