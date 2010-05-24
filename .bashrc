# Load bash completion scripts

files_to_load=(
'/usr/local/etc/bash_completion.d/git-completion.bash'
'/usr/local/Library/Contributions/brew_bash_completion.sh'
)

for (( i = 0; i < ${#files_to_load[@]}; i++ )); do
	source ${files_to_load[${i}]}
done

# Set PS1

export PS1='\[\033[0m\]\$\u: \[\033[32m\]\w\[\033[0m\] '

# Set text editor

if [[ `which mate` ]]; then
	export EDITOR='mate -w'
else
	export EDITOR='vim'
fi

# Load aliases

if [[ -f ~/.bash_aliases ]]; then
	source ~/.bash_aliases
fi