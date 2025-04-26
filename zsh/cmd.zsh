cursor_vis() {
  echo "\x1b[?25h"
}

ibeam_cursor() {
  printf '\033[6 q'
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

gs-files() {
  local working_files=()
  for file in $(git status --porcelain); do
    if [[ ! -f  "$file" ]]; then
      continue;
    fi

    if [[ -n "$1" && "$file" =~ "${1}$" ]]; then
      working_files+="$file"
    elif [[ -z "$1" ]]; then
      working_files+="$file"
    fi
  done
  echo "$working_files"
}

ez-encrypt() {
  if [ ! -x $(which gpg) ]; then
    echo "gpg not installed"
    return
  fi
  gpg --symmetric --cipher-algo AES256 "$1"
}

ez-decrypt() {
  if [ ! -x $(which gpg) ]; then
    echo "gpg not installed"
    return
  fi
  gpg --output "$2" --decrypt "$1" 
}

now() {
  if [[ -n "${@}" ]]; then
    date -v ${@} -u +%Y-%m-%dT%H:%M:%SZ
  else
    date -u +%Y-%m-%dT%H:%M:%SZ
  fi
}
