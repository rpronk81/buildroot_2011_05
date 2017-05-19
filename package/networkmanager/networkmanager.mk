#############################################################
#
# NetworkManager
#
#############################################################
NETWORKMANAGER_VERSION = 0.8.1
NETWORKMANAGER_SOURCE = networkmanager-$(NETWORKMANAGER_VERSION).tar.gz
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

$(eval $(call AUTOTARGETS,package,networkmanager))
