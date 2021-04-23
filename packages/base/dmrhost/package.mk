# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="dmrhost"
PKG_VERSION="8bc84dc02d"
PKG_SITE="https://github.com/stefansaraev/DMRHost/tree/dev"
PKG_URL="https://github.com/stefansaraev/DMRHost/archive/$PKG_VERSION.tar.gz"

PKG_CMAKE_OPTS_TARGET="
  -DGIT_VERSION=$PKG_VERSION
"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -PR DMRHost $INSTALL/usr/bin

  mkdir -p $INSTALL/etc/config
  cp -PR $PKG_BUILD/MMDVM.ini $INSTALL/etc/config
}
