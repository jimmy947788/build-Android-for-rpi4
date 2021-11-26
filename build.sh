#!/bin/bash

MODE=$1
if [ -z "$MODE" ]
then
    MODE="All"
fi
echo "MODE=$MODE"

RPI_BRANCH=$(grep RPI_BRANCH .env | cut -d '=' -f2)
ANDROID_VERSION=$(grep ANDROID_VERSION .env | cut -d '=' -f2)
WORKER_FOLDER=$(grep WORKER_FOLDER .env | cut -d '=' -f2)

echo "RPI_BRANCH=$RPI_BRANCH"
echo "ANDROID_VERSION=$ANDROID_VERSION"
echo "WORKER_FOLDER=$WORKER_FOLDER"


if [ "$MODE" = "All" ] || [ "$MODE" = "Kernel" ]
then
    cd $WORKER_FOLDER/kernel/arpi
    echo "current path: $(pwd)"
    #echo $$
    ARCH=arm scripts/kconfig/merge_config.sh arch/arm/configs/bcm2711_defconfig kernel/configs/android-base.config kernel/configs/android-recommended.config
    ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make zImage -j$(nproc --all)
    ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make dtbs -j$(nproc --all)
fi 

if [ "$MODE" = "All" ] || [ "$MODE" = "Android" ]
then
    cd $WORKER_FOLDER
    echo "current path: $(pwd)"
    #echo $$
    source build/envsetup.sh
    lunch rpi4-eng
    make ramdisk systemimage vendorimage -j$(nproc --all)
fi 