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

# FZF 
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--bind=ctrl-w:up,ctrl-m:down'

alias python="python3"
alias gr="go run"
alias cr="cargo run"

# Go
export GOPATH=$HOME/go
export GOBIN="$GOPATH/bin:$PATH"

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$HOME/.deno/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Misc Paths
export PATH="$HOME/dotfiles/bin:$PATH"
