# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="libpcap"
PKG_VERSION="1.10.4"
PKG_SITE="http://www.tcpdump.org/"
PKG_WATCH="http://www.tcpdump.org/release/ libpcap-([\d\.]*)\.tar\.gz"
PKG_URL="http://www.tcpdump.org/release/$PKG_NAME-$PKG_VERSION.tar.gz"

post_unpack() {
  rm -f $PKG_BUILD/CMakeLists.txt
}

PKG_CONFIGURE_OPTS_TARGET="
  --disable-shared --enable-static
  --enable-ipv6
  --disable-usb
  --disable-bluetooth
  --disable-dbus
  --with-pcap=linux
  --without-libnl
"

pre_configure_target() {
  LDFLAGS="$LDFLAGS -static"
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/usr/bin
}
