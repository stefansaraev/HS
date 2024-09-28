# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="brcmfmac_sdio-firmware-rpi"
PKG_VERSION="4b356e134e"
PKG_SITE="https://github.com/RPi-Distro/firmware-nonfree/tree/bookworm"
PKG_URL="https://github.com/RPi-Distro/firmware-nonfree/archive/$PKG_VERSION.tar.gz"
PKG_NEED_REBUILD="initramfs"

make_init() {
  :
}

makeinstall_init() {
  mkdir -p $INSTALL/lib/firmware/brcm
  cp -i $PKG_BUILD/debian/config/brcm80211/brcm/brcmfmac43430-sdio.bin $INSTALL/lib/firmware/brcm
  cp -i $PKG_BUILD/debian/config/brcm80211/brcm/brcmfmac43430-sdio.txt $INSTALL/lib/firmware/brcm

  cp -i $PKG_BUILD/debian/config/brcm80211/brcm/brcmfmac43436-sdio.bin $INSTALL/lib/firmware/brcm
  cp -i $PKG_BUILD/debian/config/brcm80211/brcm/brcmfmac43436-sdio.txt $INSTALL/lib/firmware/brcm
  cp -i $PKG_BUILD/debian/config/brcm80211/brcm/brcmfmac43436s-sdio.bin $INSTALL/lib/firmware/brcm
  cp -i $PKG_BUILD/debian/config/brcm80211/brcm/brcmfmac43436s-sdio.txt $INSTALL/lib/firmware/brcm

  ln -sf ../cypress/cyfmac43455-sdio-minimal.bin $PKG_BUILD/debian/config/brcm80211/brcm/brcmfmac43455-sdio.bin
  cp -i $PKG_BUILD/debian/config/brcm80211/brcm/brcmfmac43455-sdio.bin $INSTALL/lib/firmware/brcm
  cp -i $PKG_BUILD/debian/config/brcm80211/brcm/brcmfmac43455-sdio.txt $INSTALL/lib/firmware/brcm
}
