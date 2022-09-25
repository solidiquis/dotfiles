export DOTFILES="$HOME/dotfiles"

source $DOTFILES/zsh/env.zsh --source_only
source $DOTFILES/zsh/utils.zsh --source_only
source $DOTFILES/zsh/paths.zsh --source_only
source $DOTFILES/zsh/init.zsh --source_only
source $DOTFILES/zsh/aliases.zsh --source_only
source $DOTFILES/zsh/hooks.zsh --source_only
source $DOTFILES/zsh/key_bindings.zsh --source_only

init
