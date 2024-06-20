# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="gcc"
PKG_VERSION="13.3.0"
PKG_SITE="http://gcc.gnu.org/"
PKG_WATCH="ftp://gcc.gnu.org/pub/gcc/releases/gcc-(13\.[\d\.]*)/ gcc-([\d\.]+)\.tar\.xz"
PKG_URL="http://ftp.gnu.org/gnu/gcc/$PKG_NAME-$PKG_VERSION/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_BOOTSTRAP="binutils:host gmp:host mpfr:host mpc:host"
PKG_DEPENDS_HOST="musl"

GCC_COMMON_CONFIGURE_OPTS="
  --target=$TARGET_NAME
  --with-sysroot=$SYSROOT_PREFIX
  --with-gmp=$TOOLCHAIN
  --with-mpfr=$TOOLCHAIN
  --with-mpc=$TOOLCHAIN
  --with-linker-hash-style=gnu
  --disable-shared --enable-static
  --disable-libada
  --disable-libmudflap
  --disable-lto
  --disable-libquadmath
  --disable-libatomic
  --disable-libitm
  --disable-libssp
  --disable-libgomp
  --disable-multilib
  --disable-nls
  --disable-libsanitizer
  --disable-gcov
"

PKG_CONFIGURE_OPTS_BOOTSTRAP="
  $GCC_COMMON_CONFIGURE_OPTS
  --enable-languages=c
  --disable-threads
  --without-headers
  --with-newlib
  --disable-decimal-float
  $GCC_OPTS
"

PKG_CONFIGURE_OPTS_HOST="
  $GCC_COMMON_CONFIGURE_OPTS
  --enable-languages=c,c++
  --disable-libstdcxx-pch
  --disable-libstdcxx-verbose
  --disable-libstdcxx-dual-abi
  --disable-rpath
  --enable-clocale=generic
  $GCC_OPTS
"

makeinstall_bootstrap() {
  make install
}
