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