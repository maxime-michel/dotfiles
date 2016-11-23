# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
HISTIGNORE="youtube-dl*"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

source ~/.git-completion.bash
source ~/.fzf.bash
source ~/.git-prompt.sh
source ~/.git.sh
source ~/.magnolia.sh

alias ag='ag --smart-case --pager="less -MIRFX"'
alias dk='cd ~/Desktop'
alias kill='kill -9'

export EDITOR=vim
export CLICOLOR=true
export CLICOLOR_FORCE=true

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
  --exact
  --color bg:255,pointer:255
  --color info:247,spinner:247
  --color fg:238,fg+:238,marker:238
  --color hl+:67,bg+:153,prompt:30,hl:241
'

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf -1 +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# os x specifics
alias co='cd ~/Documents/Code/'
function ll() { ls -Alh $@ | grep -v .DS_Store | grep -v .localized; }
alias ls=ll
export FIGNORE="DS_Store:localized:$FIGNORE"
export HOMEBREW_NO_ANALYTICS=1
