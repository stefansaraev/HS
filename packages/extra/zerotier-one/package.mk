# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="zerotier-one"
PKG_VERSION="1.12.2"
PKG_SITE="https://github.com/zerotier/ZeroTierOne"
PKG_WATCH="https://github.com/zerotier/ZeroTierOne/tags/ .*/([\d\.]*)\.tar\.gz"
PKG_URL="https://github.com/zerotier/ZeroTierOne/archive/refs/tags/$PKG_VERSION.tar.gz"

post_unpack() {
  rm -f $PKG_BUILD/CMakeLists.txt
}

pre_configure_target() {
  CXXFLAGS="$CXXFLAGS -static"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -PR zerotier-one $INSTALL/usr/bin
  ln -sf zerotier-one $INSTALL/usr/bin/zerotier-idtool
  ln -sf zerotier-one $INSTALL/usr/bin/zerotier-cli
}
