#!/bin/sh

LOG_FILE="/mnt/SDCARD/logologs.log"

exec > $LOG_FILE 2>&1

SOURCE_FILE="/mnt/SDCARD/logo.bmp"
ALTERNATIVE_SOURCE_FILE="/mnt/UDISK/logo.bmp"
TARGET_PARTITION="/dev/mmcblk0p1"
MOUNT_POINT="/mnt/emmcblk0p1"

echo "Mounting $TARGET_PARTITION to $MOUNT_POINT..."
mkdir -p $MOUNT_POINT
mount $TARGET_PARTITION $MOUNT_POINT

if [ $? -ne 0 ]; then
    echo "Failed to mount $TARGET_PARTITION."
    exit 1
fi

if [ -f $SOURCE_FILE ]; then
    echo "Moving $SOURCE_FILE to $MOUNT_POINT/bootlogo.bmp..."
    cp $SOURCE_FILE $MOUNT_POINT/bootlogo.bmp
elif [ -f $ALTERNATIVE_SOURCE_FILE ]; then
    echo "Moving $ALTERNATIVE_SOURCE_FILE to $MOUNT_POINT/bootlogo.bmp..."
    cp $ALTERNATIVE_SOURCE_FILE $MOUNT_POINT/bootlogo.bmp
else
    echo "Source file does not exist in /mnt/SDCARD or /mnt/UDISK."
    echo "Unmounting $TARGET_PARTITION..."
    umount $TARGET_PARTITION
    rmdir $MOUNT_POINT
    exit 1
fi


if [ $? -ne 0 ]; then
    echo "Failed to move file."
else
    echo "File moved successfully."
fi

echo "Unmounting $TARGET_PARTITION..."
umount $TARGET_PARTITION

rmdir $MOUNT_POINT

echo "Script completed."
