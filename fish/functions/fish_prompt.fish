function fish_prompt
    set_color fc1da7
    echo -n (basename $PWD) ''
    set_color f5bb3d
    echo -n (git symbolic-ref --short HEAD 2>/dev/null) ''
    set_color 59ff1a
    echo -n '$ '
end
