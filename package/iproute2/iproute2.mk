#############################################################
#
# iproute2
#
#############################################################

IPROUTE2_VERSION = 3.10.0
IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.gz
IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
IPROUTE2_TARGET_SBINS = ip tc

# If both iproute2 and busybox are selected, make certain we win
# the fight over who gets to have their utils actually installed.
ifeq ($(BR2_PACKAGE_BUSYBOX),y)
IPROUTE2_DEPENDENCIES += busybox
endif

# If we've got iptables enable xtables support for tc
ifeq ($(BR2_PACKAGE_IPTABLES),y)
IPROUTE2_DEPENDENCIES += iptables
define IPROUTE2_WITH_IPTABLES
	# Makefile is busted so it never passes IPT_LIB_DIR properly
	$(SED) "s/-DIPT/-DXT/" $(IPROUTE2_DIR)/tc/Makefile
	echo "TC_CONFIG_XT:=y" >>$(IPROUTE2_DIR)/Config
endef
else
define IPROUTE2_WITH_IPTABLES
	# em_ipset needs xtables, but configure misdetects it
	echo "TC_CONFIG_IPSET:=n" >>$(IPROUTE2_DIR)/Config
endef
endif

define IPROUTE2_CONFIGURE_CMDS
	# Use kernel headers
	rm -r $(IPROUTE2_DIR)/include/netinet
	# arpd needs berkeleydb
	$(SED) "/^TARGETS=/s: arpd : :" $(IPROUTE2_DIR)/misc/Makefile
	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(IPROUTE2_DIR)/Makefile
	echo "IPT_LIB_DIR:=/usr/lib/xtables" >>$(IPROUTE2_DIR)/Config
	$(IPROUTE2_WITH_IPTABLES)
endef

define IPROUTE2_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
endef

define IPROUTE2_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" SBINDIR=/sbin \
		DOCDIR=/usr/share/doc/iproute2-$(IPROUTE2_VERSION) \
		MANDIR=/usr/share/man install
	# Wants bash
	rm -f $(TARGET_DIR)/sbin/ifcfg
endef

define IPROUTE2_UNINSTALL_TARGET_CMDS
	rm -rf $(TARGET_DIR)/lib/tc
	rm -rf $(TARGET_DIR)/usr/lib/tc
	rm -f $(addprefix $(TARGET_DIR)/sbin/, $(IPROUTE2_TARGET_SBINS))
endef

$(eval $(call GENTARGETS,package,iproute2))
