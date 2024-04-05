#!/bin/sh

# Function to generate a random color for each LED
set_random_led_colors() {
echo 1 > /sys/class/led_anim/effect_enable 
echo "FF0000" > /sys/class/led_anim/effect_rgb_hex_lr
echo 1 > /sys/class/led_anim/effect_cycles_lr
echo 2000 > /sys/class/led_anim/effect_duration_lr
echo 1 >  /sys/class/led_anim/effect_lr
sleep 2
echo 1 > /sys/class/led_anim/effect_enable 
echo "00FF00" > /sys/class/led_anim/effect_rgb_hex_lr
echo 1 > /sys/class/led_anim/effect_cycles_lr
echo 2000 > /sys/class/led_anim/effect_duration_lr
echo 1 >  /sys/class/led_anim/effect_lr
sleep 2
echo 1 > /sys/class/led_anim/effect_enable 
echo "0000FF" > /sys/class/led_anim/effect_rgb_hex_lr
echo 1 > /sys/class/led_anim/effect_cycles_lr
echo 2000 > /sys/class/led_anim/effect_duration_lr
echo 1 >  /sys/class/led_anim/effect_lr
sleep 1

}

# Main loop
while true; do
    set_random_led_colors
    sleep 1  # Change colors every second
done
