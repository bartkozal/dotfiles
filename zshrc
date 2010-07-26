# Aliases
source $HOME/Projects/dotfiles/aliases

# Completion and colors
autoload -U compinit colors && compinit && colors

# Set options - http://zsh.sourceforge.net/Doc/Release/Options.html
setopt PROMPT_SUBST
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

# Prompt functions
function git_dirty () {
	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo '⚑'
}

function git_prompt() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo '['${ref#refs/heads/}']'$(git_dirty)
}

function ruby_version() {
	echo '['$(ruby -v | cut -f 2 -d ' ')']'
}

# Env variables
PATH="$PATH:/usr/local/sbin"
ARCHFLAGS='-arch x86_64'
PROMPT=$'%F{green}[%~]%f%F{yellow}$(git_prompt)%f '
RPROMPT=$'%F{red}$(ruby_version)%f'
EDITOR='mate -w'

# Save history to file
HISTFILE="$HOME/.history"
HISTSIZE=1000
SAVEHIST=1000

# Time report
REPORTTIME=10

# Eucaliptus
source $HOME/.euca/eucarc

# Ruby version manager
source $HOME/.rvm/scripts/rvm