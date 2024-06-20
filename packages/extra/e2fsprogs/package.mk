# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="e2fsprogs"
PKG_VERSION="1.47.1"
PKG_SITE="https://github.com/tytso/e2fsprogs"
PKG_WATCH="https://github.com/tytso/e2fsprogs/tags .*/archive/refs/tags/v([\d\.]*)\.tar\.gz"
PKG_URL="https://github.com/tytso/e2fsprogs/archive/v$PKG_VERSION.tar.gz"

PKG_CONFIGURE_OPTS_TARGET="
  BUILD_CC=$HOST_CC
  ac_cv_path_PERL=
  --enable-symlink-install
  --enable-symlink-build
  --disable-elf-shlibs
  --disable-bsd-shlibs
  --disable-profile
  --disable-jbd-debug
  --disable-blkid-debug
  --disable-testio-debug
  --enable-libuuid
  --enable-libblkid
  --disable-backtrace
  --disable-debugfs
  --disable-imager
  --enable-resizer
  --disable-defrag
  --enable-fsck
  --disable-e2initrd-helper
  --disable-uuidd
  --disable-tdb
  --disable-mmp
  --disable-bmap-stats
  --disable-nls
  --disable-rpath
  --disable-threads
  --disable-fuse2fs
"

pre_configure_target() {
  LDFLAGS="$LDFLAGS -static"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/e2fsck/e2fsck $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/misc/blkid $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/misc/mke2fs $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/misc/tune2fs $INSTALL/usr/bin
  cp $PKG_BUILD_SUBDIR/resize/resize2fs $INSTALL/usr/bin
}
