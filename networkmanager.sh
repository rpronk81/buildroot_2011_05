export BR2_HOST_DIR=/opt/buildroot-2011.05
#export BR2_HOST_DIR=$HOME/50G/br_oct19/buildroot_2011_05/output/host


mkdir ${BR2_HOST_DIR}/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd
cp ./output/build/pppd-2.4.5/pppd/pppd.h  ${BR2_HOST_DIR}/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd/
cp ./output/build/pppd-2.4.5/pppd/fsm.h  ${BR2_HOST_DIR}/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd/
cp ./output/build/pppd-2.4.5/pppd/ipcp.h  ${BR2_HOST_DIR}/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd/
cp ./output/build/pppd-2.4.5/pppd/patchlevel.h  ${BR2_HOST_DIR}/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/

cp output/build/wireless_tools-30/wireless.h /opt/buildroot-2011.05/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/

cp output/build/wireless_tools-30/iwlib.h /opt/buildroot-2011.05/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/
