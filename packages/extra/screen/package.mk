# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="screen"
PKG_VERSION="5.0.0"
PKG_SITE="http://www.gnu.org/software/screen/"
PKG_WATCH="http://ftp.gnu.org/gnu/screen/ screen-([\d\.]*)\.tar\.gz"
PKG_URL="http://ftp.gnu.org/gnu/screen/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="netbsd-curses"

PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="
  --enable-colors256
  --disable-pam
  --disable-use-locale
  --disable-telnet
  --disable-socket-dir
"

pre_configure_target() {
  rm -rf $PKG_BUILD_SUBDIR
  CFLAGS="$CFLAGS -DTERMINFO -Wno-implicit-function-declaration"
  LDFLAGS="$LDFLAGS -static"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD/screen $INSTALL/usr/bin
}
