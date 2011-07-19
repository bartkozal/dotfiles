require 'rake'

IGNORE = [".", "..", ".git", "Rakefile", "README.md"]

desc "Force update configs"
task :update do
  current_directory = File.dirname(__FILE__)
  (Dir.entries(current_directory) - IGNORE).map do |c|
    puts "Update #{c}..."
    system "ln -sf #{current_directory}/#{File.directory?(c) ? c + '/' : c } $HOME/.#{c} > /dev/null 2>&1"
  end
  puts "Add your GitHub token to OS X keychain with 'github.token' name"
end