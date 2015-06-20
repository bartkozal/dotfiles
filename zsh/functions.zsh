alias ls='ls -GA'
alias ll='ls -GAlh'
alias cp='cp -R'
alias rm='rm -R'
alias grep='grep --color'
alias less='less -FXR'
alias q='exit'
alias :q='exit'
alias c='clear'
alias be='bundle exec'
alias s='ruby -run -e httpd . -p3000'


function d {
  cd "$CODE/$1"
}

function v {
  if [[ $# > 0 ]]; then
    mvim $@
  else
    mvim
  fi
}
