# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="arduipi_oled"
PKG_VERSION="4119148b05"
PKG_SITE="https://github.com/hallard/ArduiPi_OLED/tree/master"
PKG_URL="https://github.com/hallard/ArduiPi_OLED/archive/$PKG_VERSION.tar.gz"

pre_configure_target() {
  export CFLAGS="$CFLAGS -Wno-implicit-function-declaration"
}
