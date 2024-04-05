#!/bin/sh

SCRIPT_NAME=cpu.sh

if pgrep -f $SCRIPT_NAME >/dev/null; then
    echo "$(date): $SCRIPT_NAME is already running." >> $LOG_FILE
else
    echo "$(date): $SCRIPT_NAME not running, starting now..." >> $LOG_FILE
    /bin/sh /mnt/SDCARD/Apps/Max_CPU/$SCRIPT_NAME &
    echo 1 > /sys/class/led_anim/effect_enable 
echo "00FF00" > /sys/class/led_anim/effect_rgb_hex_lr
echo 1 > /sys/class/led_anim/effect_cycles_lr
echo 1000 > /sys/class/led_anim/effect_duration_lr
echo 1 >  /sys/class/led_anim/effect_lr
fi
