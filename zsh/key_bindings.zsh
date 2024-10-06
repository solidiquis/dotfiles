light_mode() {
  if [ -z $LIGHT_MODE ]; then
    export LIGHT_MODE=1
    echo "Light mode"
  else
    export LIGHT_MODE=
    echo "Dark mode"
  fi
  zle accept-line
}
zle -N light_mode
bindkey '^H' light_mode

bindkey -s "^f" 'fg^M'
