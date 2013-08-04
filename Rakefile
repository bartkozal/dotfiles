require 'rake'

task :default => [:symlinks, :gems]

desc "Create symlinks to configs"
task :symlinks do
  def path file
    File.directory?(file) ? file + '/' : file
  end

  current_dir = File.dirname(__FILE__)
  symlinks = Dir.entries(current_dir) -
    [".", "..", ".git", ".gitignore", ".gitmodules",  "Rakefile"]
  symlinks.each do |file|
    `ln -sf #{current_dir}/#{path(file)} $HOME/.#{file} > /dev/null 2>&1`
    puts "#{file} linked"
  end
end

desc "Install ruby gems"
task :gems do
  gems = %w(bundler teamocil)
  gems.each do |gem|
    `gem install #{gem}`
    puts "#{gem} installed"
  end
end

