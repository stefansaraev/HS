# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="libxml2"
PKG_VERSION="2.9.9"
PKG_SITE="http://xmlsoft.org"
PKG_WATCH="ftp://xmlsoft.org/libxml2/ libxml2-(\d.\d.\d)\.tar.gz"
PKG_URL="ftp://xmlsoft.org/libxml2/$PKG_NAME-$PKG_VERSION.tar.gz"

PKG_CONFIGURE_OPTS_TARGET="
  ac_cv_header_ansidecl_h=no
  --disable-shared --enable-static
  --enable-ipv6
  --without-python
  --without-lzma
  --with-sysroot=$SYSROOT_PREFIX
"

post_makeinstall_target() {
  rm -f $SYSROOT_PREFIX/usr/bin/xml2-config
  rm -rf $INSTALL/usr
}
