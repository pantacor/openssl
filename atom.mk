
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := openssl
LOCAL_DESCRIPTION := openssl module

LOCAL_EXPORT_LDLIBS =

LOCAL_AUTOTOOLS_MAKE_BUILD_ARGS :=
LOCAL_AUTOTOOLS_MAKE_INSTALL_ARGS := lib=lib

define LOCAL_AUTOTOOLS_CMD_CONFIGURE
	cp -r $(PRIVATE_PATH)/*  $(call module-get-build-dir,openssl)/obj
	rm -f $(call module-get-build-dir,openssl)/obj/atom.mk
	sh -c "cd $(call module-get-build-dir,openssl)/obj; CC=gcc ./Configure --prefix=/usr --libdir=lib --cross-compile-prefix=$(TARGET_CROSS) $(TARGET_ARCH_OPENSSL)"
endef

include $(BUILD_AUTOTOOLS)

