if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

if [ -f /usr/ports/etc/bash_completion ]; then
    . /usr/ports/etc/bash_completion
fi
