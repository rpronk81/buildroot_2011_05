#############################################################
#
# util-linux
#
#############################################################
UTILLINUX_VERSION = $(UTILLINUX_VERSION_MAJOR).1
UTILLINUX_VERSION_MAJOR = 2.20
UTILLINUX_SOURCE = util-linux-$(UTILLINUX_VERSION).tar.bz2
UTILLINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTILLINUX_VERSION_MAJOR)

# README.licensing claims that some files are GPLv2-only, but this is not true.
# Some files are GPLv3+ but only in tests.
UTILLINUX_LICENSE = GPLv2+, BSD-4c, libblkid and libmount LGPLv2+, libuuid BSD-3c
UTILLINUX_LICENSE_FILES = README.licensing COPYING licenses/COPYING.UCB libblkid/COPYING.libblkid libuuid/COPYING.libuuid

# UTILLINUX_AUTORECONF = YES
UTILLINUX_INSTALL_STAGING = YES
UTILLINUX_INSTALL_TARGET = YES
UTILLINUX_DEPENDENCIES = host-pkg-config
UTILLINUX_CONF_ENV = scanf_cv_type_modifier=no

UTILLINUX_CONF_OPT += --disable-rpath --disable-makeinstall-chown

# We don't want the host-busybox dependency to be added automatically
HOST_UTILLINUX_DEPENDENCIES = host-pkg-config

# If both util-linux and busybox are selected, make certain util-linux
# wins the fight over who gets to have their utils actually installed
ifeq ($(BR2_PACKAGE_BUSYBOX),y)
UTILLINUX_DEPENDENCIES += busybox
endif

ifeq ($(BR2_PACKAGE_NCURSES),y)
UTILLINUX_DEPENDENCIES += ncurses
else
UTILLINUX_CONF_OPT += --without-ncurses
endif

ifeq ($(BR2_PACKAGE_GETTEXT),y)
UTILLINUX_DEPENDENCIES += gettext
UTILLINUX_MAKE_OPT += LIBS=-lintl
endif

#############################################
#
# disable default utilities
#
UTILLINUX_CONF_OPT += \
	$(if $(BR2_PACKAGE_UTILLINUX_MOUNT),,--disable-mount) \
	$(if $(BR2_PACKAGE_UTILLINUX_FSCK),,--disable-fsck) \
	$(if $(BR2_PACKAGE_UTILLINUX_LIBMOUNT),,--disable-libmount) \
	$(if $(BR2_PACKAGE_UTILLINUX_LIBUUID),,--disable-libuuid) \
	$(if $(BR2_PACKAGE_UTILLINUX_UUIDD),,--disable-uuidd) \
	$(if $(BR2_PACKAGE_UTILLINUX_LIBBLKID),,--disable-libblkid) \
	$(if $(BR2_PACKAGE_UTILLINUX_AGETTY),,--disable-agetty) \
	$(if $(BR2_PACKAGE_UTILLINUX_CRAMFS),,--disable-cramfs) \
	$(if $(BR2_PACKAGE_UTILLINUX_SWITCH_ROOT),,--disable-switch_root) \
	$(if $(BR2_PACKAGE_UTILLINUX_PIVOT_ROOT),,--disable-pivot_root) \
	$(if $(BR2_PACKAGE_UTILLINUX_FALLOCATE),,--disable-fallocate) \
	$(if $(BR2_PACKAGE_UTILLINUX_UNSHARE),,--disable-unshare) \
	$(if $(BR2_PACKAGE_UTILLINUX_RENAME),,--disable-rename) \
	$(if $(BR2_PACKAGE_UTILLINUX_SCHEDUTILS),,--disable-schedutils) \
	$(if $(BR2_PACKAGE_UTILLINUX_WALL),,--disable-wall) \
	$(if $(BR2_PACKAGE_UTILLINUX_PARTX),,--disable-partx)

#############################################
#
# enable extra utilities
#
UTILLINUX_CONF_OPT += \
	$(if $(BR2_PACKAGE_UTILLINUX_ARCH),--enable-arch) \
	$(if $(BR2_PACKAGE_UTILLINUX_INIT),--enable-init) \
	$(if $(BR2_PACKAGE_UTILLINUX_KILL),--enable-kill) \
	$(if $(BR2_PACKAGE_UTILLINUX_LAST),--enable-last) \
	$(if $(BR2_PACKAGE_UTILLINUX_MESG),--enable-mesg) \
	$(if $(BR2_PACKAGE_UTILLINUX_RAW),--enable-raw) \
	$(if $(BR2_PACKAGE_UTILLINUX_RESET),--enable-reset) \
	$(if $(BR2_PACKAGE_UTILLINUX_LOGIN_UTILS),--enable-login-utils) \
	$(if $(BR2_PACKAGE_UTILLINUX_WRITE),--enable-write)

# In the host version of util-linux, we so far only require libuuid,
# and none of the util-linux utilities, so we disable all of them.
HOST_UTILLINUX_CONF_OPT += \
	--enable-libuuid \
	--disable-mount --disable-fsck --disable-libmount \
	--disable-uuidd --disable-libblkid --disable-agetty \
	--disable-cramfs --disable-switch_root --disable-pivot_root \
	--disable-fallocate --disable-unshare --disable-rename \
	--disable-schedutils --disable-wall --disable-partx

define UTILLINUX_INSTALL_TARGET_CMDS
	$(UTILLINUX_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
endef

# MKINSTALLDIRS comes from tweaked m4/nls.m4, but autoreconf uses staging
# one, so it disappears
UTILLINUX_INSTALL_STAGING_OPT += MKINSTALLDIRS=$(@D)/config/mkinstalldirs
UTILLINUX_INSTALL_TARGET_OPT += MKINSTALLDIRS=$(@D)/config/mkinstalldirs

define UTILLINUX_INSTALL_STAGING_CMDS
	mkdir $(BR2_HOST_DIR)/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/uuid
	mkdir $(BR2_HOST_DIR)/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/blkid
	cp output/build/utillinux-2.20.1/libuuid/src/uuid.h $(BR2_HOST_DIR)/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/uuid/
	cp output/build/utillinux-2.20.1/libblkid/src/blkid.h $(BR2_HOST_DIR)/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/blkid/
	cp output/build/utillinux-2.20.1/libblkid/src/.libs/libblkid.* $(BR2_HOST_DIR)/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/
	cp  output/build/utillinux-2.20.1/libuuid/src/.libs/lib* $(BR2_HOST_DIR)/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/
endef

$(eval $(call AUTOTARGETS,package,utillinux))
$(eval $(call AUTOTARGETS,package,utillinux,host))

# Once this builds edit the PCK_CONFIG_PATH
# export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/home/robert/50G/br_oct19/buildroot_2011_05/output/build/utillinux-2.20.1/libblkid/:/home/robert/50G/br_oct19/buildroot_2011_05/output/build/utillinux-2.20.1/libuuid/


# Add these to let udev-1.82 build
# export PKG_CONFIG_PATH=/home/robert/50G/br_oct19/buildroot_2011_05/output/build/utillinux-2.20.1/libblkid/:/home/robert/50G/br_oct19/buildroot_2011_05/output/build/utillinux-2.20.1/libuuid/

# mkdir ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/uuid
# mkdir ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/blkid
# cp ./output/build/utillinux-2.20.1/libuuid/src/uuid.h ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/uuid/
# cp ./output/build/utillinux-2.20.1/libblkid/src/blkid.h ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/blkid/
# cp ./output/build/utillinux-2.20.1/libblkid/src/.libs/libblkid.* ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/
# cp  output/build/utillinux-2.20.1/libuuid/src/.libs/lib* ./output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/
#
