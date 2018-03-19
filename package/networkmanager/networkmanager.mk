#############################################################
#
# NetworkManager
#
#############################################################
NETWORKMANAGER_VERSION = 0.8.1
NETWORKMANAGER_VERSION_MAJOR=0.8
NETWORKMANAGER_SOURCE = NetworkManager-$(NETWORKMANAGER_VERSION).git20100811.tar
NETWORKMANAGER_SITE = https://github.com/ptdropper/NetworkManager/blob/master/

NETWORKMANAGER_INSTALL_STAGING = YES
NETWORKMANAGER_DEPENDENCIES = host-pkg-config udev dbus-glib libnl wireless_tools gnutls utillinux polkit pppd

NETWORKMANAGER_AUTORECONF = yes

NETWORKMANAGER_CONF_OPT = \
	--with-distro=debian \
	--with-iptables=/usr/sbin/iptables \
	--with-resolvconf=no \
	--with-dhcpcd=no \
	--with-dhclient=/sbin/dhclient \
	--with-dbus-user=root \
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

define NETWORKMANAGER_INSTALL_SCRIPT
	$(INSTALL) -m 0755 -D package/networkmanager/libnm-settings-plugin-ifupdown.so $(TARGET_DIR)/usr/lib/libnm-settings-plugin-ifupdown.so
	$(INSTALL) -m 0755 -D package/networkmanager/libnm-settings-plugin-keyfile.so $(TARGET_DIR)/usr/lib/libnm-settings-plugin-keyfile.so
	$(INSTALL) -m 0755 -D package/networkmanager/01ifupdown $(TARGET_DIR)/etc/NetworkManager/dispatcher.d/01ifupdown
	mkdir -p $(TARGET_DIR)/var/run/NetworkManager
endef

NETWORKMANAGER_POST_INSTALL_TARGET_HOOKS += NETWORKMANAGER_INSTALL_SCRIPT

define NETWORKMANGER_LIBNM_UTIL_MAKEFILE
	cd $(@D)
	patch -p1 -i $(TARGET_DIR)/../../package/networkmanager/networkmanager-1.post
	patch -p1 -i $(TARGET_DIR)/../../package/networkmanager/networkmanager-2.post
	patch -p1 -i $(TARGET_DIR)/../../package/networkmanager/networkmanager-3.post
endef

NETWORKMANAGER_POST_CONFIGURE_HOOKS += NETWORKMANGER_LIBNM_UTIL_MAKEFILE

$(eval $(call AUTOTARGETS,package,networkmanager))
