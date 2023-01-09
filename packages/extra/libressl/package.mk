# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="libressl"
PKG_VERSION="3.7.0"
PKG_SITE="http://www.libressl.org/"
PKG_WATCH="https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/ libressl-(.*)\.tar\.gz"
PKG_URL="http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_CMAKE_OPTS_TARGET="
  -DOPENSSLDIR=/etc/ssl
  -DLIBRESSL_APPS=ON
  -DLIBRESSL_TESTS=OFF
  -DBUILD_SHARED_LIBS=OFF
"

post_makeinstall_target() {
  rm -rf $INSTALL/etc/ssl/*.cnf
}
