# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="opkg"
PKG_VERSION="0.6.1"
PKG_SITE="https://git.yoctoproject.org/opkg/"
PKG_WATCH="https://git.yoctoproject.org/opkg/ /opkg/snapshot/opkg-(.*)\.tar.gz"
PKG_URL="https://git.yoctoproject.org/opkg/snapshot/$PKG_NAME-$PKG_VERSION.tar.gz"
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
