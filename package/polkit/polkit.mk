############################################################# 
# 
# polkit 
# 
############################################################# 
 
POLKIT_VERSION = 0.103
POLKIT_SOURCE = polkit-0.103.tar.gz
#POLKIT_SOURCE = polkit-$(POLKIT_VERSION).tar.gz
POLKIT_SITE = http://www.freedesktop.org/software/polkit/releases
 
POLKIT_INSTALL_STAGING = YES
POLKIT_INSTALL_TARGET = YES
 
POLKIT_DEPENDENCIES = libglib2 host-intltool expat
 
# We could also support --with-authfw=pam
POLKIT_CONF_OPT = --with-authfw=shadow --with-os-type=unknown
#POLKIT_AUTORECONF = YES
 
#$(eval $(autotools-package))
$(eval $(call AUTOTARGETS,package,polkit))
