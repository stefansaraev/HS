# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="nano"
PKG_VERSION="5.5"
PKG_SITE="http://www.nano-editor.org/"
PKG_WATCH="https://www.nano-editor.org/dist/v(.*)/ nano-([\d\.]+)\.tar\.xz"
PKG_URL="https://www.nano-editor.org/dist/v5/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="netbsd-curses"

PKG_CONFIGURE_OPTS_TARGET="
  --enable-utf8
  --disable-rpath
  --disable-nls
  --disable-browser
  --disable-comment
  --disable-extra
  --disable-help
  --disable-justify
  --disable-libmagic
  --disable-speller
"

pre_configure_target() {
  CFLAGS="$CFLAGS -static"
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/share/nano
  rm -rf $INSTALL/usr/lib/charset.alias
}
