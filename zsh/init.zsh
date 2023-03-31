# Initial tasks to run on window boot up.
init() {
  enable_bash_rematch
  setopt BASH_REMATCH
  [[ $CURSOR_TYPE == "ibeam" ]] && i_beam_cursor
}

# Boot tmux if tmux exists and is not running.
exec_tmux() {
  which tmux &> /dev/null && \
    [ -n "$PS1" ] && \
    [[ ! "$TERM" =~ screen ]] && \
    [[ ! "$TERM" =~ tmux ]] && \
    [ -z "$TMUX" ] && \
    exec tmux
}

vi_mode() {
  set -o vi
}

i_beam_cursor() {
  printf '\033[6 q'
}

print_todos() {
  [[ -f $TODOS ]] && cat $TODOS
}

enable_bash_rematch() {
  setopt BASH_REMATCH
}
