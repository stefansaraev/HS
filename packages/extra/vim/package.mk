# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="vim"
PKG_VERSION="8.2"
PKG_SITE="http://www.vim.org/"
PKG_WATCH="http://ftp.vim.org/pub/vim/unix/ vim-([\d\.]*)\.tar\.bz2"
PKG_URL="http://ftp.vim.org/pub/vim/unix/vim-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="netbsd-curses"

PKG_CONFIGURE_OPTS_TARGET="
  vim_cv_tgetent=zero
  vim_cv_getcwd_broken=no
  vim_cv_memmove_handles_overlap=yes
  vim_cv_stat_ignores_slash=yes
  vim_cv_terminfo=yes
  vim_cv_tgent=zero
  vim_cv_toupper_broken=no
  vim_cv_tty_group=world
  vim_cv_tty_mode=0620
  ac_cv_sizeof_int=4
  ac_cv_small_wchar_t=no
  --enable-selinux=no
  --enable-gui=no
  --with-features=tiny
  --with-tlib=ncurses
  --without-x
"

pre_configure_target() {
  rm -rf $PKG_BUILD_SUBDIR
  export LIBS="-lterminfo"
  export LDFLAGS="$LDFLAGS -static"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_BUILD/src/vim $INSTALL/usr/bin
}
