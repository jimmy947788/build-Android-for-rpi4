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

mkdir -p $WORKER_FOLDER 
cd $WORKER_FOLDER
echo "current path: $(pwd)"
#echo $$

if [ "$MODE" = "All" ] || [ "$MODE" = "Init" ]
then
    #Android Version 
    #https://source.android.com/setup/start/build-numbers#source-code-tags-and-builds
    repo init -u https://android.googlesource.com/platform/manifest -b $ANDROID_VERSION
fi

if [ "$MODE" = "All" ] || [ "$MODE" = "Sync" ]
then
    LOCAL_MAINIFESTS_FOLDER=".repo/local_manifests"
    if [ -d "$LOCAL_MAINIFESTS_FOLDER" ]; then rm -Rf $LOCAL_MAINIFESTS_FOLDER; fi
    git clone https://github.com/02047788a/local_manifests.git $LOCAL_MAINIFESTS_FOLDER -b $RPI_BRANCH
    repo sync -j$(nproc --all)
fi 
