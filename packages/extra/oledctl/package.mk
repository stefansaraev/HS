# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="oledctl"
PKG_VERSION="0.1"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="arduipi_oled"

pre_configure_target() {
  cp -PR $PKG_DIR/source/* $PKG_BUILD/
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp oledctl $INSTALL/usr/bin
}
