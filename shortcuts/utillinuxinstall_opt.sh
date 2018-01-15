export PKG_CONFIG_PATH=/home/robert/50G/br_oct19/buildroot_2011.05-ppc/output/build/utillinux-2.20.1/libblkid/:/home/robert/50G/br_oct19/buildroot_2011.05-ppc/output/build/utillinux-2.20.1/libuuid/

export BR2_HOST_DIR=/opt/buildroot-2011.05-ppc

mkdir ${BR2_HOST_DIR}/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/uuid
mkdir ${BR2_HOST_DIR}/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/blkid
cp ./output/build/utillinux-2.20.1/libuuid/src/uuid.h ${BR2_HOST_DIR}/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/uuid/
cp ./output/build/utillinux-2.20.1/libblkid/src/blkid.h ${BR2_HOST_DIR}/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/blkid/
cp ./output/build/utillinux-2.20.1/libblkid/src/.libs/libblkid.* ${BR2_HOST_DIR}/usr/powerpc-unknown-linux-gnu/sysroot/usr/lib/
cp  output/build/utillinux-2.20.1/libuuid/src/.libs/lib* ${BR2_HOST_DIR}/usr/powerpc-unknown-linux-gnu/sysroot/usr/lib/
