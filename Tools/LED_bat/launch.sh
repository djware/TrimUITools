#!/bin/sh

SCRIPT_NAME=bat.sh

LOG_FILE=/mnt/SDCARD/LEDBat.log

if pgrep -f $SCRIPT_NAME >/dev/null; then
    echo "$(date): $SCRIPT_NAME is already running." >> $LOG_FILE
else
    echo "$(date): $SCRIPT_NAME not running, starting now..." >> $LOG_FILE
    /bin/sh /mnt/SDCARD/Apps/LED_bat/$SCRIPT_NAME &
fi
