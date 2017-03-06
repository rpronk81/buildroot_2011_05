#############################################################
#
# NetworkManager
#
#############################################################

NETWORKMANAGER_VERSION_MAJOR = 0.8
NETWORKMANAGER_VERSION = $(NETWORKMANAGER_VERSION_MAJOR).1
NETWORKMANAGER_SOURCE = NetworkManager-0.8.1.tar.bz2
NETWORKMANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORKMANAGER_VERSION_MAJOR)
NETWORKMANAGER_INSTALL_STAGING = YES
NETWORKMANAGER_DEPENDENCIES = wireless_tools libnl polkit libnss pppd \
	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
	host-pkg-config \
	host-intltool

NETWORKMANAGER_CONF_ENV = \
	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
	CFLAGS="$(TARGET_CFLAGS) -I$(BUILD_DIR)/pppd-2.4.5" \
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
		--disable-more-warnings \
		--without-docs \
		--disable-gtk-doc \
		--localstatedir=/var \
		--with-crypto=gnutls \
		--with-distro=debian \
		--with-iptables=/usr/sbin/iptables

# Remove the "tests" target from the src/makefile
NETWORKMANAGER_DIR:=$(BUILD_DIR)/networkmanager-0.8.1
define NETWORKMANGER_POST_CONFIGURE_FIXUP
	cd $(NETWORKMANAGER_DIR) && patch -p1 -i $(BUILD_DIR)/../../../buildroot/package/networkmanager/networkmanager-9.patch.postconfigure
endef
NETWORKMANAGER_POST_CONFIGURE_HOOKS += NETWORKMANGER_POST_CONFIGURE_FIXUP

# uClibc by default doesn't have backtrace support, so don't use it
ifeq ($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
NETWORKMANAGER_CONF_OPT += --disable-crashtrace
endif

define NETWORKMANAGER_INSTALL_INIT_SYSV
	$(INSTALL) -m 0755 -D package/network-manager/S45network-manager $(TARGET_DIR)/etc/init.d/S45network-manager
endef

$(eval $(call AUTOTARGETS,package,networkmanager))

