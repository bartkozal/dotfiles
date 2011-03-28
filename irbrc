require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'
unless IRB.version.include?("DietRB")
  unless Gem.available?('wirble')
    system(%{gem install 'wirble'})
    Gem.refresh
  end
  require 'wirble'

  Wirble.init
  Wirble.colorize
end
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE

alias q exit
