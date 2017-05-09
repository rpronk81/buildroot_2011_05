tar -xzf dl/networkmanager-0.8.1.tar.gz -C output/spacecom2/build/networkmanager-0.8.1/
chmod u+x output/spacecom2/build/networkmanager-0.8.1/configure
 mkdir ./output/spacecom2/host/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/pppd
 cp ./output/spacecom2/build/pppd-2.4.5/pppd/pppd.h  ./output/spacecom2/host/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/pppd/
 cp ./output/spacecom2/build/pppd-2.4.5/pppd/fsm.h  ./output/spacecom2/host/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/pppd/
 cp ./output/spacecom2/build/pppd-2.4.5/pppd/ipcp.h  ./output/spacecom2/host/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/pppd/
 cp ./output/spacecom2/build/pppd-2.4.5/pppd/patchlevel.h  ./output/spacecom2/host/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/
cp ./output/spacecom2/host/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/nspr/prinit.h ./output/spacecom2/host/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/prinit.h

cd output/spacecom2/build/networkmanager-0.8.1
patch -p1 -i ../../../../package/networkmanager/nmall.patch
cd ../../..
