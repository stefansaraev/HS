# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="file"
PKG_VERSION="5.42"
PKG_SITE="http://www.darwinsys.com/file/"
PKG_WATCH="http://distfiles.macports.org/file/ file-([\d\.]*)\.tar\.gz"
PKG_URL="http://distfiles.macports.org/file/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="file:host"

PKG_CONFIGURE_OPTS_HOST="--disable-shared --enable-static"
PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -R $PKG_BUILD_SUBDIR/src/file $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/share/file
  cp -R $PKG_BUILD_SUBDIR/magic/magic.mgc $INSTALL/usr/share/file
}
