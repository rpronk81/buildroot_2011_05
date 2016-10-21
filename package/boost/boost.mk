#############################################################
#
# boost
#
#############################################################

BOOST_VERSION = 1.55.0
BOOST_SOURCE = boost_1_55_0.tar.bz2
BOOST_SITE = https://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.bz2/download
BOOST_INSTALL_STAGING = YES
BOOST_DEPENDENCIES = zlib
BOOST_CFLAGS = $(TARGET_CFLAGS)

define BOOST_BUILD_CMDS
#	#$(MAKE1) -C $(@D) all
	#$(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LS) -C $(@D) all
	(cd $(@D); \
	./bootstrap.sh )
endef

define BOOST_INSTALL_TARGET_CMDS
	#$(MAKE1) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
	(cd $(@D); \
	./b2 -a install --prefix=$(TARGET_DIR)/boost/install )
endef

define BOOST_REMOVE_DEV_FILES
	rm -rf $(TARGET_DIR)/install
endef


$(eval $(call GENTARGETS,package,boost))
