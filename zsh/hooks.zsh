precmd() {
  if [[ $CURSOR_TYPE == "ibeam" ]]; then
    ibeam_cursor
  fi 
}
