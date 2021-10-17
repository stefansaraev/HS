# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="mmdvmcal"
PKG_VERSION="4fb7983460"
PKG_SITE="https://github.com/g4klx/MMDVMCal/tree/master"
PKG_URL="https://github.com/g4klx/MMDVMCal/archive/$PKG_VERSION.tar.gz"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp -PR MMDVMCal $INSTALL/usr/bin
}
