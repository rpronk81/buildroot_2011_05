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
BOOST_ROOT := boost_$(subst .,_,$(BOOST_VERSION))
GCC_PATH=$(@D)/../../host/usr/bin
BOOST_ENABLED_LIBS := \
        atomic \
    chrono \
    date_time \
    exception \
    filesystem \
    program_options \
    random \
    serialization \
    signals \
    system \
    thread \
    timer \

define BOOST_BUILD_CMDS
	env -i HOME="$$HOME" LC_CTYPE="$${LC_ALL:-$${LC_CTYPE:-$$LANG}}" PATH="$$PATH:$(GCC_PATH)" USER="$$USER" \
	sh -c 'cat $(@D)/../../../package/boost/user-config.jam | sed 's@BR201105@'"$(@D)/../../../"'@'g > $(@D)/tools/build/v2/user-config.jam' 
	sh -c 'cd $(@D) && \
	$(@D)/bootstrap.sh && \
	$(@D)/b2 $(addprefix --with-,$(BOOST_ENABLED_LIBS)) install --prefix="$(@D)/boost.build/"'
endef

define BOOST_INSTALL_TARGET_CMDS
	# Nothing to do, the successful BOOT_BUILD_CMDS will also install
endef

define BOOST_REMOVE_DEV_FILES
	rm -rf $(@D)/boost.build $(@D)/b2 $(@D)/bjam $(@D)project-config.jam $(@D)bootstrap.log
endef


$(eval $(call GENTARGETS,package,boost))
