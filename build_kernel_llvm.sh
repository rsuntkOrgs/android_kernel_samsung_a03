#!/bin/bash

#
# We gonna use proton-clang!
#

export ARCH=arm64

export BSP_BUILD_FAMILY=qogirl6
export DTC_OVERLAY_TEST_EXT=$(pwd)/tools/mkdtimg/ufdt_apply_overlay
export DTC_OVERLAY_VTS_EXT=$(pwd)/tools/mkdtimg/ufdt_verify_overlay_host
export BSP_BUILD_ANDROID_OS=y

make -C $(pwd) O=$(pwd)/out	\
	BSP_BUILD_DT_OVERLAY=y	\
	CC=clang LD=ld.lld NM=llvm-nm	\
	AR=llvm-ar AS=llvm-as STRIP=llvm-strip	\
	OBJDUMP=llvm-objdump OBJCOPY=llvm-objcopy	\
	ARCH=arm64 CLANG_TRIPLE=aarch64-linux-gnu-	\
	CROSS_COMPILE=aarch64-linux-gnu- `echo $DEFCONFIG`	\
	-j12

make -C $(pwd) O=$(pwd)/out	\
	BSP_BUILD_DT_OVERLAY=y	\
	CC=clang LD=ld.lld NM=llvm-nm	\
	AR=llvm-ar AS=llvm-as STRIP=llvm-strip	\
	OBJDUMP=llvm-objdump OBJCOPY=llvm-objcopy	\
	ARCH=arm64 CLANG_TRIPLE=aarch64-linux-gnu-	\
	CROSS_COMPILE=aarch64-linux-gnu-	\
	-j12