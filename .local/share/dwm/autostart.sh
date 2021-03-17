#!/bin/bash
feh --bg-scale --randomize ~/Pictures/wallpapers/* &
picom &
dunst &
flameshot &
dwmblocks &
$HOME/.config/polybar/launch.sh &
