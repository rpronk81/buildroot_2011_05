################################################################################
#
# json-c
#
################################################################################

JSON_C_VERSION = 0.10-20120530
JSON_C_SITE = https://github.com/json-c/json-c/archive
JSON_C_INSTALL_STAGING = YES

define JSON_C_INSTALL_STAGING_CMDS
   cp output/build/json-c-0.10-20120530/json_object_iterator.h $(BR2_HOST_DIR)/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/json/

endef

$(eval $(call AUTOTARGETS,package,json-c))
