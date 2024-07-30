#!/usr/bin/env bash

SCRIPTS_DIR=/home/yarso/.config/rofi/scripts
ROFI_CONFIG_DIR=/home/yarso/.config/rofi/configs/options.rasi
WIFI="􀙇 Wifi"
WALLPAPER="􀣵 Wallpaper"
CHARS="􀙬 Chars"
FILE_EXPLORER="􀈖 Files"
SCREENSHOT="􀌟 Screenshot"
OPTIONS="$WIFI\n$WALLPAPER\n$CHARS\n$FILE_EXPLORER\n$SCREENSHOT"

rofi_cmd() {
	rofi -dmenu \
		-theme $ROFI_CONFIG_DIR
}

run_rofi() {
	echo -e $OPTIONS | rofi_cmd
}

chosen="$(run_rofi)"
case ${chosen} in
    $WIFI)
    $SCRIPTS_DIR/wifi.sh
        ;;
    $WALLPAPER)
    $SCRIPTS_DIR/wallpaper.sh
        ;;
    $CHARS)
    gnome-characters
        ;;
    $FILE_EXPLORER)
    nautilus
        ;;
    $SCREENSHOT)
    hyprshot -m output -o /home/yarso/Images/screenshots
        ;;
esac
