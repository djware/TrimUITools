#!/bin/sh
RC_LOCAL_PATH="/etc/rc.local"
# Update the mac address to what you want
UNIQUE_COMMAND="ifconfig wlan0 hw ether e4:6a:f6:6f:d2:42"

MAC_COMMANDS="# Set static MAC address for wlan0
ifconfig wlan0 down
$UNIQUE_COMMAND
ifconfig wlan0 up"

if ! grep -qF -- "$UNIQUE_COMMAND" "$RC_LOCAL_PATH"; then
    echo "Appending static MAC address commands to $RC_LOCAL_PATH..."
    sed -i '/exit 0/d' "$RC_LOCAL_PATH"
    echo "$MAC_COMMANDS" >> "$RC_LOCAL_PATH"
    echo "exit 0" >> "$RC_LOCAL_PATH"
    echo "Static MAC address commands added to $RC_LOCAL_PATH."
else
    echo "Static MAC address commands are already present in $RC_LOCAL_PATH."
fi
