# dotfiles

## Installation

    git clone git@github.com:bkozal/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    rake install:all

## Tasks

    rake install:all
        Install all (configs, gems, vim plugins)

    rake install:configs
        Link configs - WARNING: Overwriting your current configs!

    rake install:gems
        Install gems

    rake install:vim_plugins
        Fetch vim plugins
