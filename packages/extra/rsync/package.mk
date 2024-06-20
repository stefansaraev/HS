# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="rsync"
PKG_VERSION="3.3.0"
PKG_SITE="http://www.samba.org/ftp/rsync/rsync.html"
PKG_WATCH="https://download.samba.org/pub/rsync/src/ rsync-([\d\.]*)\.tar\.gz"
PKG_URL="https://download.samba.org/pub/rsync/src/rsync-$PKG_VERSION.tar.gz"

PKG_CONFIGURE_OPTS_TARGET="
  --disable-acl-support
  --disable-xattr-support
  --with-included-popt
  --disable-simd
  --disable-asm
  --disable-locale
  --disable-xxhash
  --disable-openssl
  --disable-zstd
  --disable-lz4
  --disable-iconv-open
  --disable-iconv
  --disable-acl-support
  --disable-xattr-support
"

pre_configure_target() {
  LDFLAGS="$LDFLAGS -static"
}

post_makeinstall_target() {
  rm -f $INSTALL/usr/bin/rsync-ssl
}
