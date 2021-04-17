export DOTFILES="/Users/benjamin/dotfiles/zsh"
export ZSH="/Users/benjamin/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source $DOTFILES/custom_cmds --source_only

run_init_tasks

# FZF - Include dotfiles in search
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

alias python="python3"
alias vi ="vim"
alias gr="go run"

# Go
export GOPATH=$HOME/go
export GOBIN="$GOPATH/bin:$PATH"

# Paths
export PATH="/Users/benjamin/dotfiles/bin:$PATH"

