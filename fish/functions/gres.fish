function gres
  while true
    read -p 'echo "Remove local changes? (y/N): "' -l confirm

    switch $confirm
      case Y y 1
        git checkout -f HEAD
        git clean -df
        return
      case '*'
        return
    end
  end
end
