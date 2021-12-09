
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
	sh -c "cd $(call module-get-build-dir,openssl)/obj; CC=gcc ./Configure --prefix=/usr --libdir=lib --cross-compile-prefix=$(TARGET_CROSS) $(TARGET_ARCH_OPENSSL) no-idea no-camellia no-seed no-bf no-cast no-des no-rc2 no-rc4 no-rc5 no-md2 no-md4 no-mdc2 no-dsa no-dh no-ec no-ecdsa no-ecdh no-sock no-ssl3 no-err no-engine no-acvp-tests no-unit-test no-ui-console no-ts no-trace no-weak-ssl-ciphers no-tls no-stdio no-ssl-trace no-md2 no-md4 no-dtls no-dtls1 no-tls1 no-dtls1 no-crypto-mdebug -DOPENSSL_USE_IPV6=0 -Os"
endef

include $(BUILD_AUTOTOOLS)

