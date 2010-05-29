## Useful functions

# Recursive cleaning of .DS_Store files
alias clean="find . -depth -name '.DS_Store' -exec rm '{}' \; -print"

# iChat cleaning
function ichat () {
	if [ -d /Users/Bart/Library/Application\ Support/iChat/ ]; then
		rm -r /Users/Bart/Library/Application\ Support/iChat/
	fi
}

# Change state of AirPort proxy
function proxy () {
	if [ `networksetup -getwebproxy AirPort | head -n 1 | awk '{ print $2 }'` = 'Yes' ]; then
		sudo networksetup -setwebproxystate AirPort off
		echo "Proxy is turned off now"
	else
		sudo networksetup -setwebproxystate AirPort on
		echo "Proxy is turned on now"
	fi
}

# Sorry Apple..
function iwork () {
	if [ -e /Library/Preferences/com.apple.iWork09.plist ]; then
		rm -i /Library/Preferences/com.apple.iWork09.plist
	fi
}

## Overloading commands

alias ls='ls -Ga'
alias ll='ls -Gal'

alias ..='cd ..'
alias rm='rm -r'
alias tar='tar xzvf'

## Aliases to directories

alias d='cd ~/Desktop'
alias p='cd ~/Projects'
alias s='cd ~/Sites'
alias st='cd ~/Projects/studies'
