require 'rake'
require 'highline/import'

CONFIGS = ['ackrc', 'gitconfig', 'gitignore', 'irbrc', 'livereload', 'rvmrc', 'vimrc', 'zshrc']
GEMS = ['hirb', 'livereload', 'wirble']
VIM_PLUGINS = File.open(File.join(File.dirname(__FILE__), '.gitmodules')).read.scan(/bundle\/([\w\-_]*$)/).flatten

desc "Install dotfiles (WARNING: it's overwriting your existing files)"
task :install do
  say "<%= color('Config files:', :green) %> <%= list(CONFIGS, :inline, ' and ') %>"
  say "<%= color('Gems:', :green) %> <%= list(GEMS, :inline, ' and ') %>"
  say "<%= color('Vim plugins:', :green) %> <%= list(VIM_PLUGINS, :inline, ' and ') %>"
  say "<%= color(\"WARNING: it overwrite your existing files!\", :red) %>"
  if agree("Are you sure? [yn]")
    say "<%= color(\"Now add your GitHub token to OS X keychain with 'github.token' name\", :red) %>"
  else
    exit
  end
end