#############################################################
#
# NetworkManager
#
#############################################################
NETWORKMANAGER_VERSION = 0.8.1
#NETWORKMANAGER_VERSION = 0.9.2.0
NETWORKMANAGER_SOURCE = networkmanager-$(NETWORKMANAGER_VERSION).tar.gz
#NETWORKMANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/0.8/
NETWORKMANAGER_INSTALL_STAGING = YES
NETWORKMANAGER_DEPENDENCIES = host-pkg-config udev dbus-glib libnl wireless_tools gnutls utillinux polkit pppd
#NETWORKMANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl wireless_tools gnutls util-linux
# host-pkgconf versus pkg_config dbus-glib vs dbus_glib util-linux vs util_linux

#NETWORKMANAGER_CONF_ENV = \
#	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config

NETWORKMANAGER_CONF_OPT = \
	--with-distro=debian \
#	--with-crypto=gnutls 
	--with-iptables=/usr/sbin/iptables \
	--with-resolvconf=no \
	--with-dhcpcd=no \
	--with-dhclient=/sbin/dhclient \
	--with-dbus-user=dbus \
	--with-gnu-ld \
	--without-pppd \
	--without-ppp \
	--disable-pppd \
	--disable-ppp \
	--without-tests \
	--disable-more-warnings \
	--disable-tests \
	--disable-rpath \ 
		--without-docs \
		--disable-gtk-doc \
		--disable-asserts \
		--enable-abstract-sockets \
		--disable-selinux \
		--disable-xml-docs \
		--disable-doxygen-docs \
		--disable-static \
		--enable-dnotify \
		--localstatedir=/var

#	--with-pppd-plugin-dir=/usr/lib/pppd/2.4.5 \
#		--mandir=$(STAGING_DIR)/usr/man/ \
#		--with-distro=arch \
#		--disable-ppp \
		--disable-qt \
		--disable-gtk-do-html 

# The target was built for the archlinux distribution, so we need
# to move around things after installation
#define NETWORKMANAGER_INSTALL_INITSCRIPT
#	#$(INSTALL) -m 0755 -D package/networkmanager/S45network-manager $(TARGET_DIR)/etc/init.d/S45network-manager
	#rm -f $(TARGET_DIR)/etc/rc.d/networkmanager
	#rm -rf $(TARGET_DIR)/etc/rc.d
	# rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/etc/rc.d
#endef

#NETWORKMANAGER_POST_INSTALL_TARGET_HOOKS += NETWORKMANAGER_INSTALL_INITSCRIPT

$(eval $(call AUTOTARGETS,package,networkmanager))
# Remove all /etc/rc.d and below
#
#  tar -xzf dl/networkmanager-0.8.1.tar.gz -C output/build/networkmanager-0.8.1/
# chmod u+x output/build/networkmanager-0.8.1/configure
# export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/home/robert/50G/br_oct19/buildroot_2011_05/output/build/pppd-2.4.5
# mkdir ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd
# cp ./output/build/pppd-2.4.5/pppd/pppd.h  ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd/
# cp ./output/build/pppd-2.4.5/pppd/fsm.h  ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd/
# cp ./output/build/pppd-2.4.5/pppd/ipcp.h  ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd/
# cp ./output/build/pppd-2.4.5/pppd/patchlevel.h  ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/
#PKG_CONFIG_PATH=/home/robert/50G/br_oct19/buildroot_2011_05/output/build/pppd-2.4.5:/home/robert/50G/br_oct19/buildroot_2011_05/output/build/utillinux-2.20.1/libblkid/:/home/robert/50G/br_oct19/buildroot_2011_05/output/build/utillinux-2.20.1/libuuid:/home/robert/50G/br_oct19/buildroot_2011_05/output/build/pppd-2.4.5/pppd:/home/robert/50G/br_oct19/buildroot_2011_05/output/build/pppd-2.4.5
# 
#
# Edit configure script to remove all reference to pppd.h
# Edit src/supplicant-manager/Makefile to remove "tests"
#
# One of these works
#
# cp ./output/build/pppd-2.4.5/pppd/pppd.h  ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd/
# cp ./output/build/pppd-2.4.5/pppd/pppd.h  ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd/
# cp output/build/pppd-2.4.5/pppd/pppd.h ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd/
# cp ./output/build/pppd-2.4.5/pppd/pppd.h  ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/pppd/
# cp /home/robert/50G/br_oct19/buildroot_2011_05/output/build/pppd-2.4.5/pppd/pppd.h ./output/host/opt/ext-toolchain/arm-none-linux-gnueabi/libc/usr/include/pppd
# cp /home/robert/50G/br_oct19/buildroot_2011_05/output/build/pppd-2.4.5/pppd/pppd.h ./output/host/opt/ext-toolchain/arm-none-linux-gnueabi/libc/usr/include/sys/pppd/
# cp ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/nspr/prinit.h ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/prinit.h
# 
