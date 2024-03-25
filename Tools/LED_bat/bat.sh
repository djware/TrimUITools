#!/bin/sh
battery_capacity_file="/sys/devices/platform/soc/7081400.s_twi/i2c-6/6-0034/axp2202-bat-power-supply.0/power_supply/axp2202-battery/capacity"
set_led_color() {
    r=$1
    g=$2
    b=$3
    valstr=`printf "%02X%02X%02X" $r $g $b`
    echo "$valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr $valstr "\
         "$valstr $valstr $valstr $valstr $valstr $valstr $valstr" > /sys/class/led_anim/frame_hex
}
while true; do
    battery_level=$(cat $battery_capacity_file)
    
    case $battery_level in
        100|9[0-9]) set_led_color 0 255 0 ;; # Green
        8[0-9]|7[0-9]) set_led_color 127 255 0 ;; # Chartreuse Green
        6[0-9]) set_led_color 255 255 0 ;; # Yellow
        5[0-9]) set_led_color 255 165 0 ;; # Orange
        4[0-9]) set_led_color 255 140 0 ;; # Dark Orange
        3[0-9]) set_led_color 255 69 0 ;; # Red Orange
        2[0-9]) set_led_color 255 20 0 ;; # Vermilion
        *) set_led_color 255 0 0 ;; # Red
    esac  
    sleep 60 
done
