#
#/usr/bin/env bash

dir="$HOME/.config/rofi/launchers/type-1"
theme='yarso'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
