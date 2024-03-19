#!/bin/sh

SCRIPT_NAME=LED.sh

LOG_FILE=/mnt/SDCARD/LEDTemp.log

if pgrep -f $SCRIPT_NAME >/dev/null; then
    echo "$(date): $SCRIPT_NAME is already running." >> $LOG_FILE
else
    echo "$(date): $SCRIPT_NAME not running, starting now..." >> $LOG_FILE
    /bin/sh /mnt/SDCARD/Apps/LED_temp/$SCRIPT_NAME &
fi
