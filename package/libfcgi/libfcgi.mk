##############################################################################
#
# libfcgi
#
##############################################################################
LIBFCGI_VERSION = 2.4.0
LIBFCGI_SOURCE = fcgi-$(LIBFCGI_VERSION).tar.gz
LIBFCGI_SITE = http://www.fastcgi.com/dist

LIBFCGI_INSTALL_STAGING = YES
LIBFCGI_AUTORECONF = YES
# LIBFCGI_CONF_OPT = --without-examples

LIBFCGI_CONF_ENV = LDFLAGS="$(TARGET_LDFLAGS) -lm"

$(eval $(call AUTOTARGETS,package,libfcgi))
