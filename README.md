# dotfiles

## Description

    rake -D
    
    rake install:all
      Install all (configs, gems, vim plugins)
      
    rake install:configs
      WARNING: Overwriting your current configs! Files to link: aliases, ackrc, gitconfig, gitignore, irbrc, livereload, rvmrc, vimrc, zshrc, vim/, zsh/
      
    rake install:gems
      Install gems: hirb, livereload, wirble
      
    rake install:vim_plugins
      Fetch vim plugins: nerdtree, trailing-whitespace, ack, nerdcommenter, snipmate, matchit, gundo, fugitive, fuzzyfinder, l9, autoclose

## Installation

    git clone git@github.com:bkozal/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    rake install:all
