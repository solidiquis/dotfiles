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
export FZF_DEFAULT_OPTS='--bind ctrl-n:down,ctrl-p:up'

alias python="python3"

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

# Prompt
export PS1=$'\U250C\U2500 \x1b[1;32m%c\x1b[0m $(git_prompt_info) \n\U2514 \x1b[1;31m\U03B2\x1b[0m '

