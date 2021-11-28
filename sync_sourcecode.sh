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

mkdir -p $ARRPI_FOLDER 
cd $ARRPI_FOLDER
echo "current path: $(pwd)"

if [ ! -d ".repo" ] 
then
    repo init -u https://android.googlesource.com/platform/manifest  -b $ANDROID_VERSION
    git clone https://github.com/02047788a/arpi_loacl_manifests .repo/local_manifests -b $ARRPI_BRANCH
fi  
repo sync -j$(nproc --all)