#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Device to reset not passed"
    exit 1
fi

if [ $(dirname $1) == "/dev" ]; then

  export LINK_DEV=$(readlink -f $1)

  if [ $(dirname $LINK_DEV) == "/dev" ]; then
    export REAL_DEV=$(basename $LINK_DEV)
    export DEV_FOLDER=$(find /sys/devices -lname *$REAL_DEV)/../..
    echo $DEV_FOLDER
    export BUS_NUM=$(echo `printf "%03d" $(cat $DEV_FOLDER/busnum)`)
    export DEV_NUM=$(echo `printf "%03d" $(cat $DEV_FOLDER/devnum)`)

    echo $1 resolved to $BUS_NUM:$DEV_NUM

    export DEV_BUS_FOLDER=/dev/bus/usb/$BUS_NUM/$DEV_NUM
  else
    export DEV_BUS_FOLDER=$LINK_DEV
    echo $1 points to $LINK_DEV
  fi
else
  export DEV_BUS_FOLDER=$1
fi

echo Resetting $DEV_BUS_FOLDER
./usbreset $DEV_BUS_FOLDER

