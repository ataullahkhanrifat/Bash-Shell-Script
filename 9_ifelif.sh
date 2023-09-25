#!/bin/bash

value=$(ip addr show | grep -v LOOPBACK | grep -ic mtu)

if [ $value -eq 1]
then 
    echo "1 Active Interface found."
elif [ $value -gt 1]
then 
    echo "Found Multiple Interface." 
else 
    echo "No Active interface found."
fi
