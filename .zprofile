export DEFAULT_USER='branco'
export EDITOR='/usr/local/bin/nvim'
export VISUAL='/usr/local/bin/nvim'
export PAGER='/usr/bin/less'
export TERMINAL='/usr/bin/st'
export BROWSER='/usr/bin/brave'
export DOTFILES="$HOME/dev/dotfiles"
export BAT_THEME="base16"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export ZSH="/home/branco/.oh-my-zsh"

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/rofi"
export PATH="$PATH:$HOME/.local/bin/tmux"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/.npm-global/bin"

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

export LIBVA_DRIVER_NAME="vdpau"
export VDPAU_DRIVER="nvidia"

export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
