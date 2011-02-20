require 'rake'

IGNORE = [".", "..", ".git", ".gitignore", ".gitmodules", "Rakefile", "README.md"]
GEMS = ['hirb', 'livereload', 'wirble']


namespace :install do
  desc "Link configs - WARNING: Overwriting your current configs!"
  task :configs do
    current_directory = File.dirname(__FILE__)
    (Dir.entries(current_directory) - IGNORE).map do |c|
      puts "Linking #{c}..."
      system "ln -sf #{current_directory}/#{File.directory?(c) ? c + '/' : c } $HOME/.#{c} > /dev/null 2>&1"
    end
    puts "Add your GitHub token to OS X keychain with 'github.token' name"
  end

  desc "Install gems"
  task :gems do
    GEMS.map do |g|
      system "gem install #{g}"
    end
  end

  desc "Fetch vim plugins"
  task :vim_plugins do
    system "git submodule update --init"
  end

  desc "Install all (configs, gems, vim plugins)"
  task :all => [:configs, :gems, :vim_plugins]
end
