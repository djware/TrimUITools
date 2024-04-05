#!/bin/sh
LOG_FILE="/mnt/SDCARD/CPU.log"

while true; do

    echo performance > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
    log_message "Set CPU governor to performance."
    for CPU in /sys/devices/system/cpu/cpu[0-3]; do
        # Set minimum frequency
        echo -n "2000000" > "$CPU"/cpufreq/scaling_min_freq
        log_message "Set minimum CPU frequency to 2000000 for $CPU."

        echo -n "2000000" > "$CPU"/cpufreq/scaling_max_freq
        log_message "Set maximum CPU frequency to 2000000 for $CPU."
    done
    sleep 1
done