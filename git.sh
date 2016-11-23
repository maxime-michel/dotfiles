alias root='cd $(git rev-parse --show-toplevel)'

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_HIDE_IF_PWD_IGNORED=true
export PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

# fbr - checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# Usage: getPR 2
getPR() {
  git checkout master
  git branch -D "$1"
  git fetch origin refs/pull-requests/"$1"/from:"$1"
  git checkout "$1"
}
