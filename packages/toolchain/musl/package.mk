# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="musl"
PKG_VERSION="1.2.4"
PKG_SITE="https://www.musl-libc.org/"
PKG_WATCH="https://www.musl-libc.org/download.html .*/musl-(.*)\.tar\.gz"
PKG_URL="https://www.musl-libc.org/releases/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="linux:host gcc:bootstrap"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"
