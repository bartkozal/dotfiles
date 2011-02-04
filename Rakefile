require 'rake'

CONFIGS = [:ackrc, :gitconfig, :gitignore, :irbrc, :livereload, :rvmrc, :vimrc, :zshrc]
GEMS = [:hirb, :livereload, :wirble]
VIM_PLUGINS = []

namespace :install do
  desc "Install dotfiles (WARNING: it's overwriting your existing files)"
  task :configs do
    puts "This task overwrite these files: #{CONFIGS.join(', ')}"
    puts "Are you sure? (yN)"
    # TODO
    puts "Now add your GitHub token to OS X keychain with 'github.token' name"
  end

  desc "Install requirement gems (#{GEMS.join(', ')})"
  task :gems do
    # TODO
  end
  
  desc "Fetch useful vim plugins"
  task :vim_plugins do
    # TODO
  end

  desc "Install configs, gems and vim plugins"
  task all: [:configs, :gems, :vim_plugins]
end
