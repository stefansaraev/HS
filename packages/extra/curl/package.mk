# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="curl"
PKG_VERSION="7.83.0"
PKG_SITE="http://curl.haxx.se"
PKG_WATCH="https://curl.haxx.se/download/ download/curl-([\d\.]*)\.tar\.gz"
PKG_URL="http://curl.haxx.se/download/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="libressl"
PKG_OPKG_DEPENDS="libressl"

PKG_CONFIGURE_OPTS_TARGET="
  ac_cv_path_PERL=
  --disable-shared --enable-static
  --disable-debug
  --disable-optimize
  --disable-curldebug
  --disable-ares
  --enable-symbol-hiding
  --enable-http
  --disable-ftp
  --disable-file
  --disable-ldap
  --disable-ldaps
  --disable-rtsp
  --enable-proxy
  --disable-dict
  --disable-telnet
  --disable-tftp
  --disable-pop3
  --disable-imap
  --disable-smb
  --disable-smtp
  --disable-gopher
  --disable-manual
  --disable-libcurl-option
  --enable-ipv6
  --disable-versioned-symbols
  --disable-threaded-resolver
  --disable-verbose
  --disable-sspi
  --disable-crypto-auth
  --disable-ntlm-wb
  --enable-cookies
  --with-zlib
  --without-gssapi
  --without-egd-socket
  --with-random=/dev/urandom
  --without-gnutls
  --with-ssl
  --without-polarssl
  --without-mbedtls
  --without-cyassl
  --without-nss
  --without-axtls
  --with-ca-bundle=/storage/.extra/etc/ssl/cert.pem
  --without-ca-path
  --without-libpsl
  --without-libssh2
  --without-librtmp
  --without-libidn2
  --without-nghttp2
  --without-nghttp3
  --without-zsh-functions-dir
"

pre_configure_target() {
  LDFLAGS="$LDFAGS -static"
}

post_unpack() {
  rm -f $PKG_BUILD/CMakeLists.txt
}

post_makeinstall_target() {
  rm -rf $SYSROOT_PREFIX/usr/bin/curl-config
  rm -rf $INSTALL/usr/bin/curl-config
}
