# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="stm32flash"
PKG_VERSION="0.7"
PKG_SITE="https://sourceforge.net/projects/stm32flash/"
PKG_WATCH="https://sourceforge.net/projects/stm32flash/files/ .*/stm32flash-([\d\.]*)\.tar\.gz/download"
PKG_URL="https://prdownloads.sourceforge.net/project/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"

MAKEFLAGS="$MAKEFLAGS PREFIX=/usr"

post_unpack() {
  rm -f $PKG_BUILD/configure
}

pre_configure_target() {
  LDFLAGS="$LDFLAGS -static"
}
