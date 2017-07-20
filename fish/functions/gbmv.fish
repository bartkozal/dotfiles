function gbmv
  git branch -m $argv[0] $argv[1]
  git push origin :$argv[0]
  git push origin $argv[1]
  git branch --set-upstream-to origin/$argv[0] $argv[1]
end
