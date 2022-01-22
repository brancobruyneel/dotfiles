#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Shell variables
## Prompt
PS1='[\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]]\$ '

# Aliases
## Neovim
alias vim='nvim'

## Ranger
alias rr='ranger'

## Colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

## Easier directory jumping
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

## Clipboard
alias xclip='xclip -sel clip'

## Human readable sizes for du and df
alias du="du -h"
alias df="df -h"

## Git
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

export PATH="$PATH:/$HOME/.local/bin:/$HOME/.local/bin/statusbar"
