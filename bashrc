# Autocomple
source '/usr/local/etc/bash_completion.d/git-completion.bash'
source '/usr/local/Library/Contributions/brew_bash_completion.sh'

# Aliases
source ~/Projects/dotfiles/aliases

# Env variables
export CDPATH='.:~:~/Desktop/:~/Projects:~/Sites'
export PS1="\[$cgre\][\w]\[$cyel\]\$(\__git_ps1) \[$cwhi\]"
export EDITOR='mate -w'