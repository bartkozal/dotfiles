source ~/Projects/dotfiles/sh/colors
source ~/Projects/dotfiles/sh/aliases

autoload -U compinit
compinit

setopt auto_cd
setopt correctall
setopt prompt_subst
setopt histignoredups

setopt auto_list
setopt auto_menu
setopt menu_complete

zstyle ':completion:*:descriptions' format $(print "%{$cgre%}-- %d --%{$cwhi%}")
zstyle ':completion:*:warnings' format $(print "%{$cred%}-- no matches --%{$cwhi%}")

zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au $USER'

export PATH='/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin'
export PS1="$(print "%{$cgre%}[%~] %{$cwhi%}")"
export EDITOR='mate -w'
export HISTFILE="$HOME/.history"
export HISTSIZE=1000
export SAVEHIST=1000
