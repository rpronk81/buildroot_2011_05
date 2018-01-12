################################################################################
#
# yaml-cpp
#
################################################################################

YAML_CPP_VERSION = 0.5.2
YAML_CPP_SITE = https://github.com/jbeder/yaml-cpp
YAML_CPP_INSTALL_STAGING = YES
YAML_CPP_LICENSE = MIT
YAML_CPP_LICENSE_FILES = license.txt

YAML_CPP_DEPENDENCIES = boost

# Disable testing and parse tools
YAML_CPP_CONF_OPTS += -DYAML_CPP_BUILD_TOOLS=OFF

$(eval $(call CMAKETARGETS,package,yaml-cpp))

