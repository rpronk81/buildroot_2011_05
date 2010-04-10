CDRKIT_VERSION=1.1.10
CDRKIT_SOURCE=cdrkit-$(CDRKIT_VERSION).tar.gz
CDRKIT_SITE=http://www.cdrkit.org/releases/

CDRKIT_DEPENDENCIES=libcap bzip2 host-cmake
HOST_CDRKIT_DEPENDENCIES=host-libcap host-cmake host-bzip2

ifeq ($(BR2_ENDIAN),"BIG")
CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=1
else
CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=0
endif

define CDRKIT_CONFIGURE_CMDS
 -mkdir $(@D)/build
 (cd $(@D)/build ; \
	$(HOST_DIR)/usr/bin/cmake .. \
		-Wno-dev \
		-DCMAKE_SYSTEM_NAME:STRING="Linux" \
		-DCMAKE_C_COMPILER:FILEPATH="$(TARGET_CC)" \
		-DCMAKE_CXX_COMPILER:FILEPATH="$(TARGET_CXX)" \
		-DCMAKE_C_FLAGS:STRING="$(TARGET_CFLAGS)" \
		-DCMAKE_EXE_LINKER_FLAGS:STRING="$(TARGET_LDFLAGS)" \
		-DCMAKE_MODULE_LINKER_FLAGS:STRING="$(TARGET_LDFLAGS)" \
		-DCMAKE_SHARED_LINKER_FLAGS:STRING="$(TARGET_LDFLAGS)" \
		-DCMAKE_FIND_ROOT_PATH:PATH="$(STAGING_DIR)" \
		-DCMAKE_INSTALL_PREFIX:PATH="$(TARGET_DIR)/usr" \
		$(CMAKE_ENDIAN_OPT) \
 )
endef

define CDRKIT_BUILD_CMDS
 $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build
endef

define CDRKIT_INSTALL_TARGET_CMDS
 $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/build install
endef

define HOST_CDRKIT_CONFIGURE_CMDS
 -mkdir $(@D)/build
 (cd $(@D)/build ; \
	$(HOST_DIR)/usr/bin/cmake .. \
		-Wno-dev \
		-DCMAKE_C_FLAGS="$(HOST_CFLAGS)" \
		-DCMAKE_EXE_LINKER_FLAGS:STRING="$(HOST_LDFLAGS)" \
		-DCMAKE_MODULE_LINKER_FLAGS:STRING="$(HOST_LDFLAGS)" \
		-DCMAKE_SHARED_LINKER_FLAGS:STRING="$(HOST_LDFLAGS)" \
		-DCMAKE_INSTALL_PREFIX:STRING="$(HOST_DIR)/usr" \
 )
endef

define HOST_CDRKIT_BUILD_CMDS
 $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/build
endef

define HOST_CDRKIT_INSTALL_CMDS
 $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/build  install
endef

$(eval $(call GENTARGETS,package,cdrkit))
$(eval $(call GENTARGETS,package,cdrkit,host))
