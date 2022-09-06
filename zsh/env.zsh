export BOOKMARKS="$HOME/.cache/bookmarks"
export TODOS="$HOME/.cache/todos"
export CURSOR_TYPE="ibeam"

export PACKPATH="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

# FZF 
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--bind ctrl-n:down,ctrl-p:up'

left="%{\e[34m%}\U250C\U2500%{\e[0m%}"
cwd="%{\e[1;38;2;78;201;176m%}%c%{\e[0m%}"
bottom="\n%{\e[34m%}\U2514%{\e[0m%} %{\e[1;31m%}\U1F9CB%{\e[0m%}"

# Prompt
export PS1=$'$(print $left) $(print $cwd)$(git_info) $(print $bottom) '
