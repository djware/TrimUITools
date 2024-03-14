#!/bin/sh

LOG_FILE="/mnt/SDCARD/USBLog.log"

# Start logging to the LOG_FILE
exec >> $LOG_FILE 2>&1

echo "=============================================="
date '+%Y-%m-%d %H:%M:%S'
echo "Starting operations for SD card and internal eMMC via existing USB gadget..."
echo "=============================================="


GADGET_PATH="/sys/kernel/config/usb_gadget/g1"
DEV_EMMC="/dev/by-name/UDISK"


configure_usb_gadget() {

    if [ ! -d "$GADGET_PATH" ]; then
        echo "USB gadget directory does not exist. Creating..."
        mkdir -p "$GADGET_PATH"
        echo "USB gadget directory created."
    fi

    MASS_STORAGE_PATH="$GADGET_PATH/functions/mass_storage.usb0"

    if [ ! -d "$MASS_STORAGE_PATH" ]; then
        echo "Creating mass storage function..."
        mkdir -p "$MASS_STORAGE_PATH"
        echo "Mass storage function created."
    fi

    echo "Configuring Lun for eMMC..."
    if [ ! -d "$MASS_STORAGE_PATH/Lun.1" ]; then
        mkdir -p "$MASS_STORAGE_PATH/Lun.1"
        echo "Lun.1 directory created."
    fi
    echo $DEV_EMMC > "$MASS_STORAGE_PATH/Lun.1/file"
    echo "eMMC device configured for Lun.1."




    sync
    echo "USB gadget configuration completed."
}

configure_usb_gadget

echo $0 $*
progdir=$(dirname "$0")
cd $progdir
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$progdir
devsd=/dev/mmcblk1
devUDISK=/dev/by-name/UDISK
echo "=============================================="
echo "============== USB Storage Mode  ============="
echo "=============================================="



echo 1 > /tmp/stay_awake


if [ -e /dev/mmcblk1p1 ]
then
devsd="/dev/mmcblk1p1"
fi

if [ -e /dev/by-name/UDISK ]
then
devUDISK="/dev/by-name/UDISK"
fi

echo SD dev:$devsd
echo UDISK dev:$devUDISK



umount /mnt/SDCARD
umount /mnt/UDISK



/bin/setusbconfig mass_storage,adb
chmod 777 usb_storage
./usb_storage



sync


/bin/setusbconfig adb



echo "Running cleanup operations..."


echo "Cleanup completed. Exiting USB app."

mount -o iocharset=utf8,errors=continue $devsd /mnt/SDCARD
mount -o iocharset=utf8,errors=continue $devUDISK /mnt/UDISK


rm /tmp/stay_awake
