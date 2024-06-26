HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt incappendhistory

# common
alias vim="nvim"
alias v="nvim"

alias cat="bat"

alias dots="cd $HOME/dev/dotfiles"
alias rr="ranger"

alias sd="sudo shutdown now"
alias rb="sudo reboot now"

alias ls="ls --color=auto"
alias ll="ls -lh"
alias la="ls -a"
alias lla="ls -lah"

alias grep="grep --color=auto"
alias diff="diff --color=auto"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias tf=terraform

# glab
alias glrv="glab repo view -w"
alias glcr="glab ci run | tee /dev/tty | grep -o 'https://[^ ]*' | xargs open"


# tmux
alias t="tmux new -s"
alias ta="tmux at"
alias tk="pkill tmux"
alias tls="tmux ls"
alias tsd="tmux-sync-dirs"

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
alias gp='git pull'                     # Pull
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
bindkey -v '^?' backward-delete-char

export VISUAL=nvim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# fzf
source /opt/homebrew/opt/fzf/shell/completion.zsh
source /opt/homebrew/opt/fzf/shell/key-bindings.zsh

bindkey -s '^f' 'tmux-sessionizer\n'
bindkey -s '^s' 'tmux-switch-session\n'

# npm
source <(npm completion)

# ssh key
eval $(keychain --eval --quiet id_rsa)

eval "$(starship init zsh)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

autoload -Uz compinit
compinit

source <(glab completion --shell zsh)
