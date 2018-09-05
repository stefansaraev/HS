# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="cronosagent"
PKG_VERSION="9c861df1"
PKG_SITE="https://code.brandmeister.network/r3abm/CronosAgent.git"
PKG_URL="https://code.brandmeister.network/r3abm/CronosAgent/-/archive/master/CronosAgent-$PKG_VERSION.tar.gz"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -PR cronosagent $INSTALL/usr/bin
}
