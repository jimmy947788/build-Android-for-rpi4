# android-rpi4


## Requment
### build kernel library
> sudo apt install gcc-arm-linux-gnueabihf libssl-dev bison flex

### build android library
If libncurses is not installed then install it and try again.
for 32-bit binaries : 
> sudo apt-get install libncurses5:i386

for 64-bit binaries : 
> sudo apt-get install libncurses5


### Set compiler cache enable.

> sudo apt install ccache
export USE_CCACHE=1
export CCACHE_DIR=$HOME/.ccache
ccache -M 70G


### make image 
> sudo apt-get install kpartx



## touchscreen

### Writing your first Android Things driver
https://blog.novoda.com/writing-your-first-android-things-driver-p1/

https://github.com/androidthings/contrib-drivers

### Integrate peripheral drivers 
https://developer.android.com/things/training/first-device/drivers

### build user-space drivers (input)
https://developer.android.com/things/sdk/drivers/input


https://github.com/dirkvranckaert/touchinputdisplaydriver


https://gist.github.com/matkarlg/a7d8371265e3ee2d75fcda35aa5dea5c

https://github.com/machtelik/waveshare-7inch-touchscreen-driver-android

https://github.com/goodtft/LCD-show