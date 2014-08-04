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
  cd "$CODE/$1"; vim .
}

function v {
  if [[ $# > 0 ]]; then
    vim $@
  else
    vim .
  fi
}

function tm {
  if [[ $# > 0 ]]; then
    if [ -z "$TMUX" ]; then
      tmux new-session -As $1
    else
      if [ tmux has-session $1 ]; then
        tmux switch-client -t $1
      else
        TMUX= tmux new-session -ds $1
        tmux switch-client -t $1
      fi
    fi
  else
    tmux list-sessions
  fi
}

function tmr {
  tmux rename-session $1
}
