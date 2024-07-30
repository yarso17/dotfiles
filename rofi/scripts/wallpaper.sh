#!/usr/bin/env bash

WALLPAPERS_PATH=/home/yarso/Images/wallpapers/
HYPR_DIR=/home/yarso/.config/hypr/hyprpaper.conf
ROFI_CONFIG_DIR=/home/yarso/.config/rofi/configs/wallpaper.rasi

NEW_WALL=$(ls $WALLPAPERS_PATH | rofi -dmenu -p "Select wallpaper" -i -theme $ROFI_CONFIG_DIR)

echo '' > $(echo $HYPR_DIR)
echo "preload = $WALLPAPERS_PATH$NEW_WALL" >> $(echo $HYPR_DIR)
echo "wallpaper =,$WALLPAPERS_PATH$NEW_WALL" >> $(echo $HYPR_DIR)
echo "splash = false" >> $(echo $HYPR_DIR)

cp -rf $WALLPAPERS_PATH$NEW_WALL  ~/.cache/current_wallpaper

# wal -q -i $WALLPAPERS_PATH$NEW_WALL 

killall hyprpaper 
hyprpaper &>/dev/null & disown
