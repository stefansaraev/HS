# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="libnftnl"
PKG_VERSION="1.2.2"
PKG_SITE="http://netfilter.org/projects/libnftnl"
PKG_WATCH="https://netfilter.org/projects/libnftnl/downloads.html .*/libnftnl-(.*)\.tar.bz2"
PKG_URL="http://netfilter.org/projects/libnftnl/files/$PKG_NAME-$PKG_VERSION.tar.bz2"

PKG_CONFIGURE_OPTS_TARGET="--enable-static --disable-shared"
