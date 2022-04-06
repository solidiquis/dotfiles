export DOTFILES="$HOME/dotfiles"
export ZSH_DISABLE_COMPFIX="true"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source $DOTFILES/zsh/utils --source_only
source $DOTFILES/zsh/paths --source_only
source $DOTFILES/zsh/vars --source_only
source $DOTFILES/zsh/init --source_only
source $DOTFILES/zsh/aliases --source_only

init
