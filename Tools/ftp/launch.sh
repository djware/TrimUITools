#!/bin/sh
FTP_COMMAND="tcpsvd -vE 0.0.0.0 21 ftpd -w /mnt/SDCARD"
IDLE_TIME=300 
FTP_PORT=21
LOG_FILE="/mnt/SDCARD/ftp_idle.log"
# edit the below code if you want to reset your root password
# echo -e "root\nroot" | passwd root
if pgrep -f "$FTP_COMMAND" > /dev/null; then
    echo "FTP service is running."
else
    echo "FTP service is not running. Starting it..."
    $FTP_COMMAND &
fi

(
    while :; do
        if ! netstat -ant | grep -q ":$FTP_PORT.*ESTABLISHED"; then
            if [ ! -f "/tmp/ftp_idle" ]; then
                date +%s > "/tmp/ftp_idle"
            elif [ $(($(date +%s) - $(cat "/tmp/ftp_idle"))) -gt $IDLE_TIME ]; then
                echo "$(date) - FTP service idle for $IDLE_TIME seconds, stopping." >> "$LOG_FILE"
                pkill -f "$FTP_COMMAND"
                rm "/tmp/ftp_idle"
                exit 0  
            fi
        else
            rm -f "/tmp/ftp_idle"
        fi
        sleep 60
    done
) &

echo "FTP monitoring is now running in the background."
