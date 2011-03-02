require 'rake'

IGNORE = [".", "..", ".git", ".gitignore", ".gitmodules", "Rakefile", "README.md", "aliases"]

namespace :install do
  desc "Link configs - WARNING: Overwriting your current files!"
  task :conf do
    current_directory = File.dirname(__FILE__)
    (Dir.entries(current_directory) - IGNORE).map do |c|
      puts "Linking #{c}..."
      system "ln -sf #{current_directory}/#{File.directory?(c) ? c + '/' : c } $HOME/.#{c} > /dev/null 2>&1"
    end
    puts "Add your GitHub token to OS X keychain with 'github.token' name"
  end

  desc "Fetch vim plugins"
  task :vim do
    system "git submodule update --init"
  end
end
