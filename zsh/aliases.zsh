function d {
  cd "$MY_CODE/$1";
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

function gc {
  if [ "$1" != "" ]; then
    git commit -m $1
  else
    git commit -v
  fi
}

function gaa {
  git add --all
  if [ "$1" != "" ]; then
    git commit -m $1
  fi
}

function gca {
  if [ "$1" != "" ]; then
    git commit --amend -m $1
  else
    git commit --amend -C HEAD
  fi
}

function gba {
  git checkout -b $1
  git push origin $1
  git branch --set-upstream $1 origin/$1
}

function gbmv {
  git branch -m $1 $2
  git push origin :$1
  git push origin $2
  git branch --set-upstream $2 origin/$2
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
  echo "Are you sure to remove all your changes?"
  select REPLY in "Yes" "No"; do
    case $REPLY in
      Yes ) git checkout -f HEAD && git clean -df; break;;
      No ) break;;
    esac
  done
}

alias b='bundle'
alias be='bundle exec'
alias ..='cd ..'
alias ls='ls -GA'
alias ll='ls -GAlh'
alias cp='cp -R'
alias rm='rm -R'
alias grep='grep --color'

function gifify {
  ffmpeg -i $1 -pix_fmt rgb24 temp.gif
  convert -layers Optimize temp.gif $2
  rm temp.gif
}

function docrails {
  open "$MY_CODE/lifo/docrails/doc/rdoc/index.html"
}

