#!/bin/sh

LOG_FILE="/mnt/SDCARD/logologs.log"

# Redirect all output to the log file
exec > $LOG_FILE 2>&1

SOURCE_FILE="/mnt/SDCARD/logo.bmp"
TARGET_PARTITION="/dev/mmcblk0p1"
MOUNT_POINT="/mnt/emmcblk0p1"

# Mount the partition to a temporary mount point
echo "Mounting $TARGET_PARTITION to $MOUNT_POINT..."
mkdir -p $MOUNT_POINT
mount $TARGET_PARTITION $MOUNT_POINT

# Check if mount was successful
if [ $? -ne 0 ]; then
    echo "Failed to mount $TARGET_PARTITION."
    exit 1
fi

# Check if the source file exists
if [ -f $SOURCE_FILE ]; then
    # Move and rename the file
    echo "Moving $SOURCE_FILE to $MOUNT_POINT/bootlogo.bmp..."
    cp $SOURCE_FILE $MOUNT_POINT/bootlogo.bmp

    # Check if move was successful
    if [ $? -ne 0 ]; then
        echo "Failed to move file."
    else
        echo "File moved successfully."
    fi
else
    echo "Source file $SOURCE_FILE does not exist."
fi

# Unmount the partition
echo "Unmounting $TARGET_PARTITION..."
umount $TARGET_PARTITION

# Remove temporary mount point
rmdir $MOUNT_POINT

echo "Script completed."

