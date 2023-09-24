#!/bin/bash
echo "Welcome $USER on $HOSTNAME."
echo "###########################################"

FREE_RAM=`free -m | grep Mem | awk '{print $4}'`
LOAD=`uptime | awk '{print $9}'`
ROOTFREE=$(df -h | grep '/dev/sda1' | awk '{print $4}')

echo "###########################################"
echo "Available free RAM is $FREE_RAM mb"

echo "###########################################"
echo "Current Load is $LOAD"

echo "###########################################"
echo "Free ROOT partition size is $ROOTFREE"

