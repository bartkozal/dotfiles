# Autocomple
source '/usr/local/etc/bash_completion.d/git-completion.bash'
source '/usr/local/Library/Contributions/brew_bash_completion.sh'

# Variables to colors
cbla='\e[0;30m' # Black
cred='\e[0;31m' # Red
cgre='\e[0;32m' # Green
cyel='\e[0;33m' # Yellow
cblu='\e[0;34m' # Blue
cpur='\e[0;35m' # Purple
ccya='\e[0;36m' # Cyan
cwhi='\e[0;37m' # White

# Aliases
source ~/Projects/dotfiles/aliases

# Reload bashrc
alias reload='source ~/.bashrc'

# Env variables
export PATH='/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin'
export CDPATH='.:~:~/Desktop/:~/Projects:~/Sites'
export PS1="\[$cgre\][\w]\[$cyel\]\$(\__git_ps1) \[$cwhi\]"
export EDITOR='mate -w'