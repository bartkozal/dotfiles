export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export CODE="$HOME/code"
export PATH="$HOME/.winnie-dev:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export FPATH="$FPATH:/usr/local/share/zsh-completions"
export FPATH="$FPATH:/usr/local/share/zsh/site-functions"
export FPATH="$FPATH:$HOME/.zsh/completions"
export RBENV_ROOT="$HOME/.rbenv"

typeset -U PATH FPATH

autoload -U compinit colors zmv
compinit && colors

unalias run-help
autoload run-help
export HELPDIR="/usr/local/share/zsh/helpfiles"

setopt PROMPT_SUBST
setopt AUTO_LIST
setopt MENU_COMPLETE
setopt COMPLETE_IN_WORD
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

alias ls='ls -GA'
alias ll='ls -GAlh'
alias cp='cp -R'
alias rm='rm -R'
alias grep='grep --color'
alias less='less -FXR'
alias q='exit'
alias :q='exit'
alias c='clear'
alias b='bundle'
alias be='bundle exec'
alias s='ruby -run -e httpd . -p3000'

function d {
  cd "$CODE/$1"
}

source "$HOME/.zsh/git.zsh"

export PROMPT='%F{4}%~%f$(git_prompt) '
export RPROMPT='$(git_rprompt)'
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=2048
export SAVEHIST=2048
export HISTCONTROL="ignoreboth"
export REPORTTIME=10
export ARCHFLAGS='-arch x86_64'
export EDITOR='vim'
export DEIS_PROFILE='staging'

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

eval "$(rbenv init -)"
eval "$(nodenv init -)"
