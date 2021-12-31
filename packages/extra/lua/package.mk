# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="lua"
PKG_VERSION="5.4.3"
PKG_SITE="http://www.lua.org/"
PKG_WATCH="http://www.lua.org/ftp lua-([\d\.]*)\.tar\.gz"
PKG_URL="http://www.lua.org/ftp/lua-$PKG_VERSION.tar.gz"

PKG_DEPENDS_TARGET="readline"

pre_configure_target() {
  LDFLAGS="$LDFLAGS -static"
  export LIBS="-lreadline -lcurses -lterminfo"
}

make_target() {
  make linux
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD/src/lua $INSTALL/usr/bin
  cp $PKG_BUILD/src/luac $INSTALL/usr/bin
}
