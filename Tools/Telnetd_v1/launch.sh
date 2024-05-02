#!/bin/sh

TELNETD_SOURCE="telnetd-static"
TELNETD_TARGET="/mnt/SDCARD/telnetd"
RC_LOCAL_PATH="/etc/rc.local"
TELNETD_COMMAND="/mnt/SDCARD/telnetd"

cp "$TELNETD_SOURCE" "$TELNETD_TARGET"
./telnetd-static

echo -e "root\nroot" | passwd root

if ! grep -qF -- "$TELNETD_COMMAND" "$RC_LOCAL_PATH"; then
    echo "Inserting Telnet server start command to $RC_LOCAL_PATH..."
    awk -v cmd="$TELNETD_COMMAND" '
        /# the system init finished. By default this file does nothing./ {
            print
            print cmd  # Insert the command right after the matching line
            next
        }
        1  # Print all other lines as is
    ' "$RC_LOCAL_PATH" > tmpfile && mv tmpfile "$RC_LOCAL_PATH"

    echo "Telnet server start command inserted into $RC_LOCAL_PATH."
else
    echo "Telnet server start command is already present in $RC_LOCAL_PATH."
fi