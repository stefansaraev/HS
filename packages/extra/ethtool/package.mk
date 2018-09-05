# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="ethtool"
PKG_VERSION="5.10"
PKG_SITE="http://www.kernel.org/pub/software/network/ethtool/"
PKG_WATCH="http://www.kernel.org/pub/software/network/ethtool/ ethtool-([\d\.]*)\.tar\.xz"
PKG_URL="http://www.kernel.org/pub/software/network/ethtool/$PKG_NAME-$PKG_VERSION.tar.xz"

PKG_DEPENDS_TARGET="libmnl"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/ethtool $INSTALL/usr/bin
}
