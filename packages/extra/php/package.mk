# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="php"
PKG_VERSION="8.1.2"
PKG_SITE="https://www.php.net"
PKG_WATCH="https://www.php.net/downloads.php .*/php-(.*)\.tar.gz"
PKG_URL="https://www.php.net/distributions/php-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="libressl curl libxml2 sqlite oniguruma"

PKG_CONFIGURE_OPTS_TARGET="
  --disable-shared --enable-static
  --oldincludedir=$SYSROOT_PREFIX/usr/include
  --disable-rpath
  --enable-cli
  --disable-fpm
  --disable-litespeed
  --disable-phpdbg
  --disable-cgi
  --without-valgrind
  --disable-debug
  --enable-zts
  --with-config-file-path=/storage/.config
  --with-openssl
  --without-kerberos
  --with-sqlite3
  --with-zlib
  --enable-bcmath
  --without-bz2
  --enable-calendar
  --enable-ctype
  --with-curl
  --enable-dba
  --enable-inifile
  --enable-flatfile
  --enable-dom
  --disable-exif
  --without-ffi
  --enable-fileinfo
  --enable-filter
  --disable-gd
  --with-freetype
  --with-mhash
  --with-gettext
  --disable-intl
  --enable-mbstring
  --enable-opcache
  --enable-pcntl
  --enable-pdo
  --disable-phar
  --enable-simplexml
  --enable-soap
  --enable-sockets
  --enable-sysvmsg
  --enable-sysvsem
  --enable-sysvshm
"

pre_configure_target() {
  LDFLAGS="$LDFLAGS -static"
  PKG_CONFIG="pkg-config --static"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/sapi/cli/php $INSTALL/usr/bin

  mkdir -p $INSTALL/etc/config
  cp $PKG_BUILD/php.ini-development $INSTALL/etc/config
  cp $PKG_BUILD/php.ini-production $INSTALL/etc/config
  cp $PKG_BUILD/php.ini-production $INSTALL/etc/config/php.ini
}
