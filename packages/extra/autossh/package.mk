# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="autossh"
PKG_VERSION="1.4g"
PKG_SITE="http://www.harding.motd.ca/autossh/"
PKG_WATCH="http://www.harding.motd.ca/autossh/ autossh-(.*)\.tgz"
PKG_URL="http://www.harding.motd.ca/autossh/$PKG_NAME-$PKG_VERSION.tgz"

PKG_CONFIGURE_OPTS_TARGET="
  ac_cv_func_malloc_0_nonnull=yes
  ac_cv_func_realloc_0_nonnull=yes
  ac_cv_have_decl___progname=yes
"

pre_configure_target() {
  rm -rf $PKG_BUILD_SUBDIR
  export LDFLAGS="$LDFLAGS -static"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD/autossh $INSTALL/usr/bin
}
