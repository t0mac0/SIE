#!/bin/bash
sudo usbboot -f ./usbboot_2gb_nand.cfg  -c "boot"
sudo usbboot -f ./usbboot_2gb_nand.cfg  -c "nprog 1024 openwrt-xburst-qi_lb60-uImage.bin 0 0 -n"
