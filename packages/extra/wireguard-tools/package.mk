# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="wireguard-tools"
PKG_VERSION="1.0.20200827"
PKG_SITE="http://www.harding.motd.ca/wireguard-tools/"
PKG_WATCH="https://git.zx2c4.com/wireguard-tools/ /wireguard-tools/snapshot/wireguard-tools-(.*)\.tar.xz"
PKG_URL="https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-${PKG_VERSION}.tar.xz"

PKG_MAKE_OPTS_TARGET="-C src"

pre_configure_target() {
  rm -rf $PKG_BUILD_SUBDIR
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD/src/wg $INSTALL/usr/bin
}
