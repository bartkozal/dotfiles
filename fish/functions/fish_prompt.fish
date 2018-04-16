function fish_prompt
    set_color blue --bold
    echo -n (basename $PWD) ''
    set_color yellow --bold
    echo -n (git symbolic-ref --short HEAD 2>/dev/null) ''
    set_color green --bold
    echo -n '$ '
end
