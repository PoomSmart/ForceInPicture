ifeq ($(SIMULATOR),1)
	ARCHS = arm64 x84_64
	TARGET = simulator:clang:latest:15.0
else
	ARCHS = armv7 arm64
	TARGET = iphone:clang:latest:9.0
endif
PACKAGE_VERSION = 1.0.1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ForceInPicture
$(TWEAK_NAME)_FILES = Tweak.xm
ifeq ($(SIMULATOR),1)
	$(TWEAK_NAME)_FILES += Tweak_os.xm
endif
$(TWEAK_NAME)_LIBRARIES = MobileGestalt

include $(THEOS_MAKE_PATH)/tweak.mk

ifeq ($(SIMULATOR),1)
setup:: clean all
	@rm -f /opt/simject/$(TWEAK_NAME).dylib
	@cp -v $(THEOS_OBJ_DIR)/$(TWEAK_NAME).dylib /opt/simject
	@cp -v $(PWD)/$(TWEAK_NAME).plist /opt/simject
endif
