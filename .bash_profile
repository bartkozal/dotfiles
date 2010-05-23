if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	source /usr/local/etc/bash_completion.d/git-completion.bash
fi

if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi