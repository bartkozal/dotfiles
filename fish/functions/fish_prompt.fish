function fish_prompt
    set_color fc1da7 --bold
    echo -n (basename $PWD) ''
    set_color f5bb3d --bold
    echo -n (git symbolic-ref --short HEAD 2>/dev/null) ''
    set_color 59ff1a --bold
    echo -n '$ '
end
