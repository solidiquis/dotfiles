export BOOKMARKS="$HOME/.cache/bookmarks"
export TODOS="$HOME/.cache/todos"
export CURSOR_TYPE="ibeam"

export PACKPATH="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

# FZF 
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--bind ctrl-n:down,ctrl-p:up'

# Prompt
export PS1=$'%{\x1b[34m%}\U250C\U2500%{\x1b[0m%} %{\x1b[1;38;2;227;135;255m%}%c%{\x1b[0m%}$(git_info) \n%{\x1b[34m%}\U2514%{\x1b[0m%} %{\x1b[1;31m%}\U1F9CB%{\x1b[0m%} '
