export DOTFILES="$HOME/dotfiles"
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source $DOTFILES/zsh/env.zsh --source_only
source $DOTFILES/zsh/utils.zsh --source_only
source $DOTFILES/zsh/paths.zsh --source_only
source $DOTFILES/zsh/init.zsh --source_only
source $DOTFILES/zsh/aliases.zsh --source_only
source $DOTFILES/zsh/hooks.zsh --source_only
source $DOTFILES/zsh/key_bindings.zsh --source_only

# Machine specific keys to be ignored by git.
if [[ -f "$DOTFILES/zsh/keys.zsh" ]]; then
  source $DOTFILES/zsh/keys.zsh --source_only
fi

init
