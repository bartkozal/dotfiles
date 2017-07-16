export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export CODE="$HOME/Developer"
export RBENV_ROOT="$HOME/.rbenv"
export ARCHFLAGS='-arch x86_64'
export EDITOR='code -w'
export FZF_DEFAULT_COMMAND='ag -g ""'

alias ls='ls -GA'
alias ll='ls -GAlh'
alias cp='cp -R'
alias rm='rm -R'
alias grep='grep --color'
alias less='less -FXR'
alias q='exit'
alias c='clear'
alias b='bundle'
alias be='bundle exec'
alias git='hub'
alias gb='git branch -av'
alias gs='git status -sb'
alias gco='git checkout'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gpl='git pull --rebase'
alias gps='git push'
alias gdf='git diff'
alias gdfc='git diff --cached'
alias gdfl='git diff HEAD~1'
alias glo='git log --decorate --oneline -n 15'
alias gcl='git clone'

set -U fish_user_paths /usr/local/bin /usr/local/sbin
set -U fish_greeting

set -U fish_color_autosuggestion 595959
set -U fish_color_cancel f5bb3d
set -U fish_color_command normal
set -U fish_color_comment 282828
set -U fish_color_cwd normal
set -U fish_color_cwd_root normal
set -U fish_color_end cyan
set -U fish_color_error f5bb3d
set -U fish_color_escape cyan
set -U fish_color_history_current normal
set -U fish_color_host normal
set -U fish_color_match white
set -U fish_color_normal white
set -U fish_color_operator cyan
set -U fish_color_param normal
set -U fish_color_quote green
set -U fish_color_redirection cyan
set -U fish_color_search_match green
set -U fish_color_selection normal
set -U fish_color_user normal
set -U fish_color_valid_path blue
set -U fish_pager_color_description bbb
set -U fish_pager_color_prefix green
set -U fish_pager_color_progress 595959

status --is-interactive; and source (rbenv init -|psub)
status --is-interactive; and source (nodenv init -|psub)
