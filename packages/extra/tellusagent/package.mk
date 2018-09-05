# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="tellusagent"
PKG_VERSION="7c2ef725"
PKG_SITE="https://code.brandmeister.network/r3abm/TellusAgent.git"
PKG_URL="https://code.brandmeister.network/r3abm/TellusAgent/-/archive/master/TellusAgent-$PKG_VERSION.tar.gz"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -PR tellusagent $INSTALL/usr/bin
}
