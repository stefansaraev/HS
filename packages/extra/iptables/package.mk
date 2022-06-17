# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="iptables"
PKG_VERSION="1.8.8"
PKG_SITE="http://www.netfilter.org/"
PKG_WATCH="https://netfilter.org/projects/iptables/downloads.html .*/iptables-(.*)\.tar.bz2"
PKG_URL="http://www.netfilter.org/projects/iptables/files/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="libmnl libnftnl"

pre_configure_target() {
  rm -rf $PKG_BUILD_SUBDIR
  CFLAGS="$CFLAGS -D__UAPI_DEF_ETHHDR=0"
}

PKG_CONFIGURE_OPTS_TARGET="
  --enable-static --disable-shared
  --sbindir=/usr/bin
  --disable-devel
  --disable-libipq
  --disable-bpf-compiler
  --disable-nfsynproxy
  --enable-nftables
  --disable-connlabel
  --with-xt-lock-name=/var/run/xtables.lock
"

post_makeinstall_target() {
  rm -rf $INSTALL/etc
  rm -f $INSTALL/usr/bin/iptables-xml
}
