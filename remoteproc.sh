#!/bin/sh


if [ ! -d "/lib/firmware" ]; then
    mkdir -p /lib/firmware
fi

# cvirtos.elf is the image name of ThreadX
cp cvirtos.elf /lib/firmware
# Setup firmware loading path
echo cvirtos.elf > /sys/class/remoteproc/remoteproc0/firmware
# Remoteproc restarting
echo start > /sys/class/remoteproc/remoteproc0/state
sleep 1
echo stop > /sys/class/remoteproc/remoteproc0/state
echo start > /sys/class/remoteproc/remoteproc0/state    
