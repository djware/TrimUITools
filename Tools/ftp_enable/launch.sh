#!/bin/sh
RC_LOCAL_PATH="/etc/rc.local"
FTP_COMMAND="tcpsvd -vE 0.0.0.0 21 ftpd -w /mnt/SDCARD"

# Set the root password
echo -e "root\nroot" | passwd root

FTP_SERVER_SETUP="$FTP_COMMAND"

if grep -qF -- "$FTP_COMMAND" "$RC_LOCAL_PATH"; then
    echo "FTP server setup command is already present in $RC_LOCAL_PATH. Removing it..."
    sed -i "/$(echo "$FTP_COMMAND" | sed 's/[\/&]/\\&/g')/d" "$RC_LOCAL_PATH"
else
    echo "Appending FTP server setup command to $RC_LOCAL_PATH..."
    sed -i '/exit 0/d' "$RC_LOCAL_PATH"
    echo "$FTP_SERVER_SETUP" >> "$RC_LOCAL_PATH"
    echo "exit 0" >> "$RC_LOCAL_PATH"
    echo "FTP server setup command added to $RC_LOCAL_PATH."
fi
