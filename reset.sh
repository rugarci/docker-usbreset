#!/bin/bash

if [[ -z "$1" ]]; then
echo "Device to reset not passed"
exit 1
fi

if [ "$(dirname "$1")" == "/dev" ]; then

LINK_DEV=$(readlink -f "$1")

if [ "$(dirname "$LINK_DEV")" == "/dev" ]; then
REAL_DEV=$(basename "$LINK_DEV")

SYS_PATH=$(readlink -f /sys/class/tty/$REAL_DEV)

while [ "$SYS_PATH" != "/" ]; do
    if [ -f "$SYS_PATH/busnum" ] && [ -f "$SYS_PATH/devnum" ]; then
        BUS_NUM=$(printf "%03d" "$(cat $SYS_PATH/busnum)")
        DEV_NUM=$(printf "%03d" "$(cat $SYS_PATH/devnum)")
        break
    fi
    SYS_PATH=$(dirname "$SYS_PATH")
done

if [ -z "$BUS_NUM" ] || [ -z "$DEV_NUM" ]; then
    echo "Unable to resolve USB bus/device for $1"
    exit 1
fi

echo "$1 resolved to $BUS_NUM:$DEV_NUM"

DEV_BUS_FOLDER=/dev/bus/usb/$BUS_NUM/$DEV_NUM

else
DEV_BUS_FOLDER=$LINK_DEV
echo "$1 points to $LINK_DEV"
fi
else
DEV_BUS_FOLDER=$1
fi

echo "Resetting $DEV_BUS_FOLDER"
./usbreset $DEV_BUS_FOLDER
