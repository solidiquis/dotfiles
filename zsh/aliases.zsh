alias vi="$HOME/progs/nvim-macos/bin/nvim"

if [[ $OSTYPE =~ "darwin" ]]; then
  alias rustdoc="rustup doc --toolchain=stable-x86_64-apple-darwin"
  alias abrew="/opt/homebrew/bin/brew"
fi

if [[ ! -z $(command -v lsd) ]]; then
  alias ls="lsd"
fi

if [[ ! -z $(command -v bat) ]]; then
  alias bat="cat"
fi
