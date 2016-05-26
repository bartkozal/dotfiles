export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export CODE="$HOME/Developer"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export FPATH="$FPATH:/usr/local/share/zsh-completions"
export FPATH="$FPATH:/usr/local/share/zsh/site-functions"
export FPATH="$FPATH:$HOME/.zsh/completions"
export RBENV_ROOT="$HOME/.rbenv"
export TERMINFO="$HOME/.terminfo"

typeset -U PATH FPATH

autoload -U compinit colors zmv add-zsh-hook
compinit && colors

unalias run-help
autoload run-help
export HELPDIR="/usr/local/share/zsh/helpfiles"

setopt auto_cd
setopt auto_list
setopt complete_in_word
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt ignore_eof
setopt inc_append_history
setopt menu_complete
setopt prompt_subst
setopt share_history

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

alias vim='nvim'
alias ls='ls -GA'
alias ll='ls -GAlh'
alias cp='cp -R'
alias rm='rm -R'
alias grep='grep --color'
alias less='less -FXR'
alias q='exit'
alias c='clear'
alias be='bundle exec'
alias s='ruby -run -e httpd . -p3000'

function d {
  cd "$CODE/$1"
}

function e {
  $(git rev-parse --show-toplevel)/.exec $1
}

source "$HOME/.zsh/git.zsh"
source "$HOME/.zsh/terminal.zsh"

export PROMPT='%F{4}./%.%f$(git_prompt) '
export RPROMPT='$(git_stash)'
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=2048
export SAVEHIST=2048
export HISTCONTROL="ignoreboth"
export REPORTTIME=10
export ARCHFLAGS='-arch x86_64'
export EDITOR='nvim'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(rbenv init -)"
eval "$(nodenv init -)"
