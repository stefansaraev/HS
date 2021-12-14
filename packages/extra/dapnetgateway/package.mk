# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="dapnetgateway"
PKG_VERSION="631297ece7"
PKG_SITE="https://github.com/g4klx/DAPNETGateway/tree/master"
PKG_URL="https://github.com/g4klx/DAPNETGateway/archive/$PKG_VERSION.tar.gz"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -PR DAPNETGateway $INSTALL/usr/bin

  mkdir -p $INSTALL/etc/config
  cp -PR $PKG_BUILD/DAPNETGateway.ini $INSTALL/etc/config
}
