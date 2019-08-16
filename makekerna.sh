#!/bin/bash

clear
echo "--------------------------------------------"
echo "Welcome To Kernel Source"
echo "Lets Compile kernel sit Back Have A coffee "
echo "--------------------------------------------"

rm -r output
export KBUILD_BUILD_USER=DerFlacco
export KBUILD_BUILD_HOST=FlaccoMachine
export ARCH=arm64
export SUBARCH=arm64
export USE_CCACHE=1
export CLANG_PATH=/home/derflacco/aosp-clang-master/bin
export PATH=${CLANG_PATH}:${PATH}
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=/home/derflacco/aarch64-elf-gcc-master/bin/aarch64-elf-
export CROSS_COMPILE_ARM32=/home/derflacco/arm-eabi-gcc-9.x/bin/arm-eabi-
export CLANG_TCHAIN="/home/derflacco/aosp-clang-master/bin/clang"
export KBUILD_COMPILER_STRING="$(${CLANG_TCHAIN} --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g')"
clear
make clean
make mrproper
mkdir output
make -C $(pwd) O=output DRG_sprout_defconfig
make -j6 -C $(pwd) O=output
cp -r output/arch/arm64/boot/Image.gz-dtb /home/derflacco/BOOTIMAGES

echo "--------------------------------------------"
echo "Done"
echo "--------------------------------------------"
