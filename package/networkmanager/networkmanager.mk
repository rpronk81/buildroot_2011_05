#############################################################
#
# NetworkManager
#
#############################################################

NETWORKMANAGER_VERSION_MAJOR = 0.8
#NETWORKMANAGER_VERSION_MAJOR = 0.9
NETWORKMANAGER_VERSION = $(NETWORKMANAGER_VERSION_MAJOR).1
#NETWORKMANAGER_VERSION = $(NETWORKMANAGER_VERSION_MAJOR).8.0
NETWORKMANAGER_SOURCE = NetworkManager-0.8.1.tar.bz2
#NETWORKMANAGER_SOURCE = NetworkManager-$(NETWORKMANAGER_VERSION).tar.xz
NETWORKMANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORKMANAGER_VERSION_MAJOR)
#NETWORKMANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORKMANAGER_VERSION_MAJOR)
# NETWORKMANGER_AUTORECONF = YES
NETWORKMANAGER_INSTALL_STAGING = YES
NETWORKMANAGER_DEPENDENCIES = wireless_tools libnl polkit libnss pppd \
	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
	host-pkg-config \
	host-intltool

#NETWORKMANAGER_DEPENDENCIES = host-pkg-config udev dbus-glib libnl \
#	libgcrypt wireless_tools util-linux host-intltool

#	ac_cv_env_CFLAGS_value=-I $(STAGING_DIR)/../../../../build/pppd-2.4.5  \

NETWORKMANAGER_CONF_ENV = \
	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
	ac_cv_file__etc_fedora_release=no \
	ac_cv_file__etc_mandriva_release=no \
	ac_cv_file__etc_debian_version=yes \
	ac_cv_file__etc_redhat_release=no \
	ac_cv_file__etc_gentoo_release=no \
	ac_cv_file__etc_arch_release=no \
 	ac_cv_file__etc_ubuntu_release=no \
	ac_cv_file__etc_slackware_version=no \
	ac_cv_file__etc_paldo_release=no \
	ac_cv_file__etc_frugalware_release=no \
	ac_cv_file__etc_mandriva_release=no \
	ac_cv_file__etc_pardus_release=no \
	ac_cv_file__etc_SuSE_release=no


NETWORKMANAGER_CONF_OPT = \
		--mandir=$(STAGING_DIR)/usr/man/ \
		--disable-tests \
		--disable-more-warnings \
		--without-docs \
		--disable-gtk-doc \
		--localstatedir=/var \
		--with-crypto=gnutls \
		--with-distro=debian \
		--disable-ppp \
		--with-iptables=/usr/sbin/iptables \
		--disable-ifupdown \
		--disable-ifnet

# uClibc by default doesn't have backtrace support, so don't use it
ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
NETWORKMANAGER_CONF_OPT += --disable-crashtrace
endif

define NETWORKMANAGER_INSTALL_INIT_SYSV
	$(INSTALL) -m 0755 -D package/network-manager/S45network-manager $(TARGET_DIR)/etc/init.d/S45network-manager
endef

#$(eval $(autotools-package))

$(eval $(call AUTOTARGETS,package,networkmanager))

