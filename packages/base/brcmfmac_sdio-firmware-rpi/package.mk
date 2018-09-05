# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="brcmfmac_sdio-firmware-rpi"
PKG_VERSION="39f45e47c4"
PKG_SITE="https://github.com/LibreELEC/brcmfmac_sdio-firmware-rpi"
PKG_URL="https://github.com/LibreELEC/brcmfmac_sdio-firmware-rpi/archive/$PKG_VERSION.tar.gz"
PKG_NEED_REBUILD="initramfs"

make_init() {
  :
}

makeinstall_init() {
  mkdir -p $INSTALL/lib/firmware/brcm
  cp -PR $PKG_BUILD/firmware/brcm/brcmfmac43430-sdio.* $INSTALL/lib/firmware/brcm
  cp -PR $PKG_BUILD/firmware/brcm/brcmfmac43455-sdio.* $INSTALL/lib/firmware/brcm
}
