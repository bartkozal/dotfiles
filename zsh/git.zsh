function git_branch {
  git status -sb 2> /dev/null | head -n 1 | awk -F '[ ]|[...]' '{print "\ " $2}'
}

function git_dirty {
  [[ $(git status -sb 2> /dev/null | wc -l) -gt 1 ]] && echo '~'
}

function git_prompt {
  echo "$(git_branch)$(git_dirty)"
}

alias git='hub'
alias g='git'
alias gh='github .'

alias gb='git branch -av'
alias gs='git status -sb'
alias gco='git checkout'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gpl='git pull --rebase'
alias gps='git push'
alias gpst='git push --tags'
alias gdf='git diff'
alias gdfc='git diff --cached'
alias gdfl='git diff HEAD~1'
alias glo='git log --decorate --oneline -n 15'

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
    git commit --amend
  fi
}

function gba {
  git checkout -b $1
  git push origin $1
  git branch --set-upstream-to origin/$1 $1
}

function gbmv {
  git branch -m $1 $2
  git push origin :$1
  git push origin $2
  git branch --set-upstream-to origin/$2 $2
}

function gbrm {
  git push origin :$1
  git branch -D $1
}

function gbt {
  git checkout -t $1
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

function gprune {
  git fetch -p
  git branch --merged master | grep -v 'master$' | xargs git branch -d
}
