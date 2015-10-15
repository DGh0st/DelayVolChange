export ARCHS = armv7 arm64
export TARGET = iphone:clang:latest:latest

PACKAGE_VERSION = 0.0.2

include theos/makefiles/common.mk

TWEAK_NAME = DelayVolChange
DelayVolChange_FILES = Tweak.xm
DelayVolChange_LDFLAGS += -Wl,-segalign,4000

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
