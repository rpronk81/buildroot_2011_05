#############################################################
#
# NetworkManager
#
#############################################################
NETWORKMANAGER_VERSION = 0.8.1
NETWORKMANAGER_VERSION_MAJOR=0.8
NETWORKMANAGER_SOURCE = NetworkManager-$(NETWORKMANAGER_VERSION).tar.gz
NETWORKMANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORKMANAGER_VERSION_MAJOR)
NETWORKMANAGER_INSTALL_STAGING = YES
NETWORKMANAGER_DEPENDENCIES = host-pkg-config udev dbus-glib libnl wireless_tools gnutls utillinux polkit pppd

NETWORKMANAGER_AUTORECONF = yes

NETWORKMANAGER_CONF_OPT = \
	--with-distro=debian \
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
	--localstatedir=/var \
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


define NETWORKMANGER_LIBNM_UTIL_MAKEFILE
	cd $(@D)
	patch -p1 -i $(TARGET_DIR)/../../package/networkmanager/networkmanager-1.post
	patch -p1 -i $(TARGET_DIR)/../../package/networkmanager/networkmanager-2.post
endef

NETWORKMANAGER_POST_CONFIGURE_HOOKS += NETWORKMANGER_LIBNM_UTIL_MAKEFILE

$(eval $(call AUTOTARGETS,package,networkmanager))
