export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source "$HOME/.zsh/functions/shell.zsh"
source "$HOME/.zsh/functions/git.zsh"
source "$HOME/.zsh/functions/ruby.zsh"

export CODE="$HOME/Developer"

export PATH="$HOME/.winnie-dev:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/share/python:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_module:$NODE_PATH"
export FPATH="$FPATH:$HOME/.zsh/completions"

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

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

source "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
eval "$(rbenv init -)"

