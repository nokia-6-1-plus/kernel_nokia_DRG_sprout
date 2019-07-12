#!/bin/bash

clear
echo "--------------------------------------------"
echo "Welcome To Kernel Source"
echo "Lets Compile kernel sit Back Have A coffee "
echo "--------------------------------------------"

rm -r output
export ARCH=arm64
export CROSS_COMPILE=/home/derflacco/gcc-linaro-5.5.0-2017.10-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
clear
make clean
make mrproper
mkdir output
make -C $(pwd) O=output nokia_defconfig
make -j6 -C $(pwd) O=output
cp -r output/arch/arm64/boot/Image.gz-dtb /home/derflacco/BOOTIMAGES

echo "--------------------------------------------"
echo "Done"
echo "--------------------------------------------"
