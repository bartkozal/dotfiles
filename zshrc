source $HOME/.aliases

MY_CODE="$HOME/Developer"
PATH="$PATH:/usr/local/sbin:/usr/local/share/npm/bin"
FPATH="$FPATH:$HOME/.zsh"

autoload -U compinit colors
compinit && colors

setopt PROMPT_SUBST
setopt AUTO_CD
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE
setopt COMPLETE_IN_WORD
setopt CORRECT_ALL
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:descriptions' format %F{green}-- %d --%f
zstyle ':completion:*:messages' format %F{green}-- %d --%f
zstyle ':completion:*:warnings' format %F{red}-- no matches --%f

function git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo '⚑'
}

function git_prompt {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo '['${ref#refs/heads/}']'$(git_dirty)
}

function ruby_version {
  echo '['$(rvm current)']'
}

function battery {
  max=`ioreg -rc AppleSmartBattery | grep "MaxCapacity" | awk '{ print $3 }'`
  current=`ioreg -rc AppleSmartBattery | grep "CurrentCapacity" | awk '{ print $3 }'`
  capacity=`echo "scale=2;$current/$max*100" | bc -l | cut -f 1 -d '.'`
  if [[ $capacity < 20 ]]; then
    echo "%F{magenta}[$capacity)%%]%f"
  elif [[ $capacity < 80 ]]; then
    echo "%F{cyan}[$capacity%%]%f"
  else
    echo "%F{green}[$capacity%%]%f"
  fi
}

ARCHFLAGS='-arch x86_64'
PROMPT=$'%F{green}[%~]%f%F{yellow}$(git_prompt)%f '
RPROMPT=$'%F{red}$(ruby_version)%f$(battery)'

HISTFILE="$HOME/.history"
HISTSIZE=1000
SAVEHIST=1000

REPORTTIME=10

export EDITOR='mate -w'

source $HOME/.rvm/scripts/rvm

ulimit -n 4096
