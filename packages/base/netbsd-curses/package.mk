# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="netbsd-curses"
PKG_VERSION="0.3.2"
PKG_SITE="https://github.com/sabotage-linux/netbsd-curses"
PKG_WATCH="https://github.com/sabotage-linux/netbsd-curses/tags/ .*/v([\d\.]*)\.tar\.gz"
PKG_URL="https://github.com/sabotage-linux/netbsd-curses/archive/v$PKG_VERSION.tar.gz"

make_target() {
  make HOSTCC="$HOST_CC" LDFLAGS="$LDFLAGS -static" STATIC_BINS=1 PREFIX=/usr all-static
}

makeinstall_target() {
  make HOSTCC="$HOST_CC" LDFLAGS="$LDFLAGS -static" STATIC_BINS=1 PREFIX=$SYSROOT_PREFIX/usr install-static
}
