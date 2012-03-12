source $HOME/.aliases

export MY_CODE="$HOME/Developer"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export FPATH="$FPATH:$HOME/.zsh"
export NODE_PATH="/usr/local/lib/node_module:$NODE_PATH"

autoload -U compinit colors
compinit && colors

setopt PROMPT_SUBST
setopt AUTO_LIST
setopt MENU_COMPLETE
setopt COMPLETE_IN_WORD
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

function git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo '~'
}

function git_prompt {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ' '${ref#refs/heads/}''$(git_dirty)
}

function ruby_version {
  rbenv version | cut -d ' ' -f 1
}

export PROMPT=$'%F{blue}%~/%f%F{cyan}$(git_prompt)%f '
export RPROMPT=$'%F{red}$(ruby_version)%f'
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1024
export SAVEHIST=1024
export REPORTTIME=10
export ARCHFLAGS='-arch x86_64'
export EDITOR='vim'

function precmd  { print -Pn "\e]2; %~/ \a" }
function preexec { print -Pn "\e]2; %~/ \a" }

eval "$(rbenv init -)"
