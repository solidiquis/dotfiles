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
export NVM_DIR="$HOME/.nvm"

if [[ "$OSTYPE" =~ "darwin" ]]; then
  if [[ $(arch) =~ "arm64" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
  fi
fi
