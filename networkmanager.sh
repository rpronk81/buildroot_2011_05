export BR2_HOST_DIR=/opt/buildroot-2011.05

mkdir ${BR2_HOST_DIR}/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd
cp ./output/build/pppd-2.4.5/pppd/pppd.h  ${BR2_HOST_DIR}/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd/
cp ./output/build/pppd-2.4.5/pppd/fsm.h  ${BR2_HOST_DIR}/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd/
cp ./output/build/pppd-2.4.5/pppd/ipcp.h  ${BR2_HOST_DIR}/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd/
cp ./output/build/pppd-2.4.5/pppd/patchlevel.h  ${BR2_HOST_DIR}/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/
