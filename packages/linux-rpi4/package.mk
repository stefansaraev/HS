# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="linux-rpi4"
PKG_VERSION="2ff65ffbde"
PKG_SITE="https://github.com/raspberrypi/linux/tree/rpi-6.1.y"
PKG_URL="https://github.com/raspberrypi/linux/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"

MAKEFLAGS="$MAKEFLAGS LDFLAGS= CROSS_COMPILE=${TARGET_NAME}-"

post_unpack() {
  cp $PROJECT_DIR/packages/$PKG_NAME/linux.$TARGET_ARCH.conf $PKG_BUILD/.config
  sed -e "s|^ARCH[[:space:]]*?=.*$|ARCH = $TARGET_KERNEL_ARCH|" -i $PKG_BUILD/Makefile
}

pre_configure_target() {
  make -C $PKG_BUILD olddefconfig
}

make_target() {
  KBUILD_BUILD_USER="-,-'<" KBUILD_BUILD_HOST="," make zImage dtbs
}

makeinstall_target() {
  mkdir -p $PKG_BUILD/.boot
  cp arch/arm/boot/zImage $PKG_BUILD/.boot/kernel7l.img
  cp arch/arm/boot/dts/bcm2711-rpi-4-b.dtb $PKG_BUILD/.boot
}
