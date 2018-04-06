##############################################################################
#
# metalog
#
##############################################################################
METALOG_VERSION = 1
METALOG_SOURCE = metalog-$(METALOG_VERSION).tar.gz
METALOG_SITE =  https://github.com/ptdropper/metalog/raw/master/
METALOG_DEPENDENCIES = pcre

METALOG_INSTALL_STAGING = YES
METALOG_AUTORECONF = YES

$(eval $(call AUTOTARGETS,package,metalog))
