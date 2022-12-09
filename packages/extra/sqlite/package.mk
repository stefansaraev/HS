# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="sqlite"
PKG_VERSION="3400000"
PKG_SITE="https://www.sqlite.org/"
PKG_WATCH="https://distfiles.macports.org/sqlite3/ sqlite-autoconf-(.*)\.tar\.gz"
PKG_URL="https://www.sqlite.org/2022/$PKG_NAME-autoconf-$PKG_VERSION.tar.gz"

PKG_DEPENDS_TARGET="readline"

PKG_CONFIGURE_OPTS_TARGET="
  --disable-shared --enable-static
  --enable-readline
  --enable-threadsafe
  --disable-dynamic-extensions
"

pre_configure_target() {
  CFLAGS="$CFLAGS -DSQLITE_CONFIG_MEMSTATUS=0"
  CFLAGS="$CFLAGS -DSQLITE_ENABLE_STAT3"
  CFLAGS="$CFLAGS -DSQLITE_TEMP_STORE=3 -DSQLITE_DEFAULT_MMAP_SIZE=268435456"

  CFLAGS="$CFLAGS -fPIC"
}
