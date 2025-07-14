precmd() {
  if [[ $CURSOR_TYPE == "ibeam" ]]; then
    ibeam_cursor
  fi 
}

preexec() {
  local orig_ifs="$IFS"
  local destructive_cmds=("git checkout ." "git clean -fd" "rm -rf")
  IFS=$'\n'

  for cmd in "${destructive_cmds[@]}"; do
    if [[ "$1" != "$cmd" ]]; then
      continue
    fi
    printf "Type 'confirm' to execute '$1': "
    read
    if [[ "$REPLY" != "confirm" ]]; then
      echo "Aborting command"
      exec zsh
    fi
  done
  IFS="$orig_ifs"
}
