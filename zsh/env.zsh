export CURSOR_TYPE="ibeam"

export PACKPATH="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

# FZF 
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

left="%{\e[31m%}\U250C\U2500%{\e[0m%}"
cwd="%{\e[1;38;5;99m%}%c%{\e[0m%}"
bottom="\n%{\e[31m%}\U2514%{\e[0m%} %{\e[1;31m%}\U1F9CB%{\e[0m%}"

# Prompt
export PS1=$'$(print $left) $(print $cwd)$(git_info) $(print $bottom) '
