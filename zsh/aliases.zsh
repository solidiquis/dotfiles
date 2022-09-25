if [[ -f $(which nvim) ]]; then
  alias vi="nvim"
else
  alias vi="vim"
fi

if [[ $OSTYPE =~ "darwin" ]]; then
  alias rustdoc="rustup doc --toolchain=stable-x86_64-apple-darwin"
  alias abrew="/opt/homebrew/bin/brew"
fi

