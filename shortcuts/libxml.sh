cp -rp /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/libxml2/libxml/ /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/

mkdir -p /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/dbus/
mkdir -p /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/lib/dbus-1.0/include

cp -rp /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/lib/dbus-1.0/include/dbus/dbus-arch-deps.h /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/dbus/


cp -rp /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/usr/include/dbus-1.0 \
       /opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/include/


#These are the paths Elinos make will search for creating the apps.
#/opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/include/dbus-1.0
#/opt/buildroot-2011.05-ppc/usr/powerpc-unknown-linux-gnu/sysroot/lib/dbus-1.0/include
