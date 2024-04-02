#!/bin/sh
RC_LOCAL_PATH="/etc/rc.local"
FTP_COMMAND="tcpsvd -vE 0.0.0.0 21 ftpd -w /mnt/SDCARD"

FTP_SERVER_SETUP="# Start FTP server on boot
$FTP_COMMAND"

if ! grep -qF -- "$FTP_COMMAND" "$RC_LOCAL_PATH"; then
    echo "Appending FTP server setup command to $RC_LOCAL_PATH..."
    sed -i '/exit 0/d' "$RC_LOCAL_PATH"
    echo "$FTP_SERVER_SETUP" >> "$RC_LOCAL_PATH"
    echo "exit 0" >> "$RC_LOCAL_PATH"
    echo "FTP server setup command added to $RC_LOCAL_PATH."
else
    echo "FTP server setup command is already present in $RC_LOCAL_PATH."
fi
