#!/bin/bash

## This script will configure additional swap for your Linux machine. 

## Creating an empty file on the Data volume of your machine. Modify appropriately.
dd if=/dev/zero of=/data/swap count=131072 bs=1MiB
chmod 600 /data/swap
mkswap /data/swap 
swapon /data/swap
echo "/data/swap     none     swap     sw    0    0" >> /etc/fstab

