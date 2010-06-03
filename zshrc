# Aliases
source ~/Projects/dotfiles/aliases

# Reload zshrc
alias reload='source ~/.zshrc'

# Completion
autoload -U compinit colors && compinit && colors

# Set options - http://zsh.sourceforge.net/Doc/Release/Options.html
setopt AUTO_CD
setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE
setopt CORRECT_ALL
setopt HIST_IGNORE_ALL_DUPS

# Completion style
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format %F{green}-- %d --%f
zstyle ':completion:*:messages' format %F{green}-- %d --%f
zstyle ':completion:*:warnings' format %F{red}-- no matches --%f

# Env variables
PATH='/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin'
PS1="%F{green}[%~]%f "
EDITOR='mate -w'

# Save history to file
HISTFILE="$HOME/.history"
HISTSIZE=1000
SAVEHIST=1000

# Time report
REPORTTIME=10
