# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="opkg"
PKG_VERSION="0.4.4"
PKG_SITE="http://git.yoctoproject.org/cgit/cgit.cgi/opkg/"
PKG_WATCH="http://git.yoctoproject.org/cgit/cgit.cgi/opkg/ /cgit/cgit.cgi/opkg/snapshot/opkg-(.*)\.tar.gz"
PKG_URL="http://git.yoctoproject.org/cgit/cgit.cgi/opkg/snapshot/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="libarchive"

PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="
  --prefix=/
  --localstatedir=/storage/.extra/var
  --disable-xz
  --disable-bzip2
  --disable-curl
  --disable-sha256
  --disable-openssl
  --disable-ssl-curl
  --disable-gpg
  --with-static-libopkg
"

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/src/opkg $INSTALL/usr/bin
}
