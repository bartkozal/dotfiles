function git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo '~'
}

function git_prompt {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ' '${ref#refs/heads/}''$(git_dirty)
}

alias gb='git branch -av'
alias gs='git status -sb'
alias gco='git checkout'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gcl='git clone'
alias gpl='git pull --rebase'
alias gps='git push'
alias gdf='git diff'
alias gdfc='git diff --cached'
alias gdfl='git diff HEAD~1'
alias glo='git log --decorate --oneline -n 15'

function g {
  if [[ $# > 0 ]]; then
    git $@
  else
    gs
  fi
}

function gc {
  if [[ $# > 0 ]]; then
    git commit -m $1
  else
    git commit -v
  fi
}

function gaa {
  git add --all
  if [[ $# > 0 ]]; then
    git commit -m $1
  fi
}

function gca {
  if [[ $# > 0 ]]; then
    git commit --amend -m $1
  else
    git commit --amend -C HEAD
  fi
}

function gba {
  git checkout -b $1
  git push origin $1
  git branch --set-upstream-to $1 origin/$1
}

function gbmv {
  git branch -m $1 $2
  git push origin :$1
  git push origin $2
  git branch --set-upstream-to $2 origin/$2
}

function gbrm {
  git push origin :$1
  git branch -D $1
}

function gbt {
  git checkout -t $1
}

function gbfu {
  git remote add upstream $1
  git fetch upstream
}

function gres {
  echo "Remove all local changes?"
  select REPLY in "Yes" "No"; do
    case $REPLY in
      Yes ) git checkout -f HEAD && git clean -df; break;;
      No ) break;;
    esac
  done
}
