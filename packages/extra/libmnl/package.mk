# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="libmnl"
PKG_VERSION="1.0.4"
PKG_SITE="http://netfilter.org/projects/libmnl"
PKG_WATCH="https://netfilter.org/projects/libmnl/downloads.html .*/libmnl-(.*)\.tar.bz2"
PKG_URL="http://netfilter.org/projects/libmnl/files/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"
