# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="iw"
PKG_VERSION="6.9"
PKG_SITE="https://mirrors.edge.kernel.org/pub/software/network/iw/"
PKG_WATCH="https://mirrors.edge.kernel.org/pub/software/network/iw/ iw-(.*)\.tar.gz"
PKG_URL="https://mirrors.edge.kernel.org/pub/software/network/iw/$PKG_NAME-$PKG_VERSION.tar.xz"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD/iw $INSTALL/usr/bin
}
