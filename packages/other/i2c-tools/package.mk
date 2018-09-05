# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="i2c-tools"
PKG_VERSION="4.2"
PKG_SITE="https://i2c.wiki.kernel.org/index.php/I2C_Tools"
PKG_WATCH="https://mirrors.edge.kernel.org/pub/software/utils/i2c-tools/ i2c-tools-([\d\.]*)\.tar\.xz"
PKG_URL="https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/snapshot/$PKG_NAME-$PKG_VERSION.tar.gz"

MAKEFLAGS="$MAKEFLAGS USE_STATIC_LIB=1"

pre_configure_target() {
  LDFLAGS="$LDFLAGS -static"
}

makeinstall_target() {
  mkdir -p $SYSROOT_PREFIX/usr/lib
  cp lib/libi2c.a $SYSROOT_PREFIX/usr/lib
}
