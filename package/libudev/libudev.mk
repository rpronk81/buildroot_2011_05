################################################################################
#
# libudev
#
################################################################################

LIBUDEV_VERSION = 199
LIBUDEV_SOURCE = libudev-$(LIBUDEV_VERSION).tar.gz
LIBUDEV_SITE = https://github.com/ptdropper/libudev/blob/master/
LIBUDEV_INSTALL_STAGING = YES
#LIBUDEV_DEPENDENCIES = host-pkgconf udev libglib2
LIBUDEV_DEPENDENCIES = host-intltool
LIBUDEV_LICENSE = LGPLv2.1+
LIBUDEV_LICENSE_FILES = COPYING
LIBUDEV_AUTORECONF = YES

LIBUDEV_CONF_OPT = \
		--enable-shared \
		--disable-static \
		--disable-gtk-doc \
		--enable-debug=no \

$(eval $(call AUTOTARGETS,package,libudev))
