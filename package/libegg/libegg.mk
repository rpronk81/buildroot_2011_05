#############################################################
#
# libegg
#
#############################################################
LIBEGG_VERSION=58181774498482f5e0fece51f285d5705508adc4
LIBEGG_SITE=git://github.com/ptdropper/libeggdbus.git

LIBEGG_AUTORECONF = YES
LIBEGG_INSTALL_STAGING = YES
LIBEGG_DEPENDENCIES = host-pkg-config

# LIBEGG_CONF_OPT 

HOST_LIBEGG_DEPENDENCIES = host-pkg-config host-expat
HOST_LIBEGG_CONF_OPT = \
		--disable-tests \
		--disable-asserts \
		--enable-abstract-sockets \
		--disable-selinux \
		--disable-xml-docs \
		--disable-doxygen-docs \
		--disable-static \
		--enable-inotify \


$(eval $(call AUTOTARGETS,package,libegg))
$(eval $(call AUTOTARGETS,package,libegg,host))
