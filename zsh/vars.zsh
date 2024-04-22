export CURSOR_TYPE="ibeam"
export CUSTOM_ZSH_CONFIG="$DOTFILES/zsh/custom.zsh"

# FZF 
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# Deno
export DENO_INSTALL="$HOME/.deno"
export PATH="$HOME/.deno/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Misc Paths
export PATH="$HOME/dotfiles/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
