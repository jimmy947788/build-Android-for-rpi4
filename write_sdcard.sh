#!/bin/sh

IMGNAME=$1
echo "IMGNAME=$IMGNAME"

WORKER_FOLDER=$(grep WORKER_FOLDER .env | cut -d '=' -f2)
#echo "WORKER_FOLDER=$WORKER_FOLDER"

devname=$(python3 find_sdcard.py)
ret_code=$?

if [ $ret_code = 0 ]
then
    bash clean_sdcard.sh $devname 
    #echo "devname=$devname"
    dd if=$IMGNAME of=$devname bs=4M conv=fsync status=progress
else
    echo "write image to sdcard failed..."
fi