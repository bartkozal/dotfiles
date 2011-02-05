require 'rake'
require 'highline/import'

CONFIGS = ['ackrc', 'gitconfig', 'gitignore', 'irbrc', 'livereload', 'rvmrc', 'vimrc', 'vim', 'zshrc', 'zsh']
GEMS = ['hirb', 'livereload', 'wirble']
VIM_PLUGINS = File.open(File.join(File.dirname(__FILE__), '.gitmodules')).read.scan(/bundle\/([\w\-_]*$)/).flatten

desc "Install dotfiles (WARNING: it's overwriting your existing files)"
task :install do
  say "<%= color('Config files:', :green) %> <%= list(CONFIGS, :inline, ' and ') %>"
  say "<%= color('Gems:', :green) %> <%= list(GEMS, :inline, ' and ') %>"
  say "<%= color('Vim plugins:', :green) %> <%= list(VIM_PLUGINS, :inline, ' and ') %>"
  say "<%= color(\"WARNING: it overwrite your existing files!\", :red) %>"
  if agree("Are you sure? [yn]")
    CONFIGS.map do |c|
      say "Linking #{c} config..."
      system "ln -sf #{dirpath}/#{c} $HOME/.#{c} > /dev/null 2>&1"
    end
    GEMS.map do |g|
      say "Installing gem #{g}..."
      system "gem install #{g} > /dev/null 2>&1"
    end
    say "Fetching vim plugins..."
    system 'git submodule update --init > /dev/null 2>&1'
    say "<%= color(\"Now add your GitHub token to OS X keychain with 'github.token' name\", :red) %>"
  else
    exit
  end
end

def dirpath
  File.path(File.dirname(__FILE__))
end
