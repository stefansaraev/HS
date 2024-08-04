# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="readline"
PKG_VERSION="8.2.13"
PKG_SITE="http://www.gnu.org/software/readline/"
PKG_WATCH="http://ftp.gnu.org/gnu/readline/ readline-([\d\.]*).tar.gz"
PKG_URL="http://ftpmirror.gnu.org/readline/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="netbsd-curses"

PKG_CONFIGURE_OPTS_TARGET="
  bash_cv_wcwidth_broken=no
  --disable-shared
  --enable-static
  --with-curses
"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/share/readline
}
