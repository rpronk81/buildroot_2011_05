################################################################################
#
# json-c
#
################################################################################

JSON_C_VERSION = 0.10-20120530
JSON_C_SITE = https://github.com/json-c/json-c/archive
JSON_C_INSTALL_STAGING = YES
JSON_C_INSTALL_TARGET = YES
# JSON_C_AUTORECONF = YES

define JSON_C_INSTALL_STAGING_CMDS
   mkdir $(BR2_HOST_DIR)/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/json/
   cp output/build/json-c-0.10-20120530/*.h $(BR2_HOST_DIR)/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/json/
   cp -p output/target/usr/lib/libjson.*  /opt/buildroot-2011.05/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib
endef

$(eval $(call AUTOTARGETS,package,json-c))
