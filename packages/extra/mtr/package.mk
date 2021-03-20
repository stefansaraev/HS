# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="mtr"
PKG_VERSION="0.94"
PKG_SITE="https://github.com/traviscross/mtr"
PKG_WATCH="https://github.com/traviscross/mtr/releases/ .*/archive/refs/tags/v([\d\.]*)\.tar\.gz"
PKG_URL="https://github.com/traviscross/mtr/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="netbsd-curses"

PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--without-gtk"

pre_configure_target() {
  export LIBS="-lcurses -lterminfo"
  CFLAGS="$CFLAGS -static"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/mtr $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/mtr-packet $INSTALL/usr/bin
}
