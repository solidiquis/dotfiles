user=$(id -un)
projects="/Users/$user/Desktop/Code"

echo "
export ZSH='/Users/$user/.oh-my-zsh'
ZSH_THEME='robbyrussell'
plugins=(git)
source $ZSH/oh-my-zsh.sh

# FZF - Include dotfiles in search
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g '''

# Aliases
alias python='python3'
alias vi ='vim'
alias dotfiles='cd ~/dotfiles'
alias gr='go run'
alias rustdir='cd $projects/Rust'
alias godir='cd $projects/Go'
alias rubydir='cd $projects/Ruby'
alias pythondir='cd $projects/Python'
alias javascriptdir='cd $projects/Javascript'
alias typescriptdir='cd $projects/Typescript'
alias cdir='cd $projects/C'

# Go
export GOPATH=$HOME/go

# Paths
export PATH='/Users/$user/go/bin:$PATH'
export PATH='/Library/Frameworks/Python.framework/Versions/3.8/bin:$PATH'
export PATH='/Users/$user/dotfiles/bin:$PATH'

# Boot tmux if tmux is exists
if command -v tmux &>/dev/null &&
    [ -n '$PS1' ] &&
    [[ ! '$TERM' =~ screen ]] &&
    [[ ! '$TERM' =~ tmux ]] &&
    [ -z '$TMUX' ]; then
    exec tmux
fi
" >>~/.zshrc
