function d {
  cd "$CODE/$1"
}

function dv {
  cd "$CODE/$1"; vim .
}

alias t='tmux'
alias v='vim'
alias v.='v .'
alias ..='cd ..'
alias l='ls'
alias ls='ls -GA'
alias ll='us -GAlh'
alias cp='cp -R'
alias rm='rm -R'
alias grep='grep --color'
alias h='man'
alias q='exit'
alias :q='q'

