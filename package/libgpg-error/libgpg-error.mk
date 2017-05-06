#############################################################
#
# libgpg-error
#
#############################################################
LIBGPG_ERROR_VERSION:=1.8
LIBGPG_ERROR_SOURCE:=libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
LIBGPG_ERROR_SITE:=ftp://ftp.gnupg.org/gcrypt/libgpg-error/x

LIBGPG_ERROR_INSTALL_STAGING = YES

$(eval $(call AUTOTARGETS,package,libgpg-error))
