export PKG_CONFIG_PATH=/home/robert/50G/buildroot_2011_05/output/spacecom2/build/utillinux-2.20.1/libblkid/:/home/robert/50G/buildroot_2011_05/output/spacecom2/build/utillinux-2.20.1/libuuid/

mkdir ./output/spacecom2/host/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/uuid
mkdir ./output/spacecom2/host/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/blkid
cp ./output/spacecom2/build/utillinux-2.20.1/libuuid/src/uuid.h ./output/spacecom2/host/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/uuid/
cp ./output/spacecom2/build/utillinux-2.20.1/libblkid/src/blkid.h ./output/spacecom2/host/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/blkid/
cp ./output/spacecom2/build/utillinux-2.20.1/libblkid/src/.libs/libblkid.* ./output/spacecom2/host/usr/powerpc-unknown-linux-gnu/sysroot/usr/lib/
cp  output/spacecom2/build/utillinux-2.20.1/libuuid/src/.libs/lib* ./output/spacecom2/host/usr/powerpc-unknown-linux-gnu/sysroot/usr/lib/
