# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="tcpdump"
PKG_VERSION="4.99.0"
PKG_SITE="http://www.tcpdump.org/"
PKG_WATCH="http://www.tcpdump.org/release/ tcpdump-([\d\.]*)\.tar\.gz"
PKG_URL="http://www.tcpdump.org/release/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="libpcap"

PKG_CONFIGURE_OPTS_TARGET="
  --disable-smb
  --without-smi
  --with-crypto=no
"

pre_configure_target() {
  CFLAGS="$CFLAGS -static"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/tcpdump $INSTALL/usr/bin
}
