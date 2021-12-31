# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="bwm-ng"
PKG_VERSION="0.6.3"
PKG_SITE="https://github.com/vgropp/bwm-ng"
PKG_WATCH="https://github.com/vgropp/bwm-ng/releases/ .*/archive/refs/tags/v([\d\.]*)\.tar\.gz"
PKG_URL="https://github.com/vgropp/bwm-ng/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="netbsd-curses"

PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="
  --with-time
  --with-getifaddrs
  --with-sysctl
  --with-sysctldisk
  --with-procnetdev
  --with-partitions
"

post_unpack() {
  # configure.in is deprecated
  mv $PKG_BUILD/configure.in $PKG_BUILD/configure.ac
}

pre_configure_target() {
  LDFLAGS="$LDFLAGS -static"
  export LIBS="-lcurses -lterminfo"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/src/bwm-ng $INSTALL/usr/bin
}
