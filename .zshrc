ZSH_THEME="robbyrussell"

plugins=()

source $ZSH/oh-my-zsh.sh

# common
alias vim="nvim"
alias v="nvim"
alias dots="cd $HOME/dev/dotfiles"
alias rr="ranger"
alias feh="feh -F"
alias sd="sudo shutdown now"
alias rb="sudo reboot now"
alias nb='newsboat'
alias bar="sh $HOME/.local/share/dwm/bar/bar.sh &"

# tmux
alias tns="tmux new -s"
alias ta="tmux at"
alias tk="pkill tmux"
alias tls="tmux ls"

# docker
alias dps='docker ps --format "table {{ .ID }}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'

## clipboard
alias xclip='xclip -sel clip'

## human readable sizes for du and df
alias du="du -h"
alias df="df -h"

# git
alias gd='git diff'                     # Diff changes in working dir against latest commit
alias gdc='git diff --cached'           # Diff 'added' changes against latest commit'
alias gs='git status --short'           # Quick git status
alias gsd='git stash && git stash drop && echo "Want it back? git stash apply \$stash_hash"' # Clean working dir, but keeps a magic ref
alias ga='git add -vu'                  # Add all tracked files
alias gA='git add -vA'                  # Add all tracked + untracked files
alias gc='git commit'                   # Simple commit
alias gcm='git commit -m'               # Simple commit with a message
alias gca='git commit -a'               # Add tracked files + commit
alias gcam='git commit -am'             # Add tracked files + commit with a message
alias gco='git checkout'                # Checkout
alias gcob='git checkout -b'            # Checkout to a new branch
alias gpp='git pull && git push'        # Never forget to pull first
alias gpu='git push -u origin $(git status -sb | head -n1 | cut -c 4-)' # git push -u origin <BRANCHNAME>
alias gpf='git push --force-with-lease && echo "YOU MONSTER!"' # A cleaner alternative
alias gl="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all" # Pretty logs

fd() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}

# vi mode
bindkey -v
bindkey '^R' history-incremental-search-backward

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# kubectl
source <(kubectl completion zsh)

# helm
source <(helm completion zsh)

# npm
source <(npm completion)

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

eval "$(direnv hook zsh)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/branco/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/branco/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/branco/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/branco/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

