# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="nftables"
PKG_VERSION="1.0.1"
PKG_SITE="http://www.netfilter.org/"
PKG_WATCH="https://netfilter.org/projects/nftables/downloads.html .*/nftables-((?!0.100|0.099)\S+).tar.bz2"
PKG_URL="http://www.netfilter.org/projects/nftables/files/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="libmnl libnftnl"

PKG_CONFIGURE_OPTS_TARGET="
  --enable-static --disable-shared
  --sbindir=/usr/bin
  --disable-debug
  --disable-man-doc
  --disable-python
  --without-cli
  --with-mini-gmp
"

post_makeinstall_target() {
  rm -rf $INSTALL/etc
}
