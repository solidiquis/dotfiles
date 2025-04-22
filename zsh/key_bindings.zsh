light_mode() {
  if [ -z $LIGHT_MODE ]; then
    printf "export LIGHT_MODE=1" > $DOTFILES/zsh/light_mode.zsh
    export LIGHT_MODE=1
    echo "Light mode"
  else
    printf "export LIGHT_MODE=" > $DOTFILES/zsh/light_mode.zsh
    export LIGHT_MODE=
    echo "Dark mode"
  fi
  zle accept-line
  s
}
zle -N light_mode
bindkey '^H' light_mode

bindkey -s "^f" 'fg^M'
