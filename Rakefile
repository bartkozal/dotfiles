require 'rake'

IGNORE = [".", "..", ".git", "Rakefile"]

desc "Force install configs"
task :install do
  def format_if_dir(file)
    File.directory?(file) ? file + '/' : file
  end

  current_dir = File.dirname(__FILE__)
  symlinks = (Dir.entries(current_dir) - IGNORE)
  symlinks.each do |f|
    system "ln -sf #{current_dir}/#{format_if_dir(f)} $HOME/.#{f} > /dev/null 2>&1"
  end
  puts "Created symlinks:"
  puts symlinks.join(", ")
end