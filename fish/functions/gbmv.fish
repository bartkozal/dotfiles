function gbmv
  git branch -m $argv[1] $argv[2]
  git push origin :$argv[1]
  git push origin $argv[2]
  git branch --set-upstream-to origin/$argv[1] $argv[2]
end
