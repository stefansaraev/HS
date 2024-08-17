# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="cronosagent"
PKG_VERSION="9c861df1"
PKG_SITE="https://git.brandmeister.network/public/CronosAgent"
PKG_URL="https://git.brandmeister.network/api/v1/repos/public/CronosAgent/archive/$PKG_VERSION.tar.gz"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -PR cronosagent $INSTALL/usr/bin
}
