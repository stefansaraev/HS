# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="strace"
PKG_VERSION="5.19"
PKG_SITE="https://github.com/strace/strace"
PKG_WATCH="https://github.com/strace/strace/tags/ .*/v([\d\.]*)\.tar\.gz"
PKG_URL="https://github.com/strace/strace/releases/download/v$PKG_VERSION/strace-$PKG_VERSION.tar.xz"

PKG_CONFIGURE_OPTS_TARGET="--enable-mpers=check"

pre_configure_target() {
  LDFLAGS="$LDFLAGS -static"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/src/strace $INSTALL/usr/bin
}
