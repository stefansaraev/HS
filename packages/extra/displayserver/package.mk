# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="displayserver"
PKG_VERSION="5dc9030e9c"
PKG_SITE="https://github.com/stefansaraev/DisplayServer/tree/master"
PKG_URL="https://github.com/stefansaraev/DisplayServer/archive/$PKG_VERSION.tar.gz"

PKG_CMAKE_OPTS_TARGET="
  -DGIT_VERSION=$PKG_VERSION
"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -PR DisplayServer $INSTALL/usr/bin
}
