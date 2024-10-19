#!/usr/bin/env bash

SCRIPTS_DIR=/home/yarso/.config/rofi/scripts
ROFI_CONFIG_DIR=/home/yarso/.config/rofi/configs/options.rasi
WIFI="􀙇 Wifi"
WALLPAPER="􀣵 Wallpaper"
CHARS="􀙬 Chars"
FILE_EXPLORER="􀈖 Files"
SCREENSHOT="􀌟 Screenshot"
SCREENSHOT_REGION="􀌟 Screenshot region"
MOVE_TO_MAIN_MONITOR="􀈉 Move to Main"
MOVE_TO_SECONDARY_MONITOR="􀈉 Move to Secondary"
OPTIONS="$WIFI\n$WALLPAPER\n$CHARS\n$FILE_EXPLORER\n$SCREENSHOT\n$SCREENSHOT_REGION\n$MOVE_TO_MAIN_MONITOR\n$MOVE_TO_SECONDARY_MONITOR"

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
    $SCRIPTS_DIR/screenshot.sh
        ;;
    $SCREENSHOT_REGION)
    $SCRIPTS_DIR/screenshot_region.sh
        ;;
    $MOVE_TO_MAIN_MONITOR)
    hyprctl dispatch movecurrentworkspacetomonitor eDP-1
        ;;
    $MOVE_TO_SECONDARY_MONITOR)
    hyprctl dispatch movecurrentworkspacetomonitor HDMI-A-1
        ;;
esac
