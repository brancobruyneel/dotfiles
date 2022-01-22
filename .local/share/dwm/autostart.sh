#!/bin/bash
picom --experimental-backends --backend glx --xrender-sync-fence &
feh --bg-scale ~/Pictures/by_home4_2560.jpg &
dunst &
flameshot &
$HOME/.local/share/dwm/bar/bar.sh &
