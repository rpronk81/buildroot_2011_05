#############################################################
#
# networkmanager
#
#############################################################

NETWORKMANAGER_VERSION = 0.8.1
# NETWORKMANAGER_SOURCE = networkmanager-0.8.1.tar.gz
NETWORKMANAGER_SOURCE = NetworkManager-0.8.1.tar.bz2
NETWORKMANAGER_SITE = https://download.gnome.org/sources/NetworkManager/0.8/
NETWORKMANAGER_INSTALL_STAGING = YES
NETWORKMANAGER_INSTALL_TARGET = YES
# GCC_PATH=$(@D)/../../host/usr/bin
NETWORKMANAGER_DEPENDENCIES = wireless_tools libnl polkit libnss
#NETWORKMANAGER_AUTORECONF = YES

$(eval $(call AUTOTARGETS,package,networkmanager))
