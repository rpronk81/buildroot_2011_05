#############################################################
#
# libegg
#
#############################################################
LIBEGG_VERSION=58181774498482f5e0fece51f285d5705508adc4
LIBEGG_SITE=git://github.com/ptdropper/libeggdbus.git

LIBEGG_AUTORECONF = YES
LIBEGG_INSTALL_STAGING = YES
LIBEGG_DEPENDENCIES = host-libegg
# HOST_LIBEGG_DEPENDENCIES = host-dbus-glib 

LIBEGG_CONF_OPT = \
	--program-prefix="" \
	--localstatedir=/var \
	--disable-static \
	--enable-shared \
	--disable-man-pages \
	--disable-gtk-doc 
#	--with-eggdbus-binding-tool=$(HOST_DIR)/usr/bin/eggdbus-binding-tool \
#	--with-eggdbus-glib-genmarshal=$(HOST_DIR)/usr/bin/eggdbus-glib-genmarshal \

EGG_DBUS_COMPILATION += $(BUILD_DIR)/src

LIBEGG_HOST_BINARY:=$(HOST_DIR)/usr/bin/eggdbus-binding-tool
HOST_LIBEGG_DEPENDENCIES = host-pkg-config host-expat
HOST_LIBEGG_CONF_OPT = \
		--disable-man-pages \
		--disable-gtk-doc

define LIBEGG_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib
	cp -P $(BUILD_DIR)/$(LIBEGG_BASE_NAME)/src/eggdbus/.libs/*.so* $(TARGET_DIR)/usr/lib
endef

$(eval $(call AUTOTARGETS,package,libegg))
$(eval $(call AUTOTARGETS,package,libegg,host))
