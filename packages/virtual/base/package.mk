# SPDX-License-Identifier: GPL-2.0-only

PKG_NAME="base"
PKG_DEPENDS_TARGET="
  toolchain musl initramfs linux linux-rpi4 busybox nano dropbear
  bcm2835-bootloader wpa_supplicant
  opkg
  dmrhost
"
