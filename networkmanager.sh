tar -xzf dl/networkmanager-0.8.1.tar.gz -C output/build/networkmanager-0.8.1/
chmod u+x output/build/networkmanager-0.8.1/configure
 mkdir ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd
 cp ./output/build/pppd-2.4.5/pppd/pppd.h  ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd/
 cp ./output/build/pppd-2.4.5/pppd/fsm.h  ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd/
 cp ./output/build/pppd-2.4.5/pppd/ipcp.h  ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd/
 cp ./output/build/pppd-2.4.5/pppd/patchlevel.h  ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/
cp ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/nspr/prinit.h ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/prinit.h
