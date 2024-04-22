export DOTFILES="$HOME/dotfiles"
export ZSH="$HOME/.oh-my-zsh"

source $DOTFILES/zsh/vars.zsh --source_only
source $ZSH/oh-my-zsh.sh
source $DOTFILES/zsh/cmd.zsh --source_only
source $DOTFILES/zsh/aliases.zsh --source_only
source $DOTFILES/zsh/key_bindings.zsh --source_only
source $DOTFILES/zsh/prompt.zsh --source_only
source $DOTFILES/zsh/hooks.zsh --source_only

setopt extended_glob
setopt BASH_REMATCH

if [[ -d "$DOTFILES/.git" && -z $(grep "custom\.zsh" "$DOTFILES/.git/info/exclude") ]]; then
  echo "zsh/custom.zsh" >> $DOTFILES/.git/info/exclude
fi

if [[ $CURSOR_TYPE == "ibeam" ]]; then
  ibeam_cursor
fi 

# Custom settings per machine.
if [[ -f "$DOTFILES/zsh/custom.zsh" ]]; then
  source $DOTFILES/zsh/custom.zsh --source_only
fi
