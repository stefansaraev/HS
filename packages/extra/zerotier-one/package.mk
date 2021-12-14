# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="zerotier-one"
PKG_VERSION="30c77cfee5"
PKG_SITE="https://github.com/zerotier/ZeroTierOne/tree/master"
PKG_URL="https://github.com/zerotier/ZeroTierOne/archive/$PKG_VERSION.tar.gz"

post_unpack() {
  rm -f $PKG_BUILD/CMakeLists.txt
}

pre_configure_target() {
  export CXXFLAGS="$CXXFLAGS -D_GLIBCXX_USE_C99_STDIO=1 -D_GLIBCXX_USE_C99_STDLIB=1 -static"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -PR zerotier-one $INSTALL/usr/bin
  ln -sf zerotier-one $INSTALL/usr/bin/zerotier-idtool
  ln -sf zerotier-one $INSTALL/usr/bin/zerotier-cli
}
