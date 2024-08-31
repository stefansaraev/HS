# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="tcpdump"
PKG_VERSION="4.99.5"
PKG_SITE="http://www.tcpdump.org/"
PKG_WATCH="http://www.tcpdump.org/release/ tcpdump-([\d\.]*)\.tar\.gz"
PKG_URL="http://www.tcpdump.org/release/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="libpcap"

PKG_CMAKE_OPTS_TARGET="
  -DENABLE_SMB=OFF
  -DWITH_SMI=OFF
  -DWITH_CRYPTO=OFF
"

pre_configure_target() {
  LDFLAGS="$LDFLAGS -static"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/tcpdump $INSTALL/usr/bin
}
