# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="rngd"
PKG_VERSION="5"
PKG_SITE="https://git.kernel.org/pub/scm/utils/kernel/rng-tools/rng-tools.git/about/"
PKG_URL="https://git.kernel.org/pub/scm/utils/kernel/rng-tools/rng-tools.git/snapshot/rng-tools-$PKG_VERSION.tar.gz"

make_target() {
  touch $PKG_BUILD/rng-tools-config.h

  # rngd.c rngd_entsource.c rngd_linux.c util.c rngd_rdrand.c fips.c
  rm $PKG_BUILD/rngtest.c
  $CC $CFLAGS -static -static -DHAVE_CONFIG_H *.c $LDFLAGS -o rngd
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/sbin
  cp -R rngd $INSTALL/usr/sbin
}
