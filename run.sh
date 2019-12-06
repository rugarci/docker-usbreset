#!/bin/bash


if [ $(dirname $1) == "/dev" ]; then

  export REAL_DEV=$(basename $(readlink -f $1))
  export DEV_FOLDER=$(find /sys/devices -lname *$REAL_DEV)/../..
  export BUS_NUM=$(echo `printf "%03d" $(cat $DEV_FOLDER/busnum)`)
  export DEV_NUM=$(echo `printf "%03d" $(cat $DEV_FOLDER/devnum)`)

  echo $1 resolved to $BUS_NUM:$DEV_NUM

  export DEV_BUS_FOLDER=/dev/bus/usb/$BUS_NUM/$DEV_NUM
else
  export DEV_BUS_FOLDER=$1
fi

echo Resetting $DEV_BUS_FOLDER
./usbreset $DEV_BUS_FOLDER

