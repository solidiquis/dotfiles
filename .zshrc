# Zsh defaults
export ZSH="/Users/benjamin/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Aliases - Work
alias wefunder="cd /Users/benjamin/Desktop/Code/Ruby/wefunder"
alias _2021="cd /Users/benjamin/Desktop/Code/Ruby/wefunder/app/assets/javascripts/_2021"

# Aliases
alias python="python3"
alias vi ="vim"
alias dotfiles="cd ~/dotfiles"
alias gr="go run"
alias rustdir="cd /Users/benjamin/Desktop/Code/Rust"
alias godir="cd /Users/benjamin/Desktop/Code/Go"
alias rubydir="cd /Users/benjamin/Desktop/Code/Ruby"
alias pythondir="cd /Users/benjamin/Desktop/Code/Python"
alias javascriptdir="cd /Users/benjamin/Desktop/Code/Javascript"

# Go
export GOPATH=$HOME/go

# Paths
export PATH="/Users/benjamin/go/bin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:$PATH"
export PATH="/Users/benjamin/dotfiles/bin:$PATH"

# Boot tmux if tmux is exists
if command -v tmux &> /dev/null && \
    [ -n "$PS1" ] && \
    [[ ! "$TERM" =~ screen ]] && \
    [[ ! "$TERM" =~ tmux ]] && \
    [ -z "$TMUX" ]
then
  exec tmux
fi
