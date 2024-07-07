#!/usr/bin/env bash

dir="/home/yarso/.config/polybar/config.ini"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q mainbar -c $dir &
