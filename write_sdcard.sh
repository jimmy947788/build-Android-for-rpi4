#!/bin/sh

IMGNAME=$1
echo "IMGNAME=$IMGNAME"

ANDROID_FOLDER=$(grep ANDROID_FOLDER .env | cut -d '=' -f2)
#echo "ANDROID_FOLDER=$ANDROID_FOLDER"

devname=$(python3 find_sdcard.py)
ret_code=$?

if [ $ret_code = 0 ]
then
    bash ./clean_sdcard.sh $devname 
    #echo "devname=$devname"
    dd if=$IMGNAME of=$devname bs=4M conv=fsync status=progress

    eject $devname
else
    echo "write image to sdcard failed..."
fi