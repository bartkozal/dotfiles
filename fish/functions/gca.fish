function gca
  if count $argv > /dev/null
    git commit --amend -m $argv
  else
    git commit --amend
  end
end
