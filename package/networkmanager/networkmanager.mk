#############################################################
#
# networkmanager
#
#############################################################

NETWORK_MANAGER_VERSION = 0.8.1
NETWORK_MANAGER_SOURCE = NetworkManager-0.8.1.tar.gz
NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/0.8/
NETWORK_MANAGER_INSTALL_STAGING = YES
NETWORK_MANAGER_INSTALL_TARGET = YES
# GCC_PATH=$(@D)/../../host/usr/bin
NETWORK_MANAGER_DEPENDENCIES = libdbus

$(eval $(call AUTOTARGETS,package,networkmanager))
