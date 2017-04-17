#############################################################
#
# libnl
#
#############################################################

LIBNL_VERSION = 1.1.4
#LIBNL_VERSION = 3.2.14
#LIBNL_VERSION = 2.0
#LIBNL_VERSION = 3.1
#LIBNL_VERSION = 1.1
#LIBNL_VERSION = 3.0
#LIBNL_VERSION = 3.2.25
LIBNL_SOURCE = libnl-$(LIBNL_VERSION).tar.gz
LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files/
LIBNL_INSTALL_STAGING = YES
LIBNL_DEPENDENCIES = host-bison
LIBNL_MAKE = $(MAKE1)

define LIBNL_UNINSTALL_TARGET_CMDS
	rm -r $(TARGET_DIR)/usr/lib/libnl.* $(TARGET_DIR)/usr/lib/libnl-*.*
	rm -rf $(TARGET_DIR)/usr/lib/libnl
endef

$(eval $(call AUTOTARGETS,package,libnl))

# install libraries to 
# cp output/build/libnl-3.2.14/lib/.libs/*genl* ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/
# cp -r ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/libnl3/netlink ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/
# cp output/build/libnl-3.2.14/lib/.libs/*nl* ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/
# cd ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/
# ln -s libnl-genl-3.a libnl-genl.a
# ln -s libnl-genl-3.la libnl-genl.la
# ln -s libnl-genl-3.so libnl-genl.so
# ln -s libnl-3.a libnl.a
# ln -s libnl-3.la libnl.la
# ln -s libnl-3.so libnl.so
#
