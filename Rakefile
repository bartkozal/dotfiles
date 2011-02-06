require 'rake'

CONFIGS = ['aliases', 'ackrc', 'gitconfig', 'gitignore', 'irbrc', 'livereload', 'rvmrc', 'vimrc', 'zshrc', 'vim/', 'zsh/']
GEMS = ['hirb', 'livereload', 'wirble']
VIM_PLUGINS = File.open(File.join(File.dirname(__FILE__), '.gitmodules')).read.scan(/bundle\/([\w\-_]*$)/).flatten

def list(const)
  const.join(", ")
end

namespace :install do
  desc "WARNING: Overwriting your current configs! Files to link: #{list(CONFIGS)}"
  task :configs do
    CONFIGS.map do |c|
      puts "Linking #{c}..."
      system "ln -sf #{File.dirname(__FILE__)}/#{c} $HOME/.#{c.delete('/')} > /dev/null 2>&1"
    end
    puts "Add your GitHub token to OS X keychain with 'github.token' name"
  end

  desc "Install gems: #{list(GEMS)}"
  task :gems do
    GEMS.map do |g|
      system "gem install #{g}"
    end
  end

  desc "Fetch vim plugins: #{list(VIM_PLUGINS)}"
  task :vim_plugins do
    system "git submodule update --init"
  end

  desc "Install all (configs, gems, vim plugins)"
  task :all => [:configs, :gems, :vim_plugins]
end
