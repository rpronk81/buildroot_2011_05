################################################################################
#
# json-c
#
################################################################################

JSON_C_VERSION = 0.10-20120530
JSON_C_SITE = https://github.com/json-c/json-c/archive
JSON_C_INSTALL_STAGING = YES

$(eval $(call AUTOTARGETS,package,json-c))
