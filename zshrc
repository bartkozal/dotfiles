# Aliases
source $HOME/Projects/dotfiles/aliases

# Completion and colors
autoload -U compinit colors && compinit && colors

# Set options - http://zsh.sourceforge.net/Doc/Release/Options.html
setopt AUTO_CD
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE
setopt COMPLETE_IN_WORD
setopt CORRECT_ALL
setopt HIST_IGNORE_ALL_DUPS
setopt EXTENDED_HISTORY

# Completion style
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:descriptions' format %F{green}-- %d --%f
zstyle ':completion:*:messages' format %F{green}-- %d --%f
zstyle ':completion:*:warnings' format %F{red}-- no matches --%f

# Env variables
PATH="$PATH:/usr/local/sbin"

PS1="%F{green}[%~]%f "
EDITOR='mate -w'

# Save history to file
HISTFILE="$HOME/.history"
HISTSIZE=1000
SAVEHIST=1000

# Time report
REPORTTIME=10

# Ruby version manager
source $HOME/.rvm/scripts/rvm