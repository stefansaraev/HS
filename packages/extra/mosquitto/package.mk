# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="mosquitto"
PKG_VERSION="2.0.8"
PKG_SITE="https://mosquitto.org"
PKG_WATCH="https://mosquitto.org/files/source/  mosquitto-(.*)\.tar.gz"
PKG_URL="https://mosquitto.org/files/source/mosquitto-1.6.8.tar.gz"
PKG_DEPENDS_TARGET="libressl"

PKG_CMAKE_OPTS_TARGET="
  -DWITH_STATIC_LIBRARIES=ON
  -DDOCUMENTATION=OFF
"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/src/mosquitto $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/client/mosquitto_sub $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/client/mosquitto_pub $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/client/mosquitto_rr $INSTALL/usr/bin
}
