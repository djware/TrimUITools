#!/bin/sh

if [[ $EUID -ne 0 ]]; then
   exit 1
fi

LOG_FILE="/path/to/your/logfile.log" 
echo "Rebooting the machine at $(date)" >> "$LOG_FILE"

reboot
