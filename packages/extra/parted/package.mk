# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="parted"
PKG_VERSION="3.6"
PKG_SITE="http://www.gnu.org/software/parted/"
PKG_WATCH="https://ftp.gnu.org/gnu/parted/ parted-([\d\.]*)\.tar\.xz"
PKG_URL="http://ftpmirror.gnu.org/parted/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="util-linux readline"

PKG_CONFIGURE_OPTS_TARGET="
  --disable-device-mapper
  --disable-shared
  --with-readline
  --disable-rpath
  --with-gnu-ld
"

pre_configure_target() {
  rm -rf $PKG_BUILD_SUBDIR
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD/parted/parted $INSTALL/usr/bin
  cp $PKG_BUILD/partprobe/partprobe $INSTALL/usr/bin
}
