export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR='code -w'
export FZF_DEFAULT_COMMAND='ag -g ""'
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
export DISPLAY=(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

alias ls='exa --all --grid --across'
alias ll='exa --all --long --git'
alias tree='exa --tree'
alias cat='bat'
alias cp='cp -R'
alias rm='rm -R'
alias grep='grep --color'
alias less='less -FXR'
alias q='exit'
alias c='clear'
alias gs='git status -sb'
alias gst='git stash'
alias gstp='git stash pop'
alias gpl='git pull --rebase'
alias gps='git push'
alias gdf='git diff'
alias glo='git log --decorate --oneline -n 15'

set -U fish_user_paths /usr/local/bin
set -U fish_greeting

set -U fish_color_autosuggestion 595959
set -U fish_color_cancel f5bb3d
set -U fish_color_command green
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
set -U fish_color_param white
set -U fish_color_quote green
set -U fish_color_redirection cyan
set -U fish_color_search_match green
set -U fish_color_selection normal
set -U fish_color_user normal
set -U fish_color_valid_path normal
set -U fish_pager_color_description bbb
set -U fish_pager_color_prefix green
set -U fish_pager_color_progress 595959

status --is-interactive; and source (nodenv init -|psub)
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source
