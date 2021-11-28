#!/bin/bash

MODE=$1
if [ -z "$MODE" ]
then
    MODE="All"
fi
echo "MODE=$MODE"

RPI_BRANCH=$(grep RPI_BRANCH .env | cut -d '=' -f2)
ANDROID_VERSION=$(grep ANDROID_VERSION .env | cut -d '=' -f2)
ANDROID_FOLDER=$(grep ANDROID_FOLDER .env | cut -d '=' -f2)
KERNEL_BRANCH=$(grep KERNEL_BRANCH .env | cut -d '=' -f2)
KERNEL_FOLDER=$(grep KERNEL_FOLDER .env | cut -d '=' -f2)
MANIFESTS_FOLDER=$(pwd)/Manifests

echo "RPI_BRANCH=$RPI_BRANCH"
echo "ANDROID_VERSION=$ANDROID_VERSION"
echo "ANDROID_FOLDER=$ANDROID_FOLDER"
echo "KERNEL_BRANCH=$KERNEL_BRANCH"
echo "KERNEL_FOLDER=$KERNEL_FOLDER"
echo "MANIFESTS_FOLDER=$MANIFESTS_FOLDER"

if [ "$MODE" = "All" ] || [ "$MODE" = "Kernal" ]
then
    
    mkdir -p $KERNEL_FOLDER 
    cd $KERNEL_FOLDER
    echo "current path: $(pwd)"

    if [ ! -d ".repo" ] 
    then
        repo init -u https://github.com/02047788a/arpi_kernel_manifest.git -b $KERNEL_BRANCH
    fi  
    repo sync -j$(nproc --all)
fi 

if [ "$MODE" = "All" ] || [ "$MODE" = "Android" ]
then

    mkdir -p $ANDROID_FOLDER 
    cd $ANDROID_FOLDER
    echo "current path: $(pwd)"

    if [ ! -d ".repo" ] 
    then
        repo init -u https://android.googlesource.com/platform/manifest  -b $ANDROID_VERSION
        git clone https://github.com/02047788a/arpi_loacl_manifests .repo/local_manifests -b $RPI_BRANCH
    fi  
    repo sync -j$(nproc --all)
fi 
