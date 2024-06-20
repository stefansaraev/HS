# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="tellusagent"
PKG_VERSION="7b0f0219"
PKG_SITE="https://git.brandmeister.network/public/TellusAgent.git"
PKG_URL="https://git.brandmeister.network/public/TellusAgent/archive/$PKG_VERSION.tar.gz"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -PR tellusagent $INSTALL/usr/bin
}
