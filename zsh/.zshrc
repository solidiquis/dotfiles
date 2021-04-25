export DOTFILES="$HOME/dotfiles/zsh"
export ZSH_DISABLE_COMPFIX="true"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source $DOTFILES/init_tasks --source_only
source $DOTFILES/bookmarking --source_only
source $DOTFILES/misc --source_only

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
export PATH="$HOME/dotfiles/bin:$PATH"
