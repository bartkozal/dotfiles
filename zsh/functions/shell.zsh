function d {
  cd "$CODE/$1"
}

function dv {
  cd "$CODE/$1"; vim .
}

function v {
  if [[ $# > 0 ]]; then
    vim $@
  else
    vim .
  fi
}

function gif {
  ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | \
    gifsicle --optimize=3 --delay=3 > Screencast-`date +"%Y.%m.%d-%H.%M"`.gif
}

alias t='tmux'
alias tk='tmux kill-server'
alias st='teamocil --here'
alias ..='cd ..'
alias l='ls'
alias ls='ls -GA'
alias ll='ls -GAlh'
alias cp='cp -R'
alias rm='rm -R'
alias grep='grep --color'
alias h='man'
alias q='exit'
alias :q='q'
alias c='clear'

function notes {
  find ~/.vim/notes -d 1 -print0 | \
    xargs -0 -I {} zsh -c "tput setaf 2; echo {}; tput sgr0; cat {};"
}
