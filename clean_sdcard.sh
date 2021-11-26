#/bin/bash

set -eu
DEVICE=$1
echo "delete partitions..."
(
echo d 
echo 
echo d 
echo 
echo d 
echo 
echo d 
echo 
echo w
) | fdisk "$DEVICE"
sync
