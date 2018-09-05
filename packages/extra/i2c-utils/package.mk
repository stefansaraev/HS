# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="i2c-utils"
PKG_VERSION="4.1"
PKG_SITE="https://i2c.wiki.kernel.org/index.php/I2C_Tools"
PKG_URL=""
PKG_DEPENDS_TARGET="i2c-tools"

make_target() {
  :
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -PR $(get_pkg_build i2c-tools)/tools/i2cdetect $INSTALL/usr/bin
  cp -PR $(get_pkg_build i2c-tools)/tools/i2cdump $INSTALL/usr/bin
  cp -PR $(get_pkg_build i2c-tools)/tools/i2cget $INSTALL/usr/bin
  cp -PR $(get_pkg_build i2c-tools)/tools/i2cset $INSTALL/usr/bin
  cp -PR $(get_pkg_build i2c-tools)/tools/i2ctransfer $INSTALL/usr/bin
}
