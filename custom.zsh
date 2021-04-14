fignore=(DS_Store localized)

export PATH="/opt/homebrew/bin:$PATH"
export HOMEBREW_NO_ANALYTICS=1

export FZF_DEFAULT_OPTS='
  --exact
  --color bg:255,pointer:255
  --color info:247,spinner:247
  --color fg:238,fg+:238,marker:238
  --color hl+:67,bg+:153,prompt:30,hl:241
'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias dk='cd ~/Desktop'

function qute_clean() {
  # runtime folder is taken care of by a reboot

  cd ~/Library/
  rm -rf "Preferences/qutebrowser"
  rm -rf "Caches/qutebrowser"

  cd "Application Support/"
  mv qutebrowser/blocked-hosts /tmp
  rm -rf qutebrowser
  mkdir qutebrowser
  mv /tmp/blocked-hosts qutebrowser/
}
