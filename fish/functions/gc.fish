function gc
  if count $argv > /dev/null
    git commit -m $argv
  else
    git commit -v
  end
end
