## Mini OS for RPi & MMDVM DMR Hotspots / Repeaters

#### Supported RPis

- Raspberry Pi Zero W
- Raspberry Pi Model B+
- Raspberry Pi 2 Model B
- Raspberry Pi 3 Model B
- Raspberry Pi 3 Model B+
- Raspberry Pi 4 Model B

#### Supported Modems / Displays

- Any MMDVM via UART (ZUMspot, MMDVM HS Hat, ...)
- Any MMDVM via USB (cdc_acm, ftdi_sio, ch341, pl2303, ...)
- 0.96" i2c OLED
- Nextion

#### BUILD

```
make
```

#### INSTALL from .img

```
zcat HS.*.img.gz | dd of=/dev/mmcblk0
```

#### UPDATE from .tar

```
mount -o remount,rw /boot
tar xf HS.*.tar.gz -C /boot
mount -o remount,ro /boot
rm -f HS.*.tar.gz
reboot
```

#### INITIAL SETUP
root password: t4sh4kb4t3

ap mode ssid / passphrase (for initial set up): HS-AP / t4sh4kb4t3

config files: /etc/config - copy whatever you need to /storage/.config

[downloads](https://saraev.ca/pub/HS)
