# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="stm32flash"
PKG_VERSION="0.5"
PKG_SITE="https://sourceforge.net/projects/stm32flash/"
PKG_WATCH="http://sf.net/stm32flash/stm32flash-(\d\S*)\.(?:tgz|tbz|txz|(?:tar\.(?:gz|bz2|xz)))"
PKG_URL="https://prdownloads.sourceforge.net/project/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz"

MAKEFLAGS="$MAKEFLAGS PREFIX=/usr"

pre_configure_target() {
  LDFLAGS="$LDFLAGS -static"
}
