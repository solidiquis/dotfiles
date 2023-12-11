cursor_vis() {
  echo "\x1b[?25h"
}

kk() {
  printf "\e[2J\e[H"
}

s() {
  if [[ "$SHELL" =~ "zsh" ]]; then
    source $HOME/.zshrc
  elif [[ "$SHELL" =~ "bash" ]]; then
    source $HOME/.bash_profile
  fi
}

h() {
  history | grep $1
}

16col() {
  for i in {30..37}; do
    printf "$i \u2B62  \e[${i}m\u25C6\e[0m\n"
  done
}

256col() {
  for i in {0..255}; do
    printf "\e[1;38;5;${i}m${i}\e[0m "
  done
  
  printf "\n"
}

j() {
  local bookmarks="$HOME/.bookmarks"

  if [[ ! -f "$bookmarks" ]]; then
    touch "$bookmarks"
  fi

  if [[ "$*" =~ "(-h|--help)" ]]; then
    read -r -d "" usage << EOT
USAGE:
  j [ARGUMENT] [OPTIONS]

ARGUMENT:
  Name of book mark to cd into.

OPTIONS:
  -h, --help          Display usage text.
  -l                  Display all bookmarks.
  -d <bookmark>       Bookmark to delete.
  -c <bookmark>       Bookmark to create.
EOT

    echo "$usage"
    return
  fi

  case $1 in
    "-l")
      cat "$bookmarks"
      ;;

    "-c")
      if [[ -z "$2" ]]; then
        echo "Missing argument for -c" 
        return
      fi
      
      local bookmark="${2}=$(pwd)"
      if [[ -z $(grep "$bookmark" "$bookmarks") ]]; then
        echo $bookmark >> $bookmarks
        echo $bookmark
      else
        echo "Bookmark '$bookmark' already exists."
      fi
      ;;

    "-d")
      local pat="/^$2=.*/d"
      sed -i "" "$pat" "$bookmarks"
      cat "$bookmarks"
      ;;

    *)
      local target=$(grep "$1=" "$HOME/.bookmarks")
      local result=${target/$1=/}
      cd "$result"
      ;;
  esac
}

load_nvm() {
  if [ -d "$NVM_DIR" ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  fi
}

git_prune_branches() {
  printf "Confirm that you wish to delete all branches except for main/master: [y/n]\n"
  read confirm

  if [[ "$confirm" != "y" ]]; then
    echo "Aborted."
    return
  fi

  for i in $(git branch); do
    if [[ "$i" != "master" && "$i" != "main" && ! "$i" =~ "\*.*" ]]; then
      git branch -D "$i"
    fi
  done

  printf "Done.\n"
}

git_info() {
  # Will not work unless setopt BASH_REMATCH.

  local project_root=$(git rev-parse --show-toplevel 2> /dev/null)
  
  if [[ -z $project_root ]]; then
    return
  fi

  local current_branch=$(git branch --show-current) 

  git diff-index --quiet HEAD -- 2> /dev/null || uncommitted_changes=true

  local styled_branch_name="::\e[1;33m$current_branch\e[0m"

  if [[ ! $uncommitted_changes ]]; then 
    printf $styled_branch_name 
    return
  fi

  local stats=$(git diff --stat)

  if [[ -z $stats ]]; then
    printf $styled_branch_name
    return
  fi

  [[ $stats =~ "[[:digit:]]+ insertion" ]] && insertions=${BASH_REMATCH[1]/ insertion/""}
  [[ $stats =~ "[[:digit:]]+ deletion" ]] && deletions=${BASH_REMATCH[1]/ deletion/""}

  if [[ ! -z $insertions && ! -z $deletions ]]; then
    printf "$styled_branch_name::<\e[1;32m+\e[0m$insertions|\e[1;31m-\e[0m$deletions>"
  elif [[ ! -z $insertions && -z $deletions ]]; then
    printf "$styled_branch_name::<\e[1;32m+\e[0m$insertions>"
  elif [[ -z $insertions && ! -z $deletions ]]; then
    printf "$styled_branch_name::<\e[1;32m-\e[0m$deletions>"
  else
    printf "$styled_branch_name::<\e[1;32m\e[0m$insertions|\e[1;31m-\e[0m$deletions>"
  fi
}
