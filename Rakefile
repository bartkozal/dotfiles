require 'rake'

CONFIGS = ['ackrc', 'gitconfig', 'gitignore', 'irbrc', 'livereload', 'rvmrc', 'vimrc', 'zshrc']
GEMS = ['hirb', 'livereload', 'wirble']
VIM_PLUGINS = File.open(File.join(File.dirname(__FILE__), '.gitmodules')).read.scan(/bundle\/([\w\-_]*$)/).flatten

desc "Install dotfiles (WARNING: it's overwriting your existing files)"
task :install do
  puts "Setup configs: #{CONFIGS.join(', ')}"
  puts "Install gems: #{GEMS.join(', ')}"
  puts "Fetch vim plugins: #{VIM_PLUGINS.join(', ')}"
  puts "Are you sure? (yN)"
  # TODO
  puts "Now add your GitHub token to OS X keychain with 'github.token' name"
end