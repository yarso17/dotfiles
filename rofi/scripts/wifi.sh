#!/usr/bin/env bash

ROFI_CONFIG_DIR=/home/yarso/.config/rofi/configs/

WIFI=$(nmcli d wifi list | awk -F " " 'NR>1{ if($1 != "*" ) print $2 }' | rofi -dmenu -p "Wifi" -i -theme "$ROFI_CONFIG_DIR"wifi.rasi)

if [ -z "$WIFI" ]; then
    exit 1
fi

PASS=$(rofi -dmenu -theme "$ROFI_CONFIG_DIR"password.rasi -p "Password" -password)

nmcli d wifi connect $WIFI password $PASS
