#############################################################
#
# networkmanager
#
#############################################################
NETWORKMANAGER_VERSION = 0.8.1
NETWORKMANAGER_SOURCE = networkmanager-0.8.1.tar.gz
NETWORKMANAGER_SITE = https://download.gnome.org/sources/NetworkManager/0.8
NETWORKMANAGER_INSTALL_STAGING = YES
NETWORKMANAGER_INSTALL_TARGET = YES
NETWORKMANAGER_DEPENDENCIES = wireless_tools libnl polkit libnss pppd

NETWORKMANAGER_PRE_CONFIGURE_HOOKS = autogen.sh

# NETWORKMANAGER_AUTORECONF = YES
# check this, needs to do once then apply patch to the configure file, then no reconf NETWORKMANAGER_AUTORECONF = YES

NETWORKMANGER_CONF_OPT = --includedir=/media/robert/50G/temp/buildroot_2011_05/output/build/pppd-2.4.5/pppd
NETWORKMANGER_MAKE_OPT = CFLAGS=/media/robert/50G/temp/buildroot_2011_05/output/build/pppd-2.4.5/pppd

$(eval $(call AUTOTARGETS,package,networkmanager))
