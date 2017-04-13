export PKG_CONFIG_PATH=/home/robert/50G/br_oct19/buildroot_2011_05/output/build/utillinux-2.20.1/libblkid/:/home/robert/50G/br_oct19/buildroot_2011_05/output/build/utillinux-2.20.1/libuuid/

mkdir ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/uuid
mkdir ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/blkid
cp ./output/build/utillinux-2.20.1/libuuid/src/uuid.h ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/uuid/
cp ./output/build/utillinux-2.20.1/libblkid/src/blkid.h ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/blkid/
cp ./output/build/utillinux-2.20.1/libblkid/src/.libs/libblkid.* ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/
cp  output/build/utillinux-2.20.1/libuuid/src/.libs/lib* ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/
