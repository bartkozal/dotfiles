function gaa
  git add --all
  if count $argv > /dev/null
    git commit -m $argv
  end
end
