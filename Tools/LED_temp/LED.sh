#!/bin/sh
cpu_temp_file="/sys/class/thermal/thermal_zone0/temp"
set_led_color() {
    r=$1
    g=$2
    b=$3
    valstr=`printf "%02X%02X%02X" $r $g $b`
    echo "$valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr "\
         "$valstr $valstr $valstr $valstr $valstr $valstr $valstr" > /sys/class/led_anim/frame_hex
}
while true; do
    cpu_temp=$(cat $cpu_temp_file)
    cpu_temp=$((cpu_temp / 1000)) 
    if [ $cpu_temp -le 40 ]; then
        set_led_color 0 255 0  # Green
    elif [ $cpu_temp -le 45 ]; then
        set_led_color 127 255 0  # Chartreuse Green
    elif [ $cpu_temp -le 50 ]; then
        set_led_color 255 255 0  # Yellow
    elif [ $cpu_temp -le 55 ]; then
        set_led_color 255 165 0  # Orange
    elif [ $cpu_temp -le 60 ]; then
        set_led_color 255 140 0  # Dark Orange
    elif [ $cpu_temp -le 65 ]; then
        set_led_color 255 69 0  # Red Orange
    elif [ $cpu_temp -le 70 ]; then
        set_led_color 255 20 0  # Vermilion
    else
        set_led_color 255 0 0  # Red
    fi
    sleep 5
done
