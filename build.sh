#!/bin/bash

MODE=$1
if [ -z "$MODE" ]
then
    MODE="All"
fi
echo "MODE=$MODE"

ARRPI_BRANCH=$(grep ARRPI_BRANCH .env | cut -d '=' -f2)
ARRPI_FOLDER=$(grep ARRPI_FOLDER .env | cut -d '=' -f2)
ANDROID_VERSION=$(grep ANDROID_VERSION .env | cut -d '=' -f2)

echo "ARRPI_BRANCH=$ARRPI_BRANCH"
echo "ARRPI_FOLDER=$ARRPI_FOLDER"
echo "ANDROID_VERSION=$ANDROID_VERSION"

if [ "$MODE" = "All" ] || [ "$MODE" = "Kernel" ]
then
    cd $ARRPI_FOLDER/kernel/arpi
    echo "current path: $(pwd)"
    #echo $$
    ARCH=arm scripts/kconfig/merge_config.sh arch/arm/configs/bcm2711_defconfig kernel/configs/android-base.config kernel/configs/android-recommended.config
    ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make zImage -j$(nproc --all)
    ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make dtbs -j$(nproc --all)
fi 

if [ "$MODE" = "All" ] || [ "$MODE" = "Android" ]
then
    cd $ARRPI_FOLDER
    echo "current path: $(pwd)"
    #echo $$
    source build/envsetup.sh
    lunch rpi4-eng
    make ramdisk systemimage vendorimage -j$(nproc --all)
fi 
