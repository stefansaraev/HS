# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="rpi-userland"
PKG_VERSION="97bc8180ad"
PKG_SITE="https://github.com/raspberrypi/userland/tree/master"
PKG_URL="https://github.com/raspberrypi/userland/archive/$PKG_VERSION.tar.gz"

PKG_CMAKE_OPTS_TARGET="
  -DLIBRARY_TYPE=STATIC
  -DVMCS_INSTALL_PREFIX=/usr
"

pre_configure_target() {
  CFLAGS="$CFLAGS -static"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD/build/bin/vcgencmd $INSTALL/usr/bin
  cp $PKG_BUILD/build/bin/tvservice $INSTALL/usr/bin
}
