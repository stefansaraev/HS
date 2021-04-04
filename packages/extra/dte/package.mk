# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="dte"
PKG_VERSION="1.10"
PKG_SITE="https://craigbarnes.gitlab.io/dte/"
PKG_WATCH="https://github.com/craigbarnes/dte/releases/ .*/dte-([\d\.]*)\.tar\.gz"
PKG_URL="https://github.com/craigbarnes/dte/releases/download/v$PKG_VERSION/dte-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="netbsd-curses"

makeinstall_target() {
  make prefix=$INSTALL/usr install
}
