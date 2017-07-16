function gbrm
  git push origin :$argv
  git branch -D $argv
end
