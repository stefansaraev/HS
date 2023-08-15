# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="gmp"
PKG_VERSION="6.3.0"
PKG_SITE="http://gmplib.org/"
PKG_WATCH="https://gmplib.org/download/gmp/ gmp-([\d\.]*)\.tar\.xz"
PKG_URL="https://gmplib.org/download/gmp/$PKG_NAME-$PKG_VERSION.tar.xz"

PKG_CONFIGURE_OPTS_HOST="
  --disable-shared --enable-static
  --enable-cxx
"

PKG_CONFIGURE_OPTS_TARGET="
  --disable-shared --enable-static
  --enable-cxx
"
