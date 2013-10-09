alias b='bundle'
alias be='bundle exec'

alias s="ruby -run -e httpd . -p3000"

alias t='tmux'
alias tk='tmux kill-server'

alias ls='ls -GA'
alias ll='ls -GAlh'
alias cp='cp -R'
alias rm='rm -R'
alias grep='grep --color'
alias q='exit'
alias :q='exit'
alias c='clear'

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
