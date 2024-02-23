#!/bin/bash

swayidle -w \
	timeout 900 '~/.config/hypr/lock.sh' \
	timeout 1200 '
			hyprctl dispatch dpms off DP-5
			hyprctl dispatch dpms off DP-6
      systemctl suspend' \
	resume '
			hyprctl dispatch dpms on DP-5
			hyprctl dispatch dpms on DP-6
	' \
	before-sleep '~/.config/hypr/lock.sh' \
	lock '~/.config/hypr/lock.sh'
