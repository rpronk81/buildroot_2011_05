#############################################################
#
# json-dbus-bridge
#
#############################################################

JSON_DBUS_BRIDGE_VERSION = 1.0.0
JSON_DBUS_BRIDGE_SITE = http://public.pengutronix.de/software/json-dbus-bridge
JSON_DBUS_BRIDGE_SOURCE = json-dbus-bridge-$(JSON_DBUS_BRIDGE_VERSION).tar.bz2

JSON_DBUS_BRIDGE_DEPENDENCIES = libfcgi libevent

JSON_DBUS_BRIDGE_AUTORECONF = YES

define JSON_DBUS_BRIDGE_CPY_JSON_C_LIB
	mkdir -p $(BR2_HOST_DIR)/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/json
	cp $(DL_DIR)/../output/build/json-c-0.10-20120530/*.h $(BR2_HOST_DIR)/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/json/
	cp -p $(DL_DIR)/../output/target/usr/lib/libjson.*  $(BR2_HOST_DIR)/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib
endef

JSON_DBUS_BRIDGE_POST_EXTRACT_HOOKS += JSON_DBUS_BRIDGE_CPY_JSON_C_LIB

$(eval $(call AUTOTARGETS,package,json-dbus-bridge))

export PKG_CONFIG_PATH=$(DL_DIR)/../output/build/json-c-0.10-20120530
