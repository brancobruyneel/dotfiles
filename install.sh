#!/bin/bash

path=$(pwd)

folders=(
	$HOME/.local
	$HOME/.local/bin
	$HOME/.local/bin/statusbar
	$HOME/.local/share
	$HOME/.local/share/dwm
	$HOME/.config
	$HOME/.config/.Xresources.d
	$HOME/.config/.Xresources.d/themes
	$HOME/.config/alacritty
	$HOME/.config/dunst
	$HOME/.config/nvim
	$HOME/.config/nvim/lua
	$HOME/.config/nvim/lua/config
	$HOME/.config/picom
	$HOME/.config/polybar
	$HOME/.config/ranger
	$HOME/.config/rofi
	$HOME/.config/themes
)

dotfiles=(
	# Xorg
	$path/.Xresources:$HOME/.Xresources
	$path/.xinitrc:$HOME/.xinitrc

	# Bash
	$path/.bashrc:$HOME/.bashrc
	$path/.bash_profile:$HOME/.bash_profile
	$path/.profile:$HOME/.config/profile

	# Terminal
	$path/alacritty/*:$HOME/.config/alacritty/

	# Neovim
	$path/.config/nvim/init.lua:$HOME/.config/nvim/init.lua
	$path/.config/nvim/lua/config/*:$HOME/.config/nvim/lua/bkegley

	# Polybar
	$path/.config/polybar/config:$HOME/.config/polybar/config
	$path/.config/polybar/launch.sh:$HOME/.config/polybar/launch.sh

	# Picom
	$path//*:$HOME/.config/compton

	# Rofi
	$path/rofi/*:$HOME/.config/rofi

	# Dunst
	$path/dunst/*:$HOME/.config/dunst

	# tmux
	$path/tmux/tmux.conf:$HOME/.tmux.conf

	# Themes
	$path/themes/*:$HOME/themes/
)

for folder in ${folders[@]}; do
	[ ! -d $folder ] && mkdir -p $folder
done

for dotfile in ${dotfiles[@]}; do
    key=${dotfile%%:*}
    value=${dotfile##*:}

    [ -f $key ] && ln -sf $key $value
done
