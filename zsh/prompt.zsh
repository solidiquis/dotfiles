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

left="%{\e[1;32m%}\U250C\U2500%{\e[0m%}"
cwd="%{\e[1;35m%}%c%{\e[0m%}"
bottom="\n%{\e[1;32m%}\U2514%{\e[0m%} %{\e[1;32m%}\U1F9CB%{\e[0m%}"

# Prompt
export PS1=$'$(print $left) $(print $cwd)$(git_info) $(print $bottom) '
