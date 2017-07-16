function gba
  git checkout -b $argv
  git push origin $argv
  git branch --set-upstream-to origin/$argv $argv
end
