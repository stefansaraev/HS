# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="nextiondriver"
PKG_VERSION="1437e4e227"
PKG_SITE="https://github.com/on7lds/NextionDriver/tree/master"
PKG_URL="https://github.com/on7lds/NextionDriver/archive/$PKG_VERSION.tar.gz"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -PR NextionDriver $INSTALL/usr/bin
}
