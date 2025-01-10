# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="linux"
PKG_VERSION="14c5fee3bb"
PKG_SITE="https://github.com/raspberrypi/linux/tree/rpi-6.6.y"
PKG_URL="https://github.com/raspberrypi/linux/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"

MAKEFLAGS="$MAKEFLAGS LDFLAGS= CROSS_COMPILE=${TARGET_NAME}-"

post_unpack() {
  cp $PROJECT_DIR/packages/$PKG_NAME/linux.$TARGET_ARCH.conf $PKG_BUILD/.config
  sed -e "s|^ARCH[[:space:]]*?=.*$|ARCH = $TARGET_KERNEL_ARCH|" -i $PKG_BUILD/Makefile
}

make_host() {
  :
}

makeinstall_host() {
  make INSTALL_HDR_PATH=$SYSROOT_PREFIX/usr headers_install
}

pre_configure_target() {
  make -C $PKG_BUILD olddefconfig
}

make_target() {
  PKG_CONFIG_LIBDIR="" KBUILD_BUILD_USER="-,-'<" KBUILD_BUILD_HOST="," make zImage dtbs
}

makeinstall_target() {
  mkdir -p $PKG_BUILD/.boot
  cp arch/arm/boot/zImage $PKG_BUILD/.boot/kernel7l.img
  cp arch/arm/boot/dts/broadcom/bcm2710-rpi-2-b.dtb $PKG_BUILD/.boot
  cp arch/arm/boot/dts/broadcom/bcm2710-rpi-3-b.dtb $PKG_BUILD/.boot
  cp arch/arm/boot/dts/broadcom/bcm2710-rpi-3-b-plus.dtb $PKG_BUILD/.boot
  cp arch/arm/boot/dts/broadcom/bcm2710-rpi-zero-2-w.dtb $PKG_BUILD/.boot
  cp arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb $PKG_BUILD/.boot

  mkdir -p $PKG_BUILD/.boot/overlays
  cp arch/arm/boot/dts/overlays/disable-bt.dtbo $PKG_BUILD/.boot/overlays
}
