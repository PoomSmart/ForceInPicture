TARGET = iphone:clang:latest:9.0
PACKAGE_VERSION = 1.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ForceInPicture
ForceInPicture_FILES = Tweak.xm
ForceInPicture_LIBRARIES = MobileGestalt

include $(THEOS_MAKE_PATH)/tweak.mk