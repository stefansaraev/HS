# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="libnl"
PKG_VERSION="3_11_0"
PKG_SITE="https://github.com/thom311/libnl"
PKG_WATCH="https://github.com/thom311/libnl/tags/ /thom311/libnl/archive/refs/tags/libnl(.*)\.tar\.gz"
PKG_URL="https://github.com/thom311/$PKG_NAME/releases/download/${PKG_NAME}${PKG_VERSION}/$PKG_NAME-${PKG_VERSION//_/.}.tar.gz"

PKG_CONFIGURE_OPTS_TARGET="
  --disable-cli
  --disable-debug
"

pre_configure_target() {
  CFLAGS="$CFLAGS -D__GLIBC__=1" # wtf libc-compat.h
}

post_makeinstall_target() {
  rm -rf $INSTALL/etc
}
