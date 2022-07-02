locipdev() {
  [[ "$OSTYPE" =~ "darwin" ]] && ipconfig getifaddr en0 && return
  hostname -I
}

btdevices() {
  [[ "$OSTYPE" =~ "darwin" ]] && system_profiler SPBluetoothDataType
}

cursor_vis() {
  echo "\x1b[?25h"
}

testface() {
  echo "hah"
}

kk() {
  printf "\e[2J\e[H"
}

s() {
  source $HOME/.zshrc
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
  if [[ -z $BOOKMARKS ]]; then
    BOOKMARKS="$HOME/.cache/bookmarks"
  fi

  if [[ ! -f $BOOKMARKS ]]; then
    touch $BOOKMARKS
  fi

  case $1 in

    -l)
      cat $BOOKMARKS
      ;;

    -c)
      bookmark="${2}=$(pwd)"
      echo $bookmark >> $BOOKMARKS
      echo $bookmark
      ;;

    -d)
      pat="/^$2=.*/d"
      sed -i "" $pat $BOOKMARKS
      cat $BOOKMARKS
      ;;

    -w)
      cat $BOOKMARKS
      echo "" > $BOOKMARKS
      ;;

    *)
      [[ $SHELL == "/bin/zsh" ]] && setopt local_options BASH_REMATCH
      bookmarks=$(cat $BOOKMARKS)

      if [[ $bookmarks =~ ($1=[[:print:]]*) ]]; then
        [[ ${BASH_REMATCH[1]} =~ (=[[:print:]]*) ]] && cd ${BASH_REMATCH[1]:1}
      fi
      ;;
  esac
}

load_nvm() {
  if [ -d "$NVM_DIR" ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  fi
}

git_info() {
  # Will not work unless setopt BASH_REMATCH.

  project_root=$(git rev-parse --show-toplevel 2> /dev/null)
  
  if [[ -z $project_root ]]; then
    return
  fi

  current_branch=$(git branch --show-current) 

  git diff-index --quiet HEAD -- 2> /dev/null || uncommitted_changes=true

  styled_branch_name="::\e[1;38;2;255;213;135m$current_branch\e[0m"

  if [[ ! $uncommitted_changes ]]; then 
    printf $styled_branch_name 
    return
  fi

  stats=$(git diff --stat)

  if [[ -z $stats ]]; then
    printf $styled_branch_name
    return
  fi

  [[ $stats =~ "[[:digit:]]+ insertion" ]] && insertions=${BASH_REMATCH[1]/ insertion/""}
  [[ $stats =~ "[[:digit:]]+ deletion" ]] && deletions=${BASH_REMATCH[1]/ deletion/""}

  if [[ ! -z $insertions && ! -z $deletions ]]; then
    printf "$styled_branch_name::<\e[1;32m+\e[0m$insertions\e[36m|\e[0m\e[1;31m-\e[0m$deletions>"
  elif [[ ! -z $insertions && -z $deletions ]]; then
    printf "$styled_branch_name::<\e[1;32m+\e[0m$insertions>"
  elif [[ -z $insertions && ! -z $deletions ]]; then
    printf "$styled_branch_name::<\e[1;31m-\e[0m$deletions>"
  else
    printf "$styled_branch_name::<\e[1;32m+\e[0m$insertions\e[36m|\e[0m\e[1;31m-\e[0m$deletions>"
  fi
}
