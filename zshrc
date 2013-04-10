source $HOME/.zsh/aliases.zsh

export MY_CODE="$HOME/Developer"
export PATH="$HOME/.winnie-dev:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/local/share/python:$PATH"
export FPATH="$FPATH:$HOME/.zsh/completions"
export NODE_PATH="/usr/local/lib/node_module:$NODE_PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

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

export PROMPT=$'%F{blue}%~/%f%F{cyan}$(git_prompt)%f '
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1024
export SAVEHIST=1024
export REPORTTIME=10
export ARCHFLAGS='-arch x86_64'
export EDITOR='vim'

export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_FREE_MIN=500000
export RUBY_HEAP_MIN_SLOTS=40000

function precmd  { print -Pn "\e]2; %~/ \a" }
function preexec { print -Pn "\e]2; %~/ \a" }

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

source "$HOME/.zsh/vendor/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
eval "$(rbenv init -)"

