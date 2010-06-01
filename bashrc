source '/usr/local/etc/bash_completion.d/git-completion.bash'
source '/usr/local/Library/Contributions/brew_bash_completion.sh'
source ~/Projects/dotfiles/sh/colors
source ~/Projects/dotfiles/sh/aliases

export PATH='/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin'
export CDPATH='.:~:~/Desktop/:~/Projects:~/Projects/studies:~/Projects/dotfiles:~/Sites'
export PS1="\[$cgre\][\w]\[$cyel\]\$(\__git_ps1) \[$cwhi\]"
export EDITOR='mate -w'