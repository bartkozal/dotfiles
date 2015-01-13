alias b='bundle'
alias be='bundle exec'

alias s="ruby -run -e httpd . -p3000"

alias ls='ls -GA'
alias ll='ls -GAlh'
alias cp='cp -R'
alias rm='rm -R'
alias grep='grep --color'
alias less='less -FXR'
alias q='exit'
alias :q='exit'
alias c='clear'

function d {
  cd "$CODE/$1"
}

function dv {
  cd "$CODE/$1"; mvim
}

function v {
  if [[ $# > 0 ]]; then
    mvim $@
  else
    mvim
  fi
}

function tm {
  if [[ $# > 0 ]]; then
    if tmux has-session -t $1 &> /dev/null; then
      tmux switch-client -t $1
    else
      TMUX= tmux new-session -ds $1
      tmux switch-client -t $1
    fi
  else
    tmux list-sessions
  fi
}

function tmr {
  tmux rename-session $1
}
