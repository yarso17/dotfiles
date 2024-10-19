#!/usr/bin/env bash

ROFI_CONFIG_DIR=/home/yarso/.config/rofi/configs/

SCREENSHOT_NAME=$(rofi -dmenu -theme "$ROFI_CONFIG_DIR"screenshot.rasi -p "Screenshot")

hyprshot -m region -o /home/yarso/Images/screenshots -f "$SCREENSHOT_NAME".png

