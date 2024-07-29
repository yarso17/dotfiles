#!/usr/bin/env bash

dir="/home/yarso/.config/rofi/configs/power"

# CMDs
host=`hostname`

# Options
shutdown=' Shutdown'
reboot=' Reboot'
lock=' Lock'
suspend=' Suspend'
logout=' Logout'
yes=' Yes'
no=' No'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-theme ${dir}.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; x-offset: 2%; y-offset: -1%; fullscreen: false; width: 250px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	# echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
	echo -e "$suspend\n$logout\n$reboot\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--suspend' ]]; then
			# mpc -q pause
			# amixer set Master mute
			systemctl suspend
		elif [[ $1 == '--logout' ]]; then
      hyprctl dispatch exit
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
    # Works with i3lock
    /home/yarso/scripts/lockScreen
        ;;
    $suspend)
		run_cmd --suspend
    /home/yarso/scripts/lockScreen
        ;;
    $logout)
		run_cmd --logout
        ;;
esac