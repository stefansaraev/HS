#!/bin/sh

case "$2" in
    AP-ENABLED)
      ip addr add 10.10.10.1/24 brd + dev wlan0
      killall -9 udhcpd &>/dev/null
      udhcpd -I 10.10.10.1
      ;;
    AP-DISABLED)
      ip addr del 10.10.10.1/24 brd + dev wlan0
      killall -9 udhcpd &>/dev/null
      ;;
esac
