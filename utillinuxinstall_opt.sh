export PKG_CONFIG_PATH=${PWD}/output/build/utillinux-2.20.1/libblkid/:${PWD}/output/build/utillinux-2.20.1/libuuid/

export BR2_HOST_DIR=/opt/buildroot-2011.05

mkdir ${BR2_HOST_DIR}/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/uuid
mkdir ${BR2_HOST_DIR}/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/blkid
cp ./output/build/utillinux-2.20.1/libuuid/src/uuid.h ${BR2_HOST_DIR}/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/uuid/
cp ./output/build/utillinux-2.20.1/libblkid/src/blkid.h ${BR2_HOST_DIR}/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/blkid/
cp ./output/build/utillinux-2.20.1/libblkid/src/.libs/libblkid.* ${BR2_HOST_DIR}/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/
cp  output/build/utillinux-2.20.1/libuuid/src/.libs/lib* ${BR2_HOST_DIR}/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/
