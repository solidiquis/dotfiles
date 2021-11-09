export DOTFILES="$HOME/dotfiles"
export ZSH_DISABLE_COMPFIX="true"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source $DOTFILES/zsh/init_tasks --source_only
source $DOTFILES/zsh/bookmarking --source_only
source $DOTFILES/zsh/utils --source_only
source $DOTFILES/zsh/aliases --source_only
source $DOTFILES/zsh/paths --source_only
source $DOTFILES/zsh/mode --source_only

run_init_tasks

# FZF 
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS='--bind ctrl-n:down,ctrl-p:up'

# Prompt
export PS1=$'%{\x1b[34m%}\U250C\U2500%{\x1b[0m%} %{\x1b[33m%}%c%{\x1b[0m%} $(git_prompt_info) \n%{\x1b[34m%}\U2514%{\x1b[0m%} %{\x1b[1;31m%}\U1F9CB%{\x1b[0m%} '
