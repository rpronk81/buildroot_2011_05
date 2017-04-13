# install libraries to 
 cp output/build/libnl-3.2.14/lib/.libs/*genl* ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/
 cp -r ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/libnl3/netlink ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/
 cp output/build/libnl-3.2.14/lib/.libs/*nl* ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/
 cd ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/
 ln -s libnl-genl-3.a libnl-genl.a
 ln -s libnl-genl-3.la libnl-genl.la
 ln -s libnl-genl-3.so libnl-genl.so
 ln -s libnl-3.a libnl.a
 ln -s libnl-3.la libnl.la
 ln -s libnl-3.so libnl.so
